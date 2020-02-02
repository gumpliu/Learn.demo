package com.gump.activity.repository;

import com.gump.activity.util.ObjectUtil;
import com.gump.activity.vo.ProcessInstancesVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 流程实例操作
 * @author: gumpliu
 * @create: 2019-06-04 15:05
 **/
@Repository
public class ProcessInstancesRepository  extends BaseNativeSqlRepository  {

    /**
     * 获取运行时代办任务
     *
     * @param map
     * @param userId
     * @return
     */
    public List<ProcessInstancesVo> listProcessInstances(Map<String,String> map){

        String sql = "SELECT \n" +
                     "  ahp.`PROC_INST_ID_`,ahp.`PROC_DEF_ID_`,arp.`NAME_`,ahp.`START_TIME_`,ahp.`END_TIME_`, \n" +
                     "  ahp.`START_USER_ID_`,are.`IS_ACTIVE_`,are.`SUSPENSION_STATE_`\n" +
                     "FROM\n" +
                     "  `act_hi_procinst` AS ahp \n" +
                     "  LEFT JOIN `act_ru_execution` AS are ON are.`ID_` = ahp.`ID_` \n" +
                     "  INNER JOIN `act_re_procdef` AS arp ON arp.`ID_` = ahp.`PROC_DEF_ID_` ";

        //TODO 会出现sql注入问题，稍后解决
        List<Object[]> objectsList = sqlArrayList(sql);

        List<ProcessInstancesVo> taskVos = new ArrayList<ProcessInstancesVo>();

        for(Object[] objects : objectsList){
            ProcessInstancesVo vo = new ProcessInstancesVo();
            vo.setProcInstId(ObjectUtil.isEmptory(objects[0]) ? "" : objects[0].toString());
            vo.setProcDefId(ObjectUtil.isEmptory(objects[1]) ? "" : objects[1].toString());
            vo.setProcessName(ObjectUtil.isEmptory(objects[2]) ? "" : objects[2].toString());
            vo.setStartTime(ObjectUtil.isEmptory(objects[3]) ? "" : objects[3].toString());
            vo.setEndTime(ObjectUtil.isEmptory(objects[4]) ? "" : objects[4].toString());
            vo.setStartUserId(ObjectUtil.isEmptory(objects[5]) ? "" : objects[5].toString());
            vo.setIsActive(ObjectUtil.isEmptory(objects[6]) ? "" : objects[6].toString());
            vo.setSuspensionState(ObjectUtil.isEmptory(objects[7]) ? "" : objects[7].toString());

            taskVos.add(vo);
        }


        return taskVos;
    }
}
