package com.gump.activity.service;

import com.gump.activity.repository.ProcessInstancesRepository;
import com.gump.activity.vo.ProcessInstancesVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 流程实例相关操作
 * @author: gumpliu
 * @create: 2019-06-04 14:55
 **/
@Service
public class ProcessInstancesService {
    Logger logger = LoggerFactory.getLogger(ProcessInstancesService.class);

    @Autowired
    ProcessInstancesRepository processInstancesRepository;

    /**
     * 获取流程实现列表
     *
     * @param paramsMap
     * @return
     */
    public List<ProcessInstancesVo> listProcessInstances(Map<String, String> paramsMap){

        return processInstancesRepository.listProcessInstances(paramsMap);


    }

}
