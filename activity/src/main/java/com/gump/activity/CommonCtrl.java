package com.gump.activity;

import com.gump.activity.bean.PageVo;
import com.gump.activity.bean.TaskVo;
import com.gump.activity.service.ProcessInstanceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

@Controller
@Api(tags="流程CommonAPI")
public class CommonCtrl {

	@Autowired
	private ProcessInstanceService processInstanceService;
	
	@RequestMapping("/qeryPd")
	@ApiOperation(value="流程定义查询")
	public String queryProcessDefinition(HttpServletRequest request, Model model) {
		List<ProcessDefinition> pdList = processInstanceService.queryProcessDefinition();
        model.addAttribute("list", pdList);
		return "pd_list";
	}
	
	
	/**
     * 根据流程定义ID或任务ID返回对应表单视图
     *
     * @param request
     * @param model
     * @return string
     */
	@RequestMapping("/toForm")
	public String toForm(HttpServletRequest request, Model model) {
		String processDefinitionId = request.getParameter("processDefinitionId");
		String taskId = request.getParameter("taskId");
		Object form_Data = "";
		if(null != processDefinitionId && processDefinitionId.length() != 0) {
			//判断StartFormKey
			if(processInstanceService.hasStartFormKey(processDefinitionId)) 
				form_Data = processInstanceService.getStartFormData(processDefinitionId);
			model.addAttribute("processDefinitionId", processDefinitionId);
		}else {
			form_Data = processInstanceService.getTaskFormData(taskId);
			model.addAttribute("taskId", taskId);
		}
        model.addAttribute("form_Data", form_Data);
		return "form";
	}
	
	@RequestMapping("/saveForm")
	@ResponseBody
	public String saveForm(HttpServletRequest request) {
		//如果只有流程定义Id就证明是开启流程
		String processDefinitionId = request.getParameter("processDefinitionId");
		String processInstaceId = request.getParameter("processInstaceId");
		String taskId = request.getParameter("taskId");
		Map<String, String[]> parameterMap = request.getParameterMap();
		Map<String,String> properties = new HashMap<String,String>();
		Iterator<Entry<String, String[]>> it = parameterMap.entrySet().iterator();
		while(it.hasNext()) {
			Entry<String, String[]> next = it.next();
			if(!next.getKey().equals("processDefinitionId") && !next.getKey().equals("taskId"))
			properties.put(next.getKey(), (next.getValue())[0]);
		}
		if(null != processDefinitionId && processDefinitionId.length() != 0) {
			//开启流程  
			ProcessInstance processInstance = processInstanceService.submitStartFormData(processDefinitionId, "", new HashMap<String,String>());
			processInstaceId = processInstance.getId();
			//获取第一个任务
			taskId = processInstanceService.getTaskByProcessInstanceId(processInstance.getId()).get(0).getId();
		}
		//完成任务
		processInstanceService.completeTask(processInstaceId, taskId, properties);
		return "办理成功！！！";
	}
	
	@RequestMapping("/queryTask")
	public String queryTask(HttpServletRequest request, Model model) {
        model.addAttribute("processDefinitionId", request.getParameter("processDefinitionId"));
        model.addAttribute("userId", request.getParameter("userId"));
        model.addAttribute("type", request.getParameter("type"));
		return "doTask";
	}
	
	@RequestMapping("/queryTaskByJson")
	@ResponseBody
	public PageVo<TaskVo> queryTaskByJson(HttpServletRequest request) {
		List<TaskVo> list = processInstanceService.queryTask(request.getParameter("processDefinitionId"));
		PageVo<TaskVo> page = new PageVo<TaskVo>();
        page.setTotal(list.size());
        page.setData(list);
		return page;
	}
	
	@RequestMapping("/test")
	public String test(HttpServletRequest request, Model model) {
		model.addAttribute("processDefinitionId", request.getParameter("processDefinitionId"));
		return "form2";
	}

	/*@RequestMapping("/qeryPd")
	public String queryProcessDefinition(HttpServletRequest request,Model model) {
		List<ProcessDefinition> pdList = processInstanceService.queryProcessDefinition();
		ArrayList<ProcessDefinitionVo> list = new ArrayList<ProcessDefinitionVo>(pdList.size());
		StringBuffer sb = request.getRequestURL();
		//获取url的方式会更改因为不同工程的spring上下文不一样
		String uri = sb.substring(0,sb.lastIndexOf("/") + 1);
		for(ProcessDefinition pd : pdList) {
			list.add(new ProcessDefinitionVo(pd.getId(),pd.getKey(),pd.getVersion(),uri+processInstanceService.getFormKey(pd.getId())));
		}
        model.addAttribute("list", list);
		return "pd_list";
	}
	
	@RequestMapping("/start")
	public String start(HttpServletRequest request, Model model) {
		model.addAttribute("processDefinitionId", request.getParameter("processDefinitionId"));
		String form_url = processInstanceService.getFormKey(request.getParameter("processDefinitionId"));
		return form_url;
	}*/
	
}
