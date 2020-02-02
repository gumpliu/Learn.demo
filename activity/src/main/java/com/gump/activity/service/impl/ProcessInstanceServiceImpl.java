package com.gump.activity.service.impl;

import com.gump.activity.bean.TaskVo;
import com.gump.activity.requestbody.VacationActionRequest;
import com.gump.activity.service.ProcessInstanceService;
import com.gump.activity.service.VacationTaskService;
import org.activiti.engine.FormService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ProcessInstanceServiceImpl implements ProcessInstanceService {

	private static final Logger logger = LoggerFactory.getLogger(ProcessInstanceServiceImpl.class);
	
	@Autowired
	private RuntimeService runtimeService;
	
	@Autowired
	private RepositoryService repositoryService;
	
	@Autowired
	private FormService formService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	VacationTaskService vacationTaskService;
	
	@Override
	public String getFormKey(String processDefinitionId) {
		// TODO Auto-generated method stub
		return formService.getStartFormKey(processDefinitionId);
	}

	@Override
	public List<ProcessDefinition> queryProcessDefinition() {
		// TODO Auto-generated method stub
		return repositoryService.createProcessDefinitionQuery().list();
	}

	@Override
	public ProcessInstance submitStartFormData(String processDefinitionId, String businessKey, Map<String, String> properties) {
		// TODO Auto-generated method stub
		return formService.submitStartFormData(processDefinitionId, businessKey, properties);
	}

	@Override
	public boolean hasStartFormKey(String processDefinitionId) {
		// TODO Auto-generated method stub
		ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
		return processDefinition.hasStartFormKey();
	}

	@Override
	public Object getStartFormData(String processDefinitionId) {
		// TODO Auto-generated method stub
		return formService.getRenderedStartForm(processDefinitionId);
	}

	/**
	 * 添加评论信息
	 *
	 * @param message
	 * @param isSaveProcessInstanceId
	 * @param taskId
	 */
	private void addComment(String message, boolean isSaveProIn, String taskId){
		if(!StringUtils.isEmpty(message)){
			String processInstanceId = null;
			if (isSaveProIn) {
				Task taskEntity = taskService.createTaskQuery().taskId(taskId).singleResult();
				processInstanceId = taskEntity.getProcessInstanceId();
			}
			taskService.addComment(taskId, processInstanceId, message);
		}
	}
	
	@Override
	@Transactional
	public void completeTask(String processInstaceId, String taskId, Map<String, String> properties) {
		// TODO Auto-generated method stub
		//添加评论信息
		addComment(properties.get("message"), true, taskId);
		//提交任务
		formService.submitTaskFormData(taskId, properties);
		//关联业务操作
		VacationActionRequest vacationActionRequest = new VacationActionRequest();
		vacationActionRequest.setFcode(properties.get("fcode"));
		vacationActionRequest.setFname(properties.get("fname"));
		vacationActionRequest.setFapplyuser(properties.get("fapplyuser"));
		vacationActionRequest.setFapplytype(properties.get("fapplytype"));
		vacationActionRequest.setFbegindate(properties.get("fbegindate"));
		vacationActionRequest.setFenddate(properties.get("fenddate"));
		vacationActionRequest.setFapplyreason(properties.get("fapplyreason"));
		vacationTaskService.completeVacationTask(processInstaceId, taskId, vacationActionRequest);
	}

	@Override
	public Object getTaskFormData(String taskId) {
		// TODO Auto-generated method stub
		TaskFormData taskFormData = formService.getTaskFormData(taskId);
		//获取已经渲染的表单数据
		return formService.getRenderedTaskForm(taskId);
	}

	@Override
	public List<TaskVo> queryTask(String processDefinitionId) {
		// TODO Auto-generated method stub
		List<Task> list = taskService.createTaskQuery().processDefinitionId(processDefinitionId).list();
		ArrayList<TaskVo> arrayList = new ArrayList<TaskVo>(list.size());
		for(Task task:list) {
			TaskVo taskVo = new TaskVo();
			taskVo.setId(task.getId());
			taskVo.setName(task.getName());
			taskVo.setProcessDefinitionId(task.getProcessDefinitionId());
			taskVo.setProcessInstanceId(task.getProcessInstanceId());
			taskVo.setCreateTime(task.getCreateTime());
			taskVo.setDueDate(task.getDueDate());
			arrayList.add(taskVo);
		}
		return arrayList;
	}

	@Override
	public List<Task> getTaskByProcessInstanceId(String processInstanceId) {
		// TODO Auto-generated method stub
		return taskService.createTaskQuery().processInstanceId(processInstanceId).list();
	}

}
