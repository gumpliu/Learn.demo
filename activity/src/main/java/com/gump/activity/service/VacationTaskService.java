package com.gump.activity.service;

import com.gump.activity.entity.HiVacation;
import com.gump.activity.entity.Vacation;
import com.gump.activity.repository.vacation.HiVacationRepositry;
import com.gump.activity.repository.vacation.VacationRepositry;
import com.gump.activity.repository.vacation.VacationTaskRepository;
import com.gump.activity.requestbody.Page;
import com.gump.activity.requestbody.VacationActionRequest;
import com.gump.activity.vo.VacationVo;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 业务相关操作
 * @author: gumpliu
 * @create: 2019-06-05 13:14
 **/
@Service
public class VacationTaskService {

    Logger logger = LoggerFactory.getLogger(VacationTaskService.class);

    @Autowired
    VacationRepositry vacationRepositry;

    @Autowired
    HiVacationRepositry hiVacationRepositry;

    @Autowired
    RuntimeService runtimeService;

    @Autowired
    TaskService taskService;

    @Autowired
    VacationTaskRepository vacationTaskRepository;


    /**
     * 获取列表
     *
     * @param paramMap
     */
    public List<VacationVo> listVacationTasks(Map<String, Object> paramMap, String userId, Page page){

        return vacationTaskRepository.listVacationTask(paramMap, page, userId);
    }

    /**
     * 获取列表总条数
     *
     * @param paramMap
     */
    public int countVacationTasks(Map<String, Object> paramMap, String userId){

        return vacationTaskRepository.countVacationTask(paramMap, userId);
    }


    /**
     * 获取历史代办任务
     *
     * @param paramMap
     */
    public List<VacationVo> listHiVacationTasks(Map<String, Object> paramMap, String userId, Page page){

        return vacationTaskRepository.listHiVacationTask(paramMap, userId, page);
    }

    /**
     * 获取历史代办任务总条数
     *
     * @param paramMap
     */
    public int countHiVacationTasks(Map<String, Object> paramMap, String userId){

        return vacationTaskRepository.countHiVacationTask(paramMap, userId);
    }




    /**
     * flow complete 业务关联表相关操作
     *
     * @param processInstanceId
     */
    @Transactional
    public void completeVacationTask(String processInstanceId, String taskId, VacationActionRequest ar){

        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
                .processInstanceId(processInstanceId).singleResult();
        Vacation vacation;
        if(StringUtils.isEmpty(ar.getFcode())){
            vacation = vacationRepositry.findByTaskId(taskId);
            vacation.setId(null);
        }else{
            vacation = new Vacation(taskId, ar.getFcode(), ar.getFname(), ar.getFapplyuser(),
                    ar.getFapplytype(), ar.getFbegindate(), ar.getFenddate(), ar.getFapplyreason());
        }
        if(null != taskId)
           deleteVacationTask(taskId);

        if(processInstance != null){
            List<Task> taskList = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
            for(Task task : taskList){
                vacation.setTaskId(task.getId());
                inserHiVacationTask(vacation);
                inserVacationTask(vacation);
            }
        }
    }

    /**
     * 保存业务数据
     *
     * @param vacation
     */
    public void inserVacationTask(Vacation vacation){
        logger.info("OrderTaskService.inserVacationTask params vacation={}", vacation.toString());
        vacationRepositry.save(vacation);
    }

    /**
     * 删除业务数据
     *
     * @param taskId
     */
    public void deleteVacationTask(String taskId){

        logger.info("OrderTaskService.deleteOrderTask start params taskId={}", taskId);

        vacationRepositry.deleteByTaskId(taskId);
    }

    /**
     * 保存历史业务数据
     *
     * @param vacation
     */
    public void inserHiVacationTask(Vacation vacation){

        logger.info("OrderTaskService.inserHiOrderTask start params vacation={}", vacation.toString());

        HiVacation hiOrderTask = new HiVacation(vacation);

        hiVacationRepositry.save(hiOrderTask);
    }

}
