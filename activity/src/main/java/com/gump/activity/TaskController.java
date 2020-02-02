package com.gump.activity;

import com.gump.activity.bean.PageVo;
import com.gump.activity.requestbody.CommentRequest;
import com.gump.activity.requestbody.Page;
import com.gump.activity.requestbody.TaskOrderActionRequest;
import com.gump.activity.requestbody.VacationActionRequest;
import com.gump.activity.service.OrderTaskService;
import com.gump.activity.service.TaskNewService;
import com.gump.activity.service.VacationTaskService;
import com.gump.activity.vo.VacationVo;
import org.activiti.engine.ActivitiObjectNotFoundException;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.activiti.rest.common.api.DataResponse;
import org.activiti.rest.service.api.runtime.task.TaskActionRequest;
import org.activiti.rest.service.api.runtime.task.TaskBaseResource;
import org.activiti.rest.service.api.runtime.task.TaskResource;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 任务相关操作（如：审批、查询列表等）
 * @author: gumpliu
 * @create: 2019-05-31 11:44
 **/
@RestController
public class TaskController extends TaskBaseResource {

    private static final Logger logger = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    TaskNewService taskNewService;

    @Autowired
    OrderTaskService orderTaskService;

    @Autowired
    VacationTaskService vacationTaskService;

    @Autowired
    TaskResource taskResource;

    @RequestMapping(value="/runtime/tasks/new/{taskId}", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void executeTaskActionNew(@PathVariable String taskId, @RequestBody TaskOrderActionRequest actionRequest) {

        Task task = executeTask(taskId, actionRequest);

        if (TaskActionRequest.ACTION_COMPLETE.equals(actionRequest.getAction())) {
            orderTaskService.completeOrderTask(task.getProcessInstanceId(), taskId, actionRequest.getCreater(), actionRequest.getOrderName());
        }
    }

    @RequestMapping(value="/runtime/tasks/vacation/{taskId}", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    public void executeVacationTaskAction(@PathVariable String taskId, @RequestBody VacationActionRequest actionRequest) {

        Task task = executeTask(taskId, actionRequest);

        if (TaskActionRequest.ACTION_COMPLETE.equals(actionRequest.getAction())) {
            vacationTaskService.completeVacationTask(task.getProcessInstanceId(), taskId, actionRequest);
        }
    }

    /**
     * 获取任务列表，任务获取
     *
     * todo 后期支持分页查询
     *
     * @param requestParams
     * @param httpRequest
     * @param type 0-待办任务，1-已办任务
     * @return
     */
    @RequestMapping(value="/runtime/tasks/new", method = RequestMethod.GET, produces="application/json")
    public DataResponse getTasks(@RequestParam Integer type,
                                 @RequestParam Map<String, Object> requestParams,
                                 @RequestParam String userId,
                                 @RequestParam Integer pageNumber,
                                 @RequestParam Integer pageSize,
                                 HttpServletRequest httpRequest) {

        logger.info("TaskController.getTasks start params = {}", requestParams.toString());

        DataResponse response = new DataResponse();
        if(StringUtils.isEmpty(userId)){
            return response;
        }

        Page page =  new Page(pageNumber, pageSize);

        if(type == 0){
            response.setData(taskNewService.listTask(requestParams, userId,page));
            response.setTotal(taskNewService.countTask(requestParams, userId));

        }else{
            response.setData(taskNewService.listHistoryTask(requestParams, userId, page));
            response.setTotal(taskNewService.countHistoryTask(requestParams, userId));
        }

        response.setSize(page.getPageSize());
        response.setStart(page.getPageNumberSize());

        logger.info("TaskController.getTasks end response = {}", response.toString());

        return response;
    }


    /**
     * 获取任务列表，任务获取
     *
     * todo 后期支持分页查询
     *
     * @param requestParams
     * @param httpRequest
     * @param type 0-待办任务，1-已办任务
     * @return
     */
    @RequestMapping(value="/runtime/vacation/task", method = RequestMethod.POST)
    public PageVo<VacationVo> findVacationTask(@RequestParam Integer type,
                                               @RequestParam Map<String, Object> requestParams,
                                               @RequestParam String userId,
                                               @RequestParam String processDefinitionId,
                                               @RequestParam Integer _startRow,
                                               @RequestParam Integer _rowCount,
                                               HttpServletRequest httpRequest) {

        logger.info("TaskController.findVacationTask start params = {}", requestParams.toString());
        PageVo<VacationVo> response = new PageVo();
        if(StringUtils.isEmpty(userId)){
            return response;
        }
        Page page =  new Page(Integer.parseInt(requestParams.get("_startRow").toString()), Integer.parseInt(requestParams.get("_rowCount").toString()));

        requestParams.put("procDefId", processDefinitionId);

        if(type == 0){
            response.setData(vacationTaskService.listVacationTasks(requestParams, userId,page));
            response.setTotal(vacationTaskService.countVacationTasks(requestParams, userId));

        }else{
            response.setData(vacationTaskService.listHiVacationTasks(requestParams, userId, page));
            response.setTotal(vacationTaskService.countHiVacationTasks(requestParams, userId));
        }

        response.setStartRow(page.getPageNumber());
        response.setRowCount(page.getPageSize());

        logger.info("TaskController.getTasks end response = {}", response.toString());

        return response;
    }


    /**
     * 添加评论信息
     *
     * @param actionCode
     * @param taskId
     * @param message
     * @param isSaveProcessInstanceId
     */
    private void addComment(String actionCode, String taskId, String message, boolean isSaveProcessInstanceId){
        if (TaskActionRequest.ACTION_COMPLETE.equals(actionCode)) {
            if(!StringUtils.isEmpty(message)){
                String processInstanceId = null;
                if (isSaveProcessInstanceId) {
                    Task taskEntity = taskService.createTaskQuery().taskId(taskId).singleResult();
                    processInstanceId = taskEntity.getProcessInstanceId();
                }
                Comment createdComment = taskService.addComment(taskId, processInstanceId, message);
                restResponseFactory.createRestComment(createdComment);
            }
        }
    }

    /**
     * 操作任务及添加评论
     *
     * @param taskId
     * @param actionRequest
     */
    public Task executeTask(String taskId, CommentRequest actionRequest) {

        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        if (task == null) {
            throw new ActivitiObjectNotFoundException("Could not find a task with id '" + taskId + "'.", Task.class);
        }

        addComment(actionRequest.getAction(), taskId, actionRequest.getMessage(), actionRequest.isSaveProcessInstanceId());

        taskResource.executeTaskAction(taskId, actionRequest);

        return task;
    }
}
