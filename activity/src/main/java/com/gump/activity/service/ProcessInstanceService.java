package com.gump.activity.service;

import com.gump.activity.bean.TaskVo;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

import java.util.List;
import java.util.Map;

public interface ProcessInstanceService {
	
	List<ProcessDefinition> queryProcessDefinition();
	
	boolean hasStartFormKey(String processDefinitionId);
	
	Object getStartFormData(String processDefinitionId);
	
	Object getTaskFormData(String taskId);

	String getFormKey(String processDefinitionId);
	
	ProcessInstance submitStartFormData(String processDefinitionId, String businessKey, Map<String, String> properties);
	
	List<TaskVo> queryTask(String processDefinitionId);

	void completeTask(String processInstaceId, String taskId, Map<String, String> properties);
	
	List<Task> getTaskByProcessInstanceId(String processInstanceId);
}
