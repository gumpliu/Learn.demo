package com.gump.activity.repository;

import com.gump.activity.requestbody.Page;
import com.gump.activity.util.ObjectUtil;
import com.gump.activity.vo.TaskHistoryVo;
import com.gump.activity.vo.TaskVo;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Parameter;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.*;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 流程任务查询
 * @author: gumpliu
 * @create: 2019-06-03 16:24
 **/
@Repository
public class TaskRepository {

    @PersistenceUnit
    private EntityManagerFactory emf;

    /**
     * 获取运行时待办任务总条数
     *
     * @param map
     * @param userId
     * @return
     */
    public int countTask(Map<String,Object> map, String userId){
        String sql = "SELECT count(DISTINCT art.`ID_`) ";

        userPutMap(map, userId);

        return  ((BigInteger)getQuery(appendTskSql(sql, map), map).getSingleResult()).intValue();
    }

    /**
     * 获取运行时代办任务
     *
     * @param map
     * @param userId
     * @return
     */
    public List<TaskVo> listTask(Map<String,Object> map, Page page, String userId){

        pagePutMap(map, page);

        userPutMap(map, userId);

        String sql = "SELECT DISTINCT art.`ID_`, art.`CREATE_TIME_`, art.`ASSIGNEE_`, art.`NAME_` as taskName, art.`PROC_INST_ID_`, art.`PROC_DEF_ID_`, arp.`NAME_`, tot.`creater`, tot.`order_name` ";

        List<Object[]> objectsList = getQuery(appendTskSql(sql, map), map).getResultList();

        List<TaskVo> taskVos = new ArrayList<TaskVo>();

        for(Object[] objects : objectsList){
            TaskVo vo = new TaskVo();
            vo.setTaskId(ObjectUtil.isEmptory(objects[0]) ? "" : objects[0].toString());
            vo.setCreateTaskDate(ObjectUtil.isEmptory(objects[1]) ? "" : objects[1].toString());
            vo.setAssigenee(ObjectUtil.isEmptory(objects[2]) ? "" : objects[2].toString());
            vo.setTaskName(ObjectUtil.isEmptory(objects[3]) ? "" : objects[3].toString());
            vo.setProcInstId(ObjectUtil.isEmptory(objects[4]) ? "" : objects[4].toString());
            vo.setProcDefId(ObjectUtil.isEmptory(objects[5]) ? "" : objects[5].toString());
            vo.setProDefName(ObjectUtil.isEmptory(objects[6]) ? "" : objects[6].toString());
            vo.setCreater(ObjectUtil.isEmptory(objects[7]) ? "" : objects[7].toString());
            vo.setOrderName(ObjectUtil.isEmptory(objects[8]) ? "" : objects[8].toString());

            taskVos.add(vo);
        }


        return taskVos;
    }

    /**
     * 获取运行时待办任务sql拼接
     *
     * @param sql
     * @param map
     * @param userId
     * @return
     */
    private String appendTskSql(String sql, Map<String, Object> map){
        Map paramMap = new HashMap();

        sql +=    " FROM act_ru_task AS art,"
                + "     t_vacation AS tv,"
                + "     act_re_procdef AS arp,"
                + "     act_ru_identitylink AS ari,"
                + "     act_id_user AS aiu, "
                + "     act_id_membership AS aim "
                + " WHERE art.ID_ = tv.task_id "
                + "     AND art.PROC_DEF_ID_ = arp.ID_  "
                + "     AND aiu.ID_ = aim.USER_ID_ "
                + "     AND ((art.`ASSIGNEE_` = ari.`USER_ID_` AND art.`PROC_INST_ID_` = ari.`PROC_INST_ID_`) "
                + "     OR (art.`ASSIGNEE_` IS NULL AND ari.`GROUP_ID_` = aim.`GROUP_ID_` AND ari.TASK_ID_ = art.ID_)) ";

        if(!ObjectUtil.isEmptory(map.get("userId"))){
            sql += " AND aiu.ID_ = :userId ";
        }

        if(!ObjectUtil.isEmptory(map.get("taskName"))){
            sql += " and art.NAME_= :taskName ";
        }
        if(!ObjectUtil.isEmptory(map.get("assignee"))){
            sql += " and art.ASSIGNEE_= :assignee ";
        }
        if(!ObjectUtil.isEmptory(map.get("orderName"))){
            sql += " and tot.`order_name` = :orderName ";
        }
        if(!ObjectUtil.isEmptory(map.get("procInstId"))){
            sql += " and art.PROC_INST_ID_= :procInstId ";
        }
        if(!ObjectUtil.isEmptory(map.get("procDefId"))){
            sql += " and art.PROC_DEF_ID_= :procDefId ";
        }
        if(!ObjectUtil.isEmptory(map.get("procDefName"))){
            sql += " and arp.`NAME_` = :procDefName ";
        }
        if(!ObjectUtil.isEmptory(map.get("pageNumberSize")) && !ObjectUtil.isEmptory(map.get("pageSize"))){
            sql +=  " limit :pageNumberSize , :pageSize ";
        }

        return sql;

    }

    /**
     * 获取已办任务总条数
     *
     * @param map
     * @param userId
     * @return
     */
    public int countHistorTask(Map<String,Object> map, String userId){
        String sql = "SELECT count(*) \n";

        userPutMap(map, userId);

        return  ((BigInteger)getQuery(appendHistoryTaskSql(sql, map), map).getSingleResult()).intValue();
    }


    /**
     * 获取已办任务
     *
     * @param map
     * @param userId
     * @return
     */
    public List<TaskHistoryVo> listHistoryTask(Map<String,Object> map, String userId, Page page){

        String sql = "SELECT aht.`ID_`, aht.`ASSIGNEE_`,aht.`NAME_`,aht.`START_TIME_`,aht.`END_TIME_`\n";

        userPutMap(map, userId);

        pagePutMap(map, page);

        List<Object[]> objectsList = getQuery(appendHistoryTaskSql(sql, map), map).getResultList();

        List<TaskHistoryVo> taskVos = new ArrayList<TaskHistoryVo>();

        for(Object[] objects : objectsList){
            TaskHistoryVo vo = new TaskHistoryVo();
            vo.setTaskId(ObjectUtil.isEmptory(objects[0]) ? "" : objects[0].toString());
            vo.setAssigenee(ObjectUtil.isEmptory(objects[1]) ? "" : objects[1].toString());
            vo.setTaskName(ObjectUtil.isEmptory(objects[2]) ? "" : objects[2].toString());
            vo.setCreateTaskDate(ObjectUtil.isEmptory(objects[3]) ? "" : objects[3].toString());
            vo.setEndDate(ObjectUtil.isEmptory(objects[4]) ? "" : objects[4].toString());

            taskVos.add(vo);
        }


        return taskVos;
    }


    /**
     * 获取历史任务sql
     *
     * @param sql
     * @param map
     * @param userId
     * @return
     */
    public String appendHistoryTaskSql(String sql, Map<String,Object> map){
        sql +=  "FROM\n" +
                "  act_hi_taskinst AS aht,\n" +
                "  act_id_user AS aiu,\n" +
                "  act_hi_procinst AS ahp,\n" +
                "  t_hi_order_task AS thot \n" +
                "WHERE aht.`ASSIGNEE_` = aiu.`ID_` \n" +
                "  AND aht.`PROC_INST_ID_` = ahp.`PROC_INST_ID_`\n" +
                "  AND aht.`END_TIME_` IS NOT NULL \n" +
                "  AND thot.`task_id` = aht.`ID_`\n";

        if(!ObjectUtil.isEmptory(map.get("userId"))){
            sql += " AND aiu.ID_ = :userId ";
        }

        if(!ObjectUtil.isEmptory(map.get("taskName"))){
            sql += " and aht.NAME_= :taskName ";
        }
        if(!ObjectUtil.isEmptory(map.get("taskId"))){
            sql += " and aht.ID_= :taskId ";
        }
        if(!ObjectUtil.isEmptory(map.get("pageNumberSize")) && !ObjectUtil.isEmptory(map.get("pageSize"))){
            sql +=  " limit :pageNumberSize, :pageSize ";
        }

        return sql;
    }


    private Map<String, Object> userPutMap(Map<String, Object> map, String userId){
        map.put("userId", userId);
        return map;
    }

    private Map<String, Object> pagePutMap(Map<String, Object> map, Page page){
        map.put("pageNumberSize", page.getPageNumberSize());
        map.put("pageSize", page.getPageSize());

        return map;
    }

    private Query getQuery(Query query, Map<String, Object> map) {
        Set<Parameter<?>> set  = query.getParameters();
        if (!set.isEmpty()) {
            for(Parameter parameter : set){
                query.setParameter(parameter.getName(), map.get(parameter.getName()));
            }
        }
        return query;
    }

    private Query getQuery(String sql, Map<String, Object> map){
        Query query =  emf.createEntityManager().createNativeQuery(sql);
        return getQuery(query, map);
    }

    private Query getNameQuery(String sql, Map<String, Object> map, Class clazz) {
        Query query = emf.createEntityManager().createNamedQuery(sql, clazz);
        return getQuery(query, map);
    }

}
