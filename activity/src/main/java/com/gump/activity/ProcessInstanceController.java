package com.gump.activity;

import com.gump.activity.service.ProcessInstancesService;
import org.activiti.rest.common.api.DataResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 流程相关操作（如开启流程）
 * @author: gumpliu
 * @create: 2019-05-31 11:27
 **/
@RestController
public class ProcessInstanceController {

    private static final Logger logger = LoggerFactory.getLogger(ProcessInstanceController.class);

    @Autowired
    ProcessInstancesService processInstancesService;


    /**
     * 获取流程实例列表
     *
     * todo 后期支持分页查询
     *
     * @param requestParams
     * @param httpRequest
     * @return
     */
    @RequestMapping(value="/runtime/process-instances/new", method = RequestMethod.GET, produces="application/json")
    public DataResponse listProcessInstances(@RequestParam Map<String, String> requestParams,
                                             @RequestParam Integer pageNumber,
                                             @RequestParam Integer pageSize,
                                             HttpServletRequest httpRequest) {

        logger.info("ProcessInstanceController.listProcessInstances start params = {}", requestParams.toString());

        DataResponse response = new DataResponse();

        response.setData(processInstancesService.listProcessInstances(requestParams));

        logger.info("ProcessInstanceController.listProcessInstances end response = {}", response.toString());

        return response;
    }
}
