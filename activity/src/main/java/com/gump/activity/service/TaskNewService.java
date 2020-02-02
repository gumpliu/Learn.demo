package com.gump.activity.service;

import com.gump.activity.entity.ActIdMembership;
import com.gump.activity.repository.ActIdMembershipRepository;
import com.gump.activity.repository.TaskRepository;
import com.gump.activity.requestbody.Page;
import com.gump.activity.vo.TaskHistoryVo;
import com.gump.activity.vo.TaskVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 任务相关操作
 * @author: gumpliu
 * @create: 2019-06-03 16:13
 **/
@Service
public class TaskNewService {

    Logger logger = LoggerFactory.getLogger(TaskNewService.class);

    @Autowired
    ActIdMembershipRepository actIdMembershipRepository;

    @Autowired
    TaskRepository taskRepository;

    /**
     * 获取列表
     *
     * @param paramMap
     */
    public List<TaskVo> listTask(Map<String, Object> paramMap, String userId, Page page){

        //todo 需要验证用户是否存在，如超级用户需要是否需要有查看权限
        List<ActIdMembership> userGroups = actIdMembershipRepository.findByUserId(userId);

        if(CollectionUtils.isEmpty(userGroups)){
            return Collections.EMPTY_LIST;
        }


        return taskRepository.listTask(paramMap, page, userId);

    }

    /**
     * 获取列表总条数
     *
     * @param paramMap
     */
    public int countTask(Map<String, Object> paramMap, String userId){

        return taskRepository.countTask(paramMap, userId);

    }


    /**
     * 获取历史代办任务
     *
     * @param paramMap
     */
    public List<TaskHistoryVo> listHistoryTask(Map<String, Object> paramMap, String userId, Page page){

        //todo 需要验证用户是否存在，如超级用户需要是否需要有查看权限
        List<ActIdMembership> userGroups = actIdMembershipRepository.findByUserId(userId);

        if(CollectionUtils.isEmpty(userGroups)){
            return Collections.EMPTY_LIST;
        }


        return taskRepository.listHistoryTask(paramMap, userId, page);

    }

    /**
     * 获取历史代办任务总条数
     *
     * @param paramMap
     */
    public int countHistoryTask(Map<String, Object> paramMap, String userId){

        return taskRepository.countHistorTask(paramMap, userId);

    }

}
