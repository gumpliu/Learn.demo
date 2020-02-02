package com.gump.activity.repository.vacation;

import com.gump.activity.requestbody.Page;
import com.gump.activity.util.ObjectUtil;
import com.gump.activity.vo.VacationVo;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Parameter;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @program: com.yss.sofa.simpleflow
 * @description: 流程任务查询
 * @author: gumpliu
 * @create: 2019-06-03 16:24
 **/
@Repository
public class VacationTaskRepository {

    @PersistenceUnit
    private EntityManagerFactory emf;

    /**
     * 获取运行时待办任务总条数
     *
     * @param map
     * @param userId
     * @return
     */
    public int countVacationTask(Map<String,Object> map, String userId){
        String sql = "SELECT count(DISTINCT art.`ID_`) ";

        userPutMap(map, userId);

        return  ((BigInteger)getQuery(appendVacationTaskSql(sql, map, true), map).getSingleResult()).intValue();
    }

    /**
     * 获取运行时代办任务
     *
     * @param map
     * @param userId
     * @return
     */
    public List<VacationVo> listVacationTask(Map<String,Object> map, Page page, String userId){

        pagePutMap(map, page);

        userPutMap(map, userId);


        String sql = "SELECT DISTINCT art.`ID_`, art.`CREATE_TIME_`, art.`ASSIGNEE_`, art.`NAME_` as taskName, art.`PROC_INST_ID_`, art.`PROC_DEF_ID_`, arp.`NAME_`,"
                + "tv.`fcode`, tv.`fname`, tv.fapplyuser,tv.fapplytype,tv.fbegindate,tv.fenddate,tv.fapplyreason ";

        List<Object[]> objectsList = getQuery(appendVacationTaskSql(sql, map, false), map).getResultList();

        List<VacationVo> vacationVos = new ArrayList<VacationVo>();

        for(Object[] objects : objectsList){
            VacationVo vo = new VacationVo();
            vo.setTaskId(ObjectUtil.isEmptory(objects[0]) ? "" : objects[0].toString());
            vo.setCreateTaskDate(ObjectUtil.isEmptory(objects[1]) ? "" : objects[1].toString());
            vo.setAssigenee(ObjectUtil.isEmptory(objects[2]) ? "" : objects[2].toString());
            vo.setTaskName(ObjectUtil.isEmptory(objects[3]) ? "" : objects[3].toString());
            vo.setProcInstId(ObjectUtil.isEmptory(objects[4]) ? "" : objects[4].toString());
            vo.setProcDefId(ObjectUtil.isEmptory(objects[5]) ? "" : objects[5].toString());
            vo.setProDefName(ObjectUtil.isEmptory(objects[6]) ? "" : objects[6].toString());
            vo.setFcode(ObjectUtil.isEmptory(objects[7]) ? "" : objects[7].toString());
            vo.setFname(ObjectUtil.isEmptory(objects[8]) ? "" : objects[8].toString());
            vo.setFapplyuser(ObjectUtil.isEmptory(objects[9]) ? "" : objects[9].toString());
            vo.setFapplytype(ObjectUtil.isEmptory(objects[10]) ? "" : objects[10].toString());
            vo.setFbegindate(ObjectUtil.isEmptory(objects[11]) ? "" : objects[11].toString());
            vo.setFenddate(ObjectUtil.isEmptory(objects[12]) ? "" : objects[12].toString());
            vo.setFapplyreason(ObjectUtil.isEmptory(objects[13]) ? "" : objects[13].toString());

            vacationVos.add(vo);
        }


        return vacationVos;
    }

    /**
     * 获取运行时待办任务sql拼接
     *
     * @param sql
     * @param map
     * @return
     */
    private String appendVacationTaskSql(String sql, Map<String, Object> map, boolean count){

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
                + "     OR (art.`ASSIGNEE_` IS NULL AND ari.`GROUP_ID_` = aim.`GROUP_ID_` AND ari.TASK_ID_ = art.ID_) "
                + "     OR (art.`ASSIGNEE_` IS NULL AND ari.TASK_ID_ = art.ID_ AND aiu.`ID_` = ari.`USER_ID_`)) ";


        if(!ObjectUtil.isEmptory(map.get("userId"))){
            sql += " AND aiu.ID_ = :userId ";
        }
        if(!ObjectUtil.isEmptory(map.get("taskName"))){
            sql += " and art.NAME_= :taskName ";
        }
        if(!ObjectUtil.isEmptory(map.get("assignee"))){
            sql += " and art.ASSIGNEE_= :assignee ";
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

        if(!ObjectUtil.isEmptory(map.get("fcode"))){
            sql += " and tv.`fcode` = :fcode ";
        }
        if(!ObjectUtil.isEmptory(map.get("fname"))){
            sql += " and tv.`fname` = :fname ";
        }
        if(!ObjectUtil.isEmptory(map.get("fapplyuser"))){
            sql += " and tv.`fapplyuser` = :fapplyuser ";
        }
        if(!ObjectUtil.isEmptory(map.get("fapplytype"))){
            sql += " and tv.`fapplytype` = :fapplytype ";
        }
        if(!ObjectUtil.isEmptory(map.get("fapplyreason"))){
            sql += " and tv.`fapplyreason` = :fapplyreason ";
        }

        if(!count && !ObjectUtil.isEmptory(map.get("pageNumberSize")) && !ObjectUtil.isEmptory(map.get("pageSize"))){
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
    public int countHiVacationTask(Map<String,Object> map, String userId){
        String sql = "SELECT count(*) \n";

        userPutMap(map, userId);

        return  ((BigInteger)getQuery(appendHiVacationTaskSql(sql, map, true), map).getSingleResult()).intValue();
    }


    /**
     * 获取已办任务
     *
     * @param map
     * @param userId
     * @return
     */
    public List<VacationVo> listHiVacationTask(Map<String,Object> map, String userId, Page page){

        String sql = "SELECT aht.`ID_`, aht.`ASSIGNEE_`,aht.`NAME_`,aht.`START_TIME_`,aht.`END_TIME_`,"
                + "thv.`fcode`, thv.`fname`, thv.fapplyuser,thv.fapplytype,thv.fbegindate,thv.fenddate,thv.fapplyreason,"
                + "aht.`PROC_INST_ID_`, aht.`PROC_DEF_ID_`,arp.`NAME_` as defName ";

        userPutMap(map, userId);

        pagePutMap(map, page);

        List<Object[]> objectsList = getQuery(appendHiVacationTaskSql(sql, map, false), map).getResultList();

        List<VacationVo> vacationVos = new ArrayList<VacationVo>();

        for(Object[] objects : objectsList){
            VacationVo vo = new VacationVo();
            vo.setTaskId(ObjectUtil.isEmptory(objects[0]) ? "" : objects[0].toString());
            vo.setAssigenee(ObjectUtil.isEmptory(objects[1]) ? "" : objects[1].toString());
            vo.setTaskName(ObjectUtil.isEmptory(objects[2]) ? "" : objects[2].toString());
            vo.setCreateTaskDate(ObjectUtil.isEmptory(objects[3]) ? "" : objects[3].toString());
            vo.setEndDate(ObjectUtil.isEmptory(objects[4]) ? "" : objects[4].toString());
            vo.setFcode(ObjectUtil.isEmptory(objects[5]) ? "" : objects[5].toString());
            vo.setFname(ObjectUtil.isEmptory(objects[6]) ? "" : objects[6].toString());
            vo.setFapplyuser(ObjectUtil.isEmptory(objects[7]) ? "" : objects[7].toString());
            vo.setFapplytype(ObjectUtil.isEmptory(objects[8]) ? "" : objects[8].toString());
            vo.setFbegindate(ObjectUtil.isEmptory(objects[9]) ? "" : objects[9].toString());
            vo.setFenddate(ObjectUtil.isEmptory(objects[10]) ? "" : objects[10].toString());
            vo.setFapplyreason(ObjectUtil.isEmptory(objects[11]) ? "" : objects[11].toString());
            vo.setProcInstId(ObjectUtil.isEmptory(objects[12]) ? "" : objects[12].toString());
            vo.setProcDefId(ObjectUtil.isEmptory(objects[13]) ? "" : objects[13].toString());
            vo.setProDefName(ObjectUtil.isEmptory(objects[14]) ? "" : objects[14].toString());

            vacationVos.add(vo);
        }


        return vacationVos;
    }


    /**
     * 获取历史任务sql
     *
     * @param sql
     * @param map
     * @param userId
     * @return
     */
    public String appendHiVacationTaskSql(String sql, Map<String,Object> map, boolean count){
        sql +=  "FROM\n" +
                "  act_hi_taskinst AS aht,\n" +
                "  act_id_user AS aiu,\n" +
                "  act_hi_procinst AS ahp,\n" +
                "  t_hi_vacation AS thv, \n" +
                "  act_re_procdef AS arp \n" +
                "WHERE aht.`ASSIGNEE_` = aiu.`ID_` \n" +
                "  AND aht.`PROC_INST_ID_` = ahp.`PROC_INST_ID_`\n" +
                "  AND arp.`ID_` = aht.`PROC_DEF_ID_` \n" +
                "  AND aht.`END_TIME_` IS NOT NULL \n" +
                "  AND thv.`task_id` = aht.`ID_`\n";

        if(!ObjectUtil.isEmptory(map.get("userId"))){
            sql += " AND aiu.ID_ = :userId ";
        }

        if(!ObjectUtil.isEmptory(map.get("taskName"))){
            sql += " and aht.NAME_= :taskName ";
        }
        if(!ObjectUtil.isEmptory(map.get("taskId"))){
            sql += " and aht.ID_= :taskId ";
        }

        if(!ObjectUtil.isEmptory(map.get("assignee"))){
            sql += " and aht.ASSIGNEE_= :assignee ";
        }
        if(!ObjectUtil.isEmptory(map.get("procInstId"))){
            sql += " and aht.PROC_INST_ID_= :procInstId ";
        }
        if(!ObjectUtil.isEmptory(map.get("procDefId"))){
            sql += " and aht.PROC_DEF_ID_= :procDefId ";
        }
        if(!ObjectUtil.isEmptory(map.get("procDefName"))){
            sql += " and arp.`NAME_` = :procDefName ";
        }

        if(!ObjectUtil.isEmptory(map.get("fcode"))){
            sql += " and thv.`fcode` = :fcode ";
        }
        if(!ObjectUtil.isEmptory(map.get("fname"))){
            sql += " and thv.`fname` = :fname ";
        }
        if(!ObjectUtil.isEmptory(map.get("fapplyuser"))){
            sql += " and thv.`fapplyuser` = :fapplyuser ";
        }
        if(!ObjectUtil.isEmptory(map.get("fapplytype"))){
            sql += " and thv.`fapplytype` = :fapplytype ";
        }
        if(!ObjectUtil.isEmptory(map.get("fapplyreason"))){
            sql += " and thv.`fapplyreason` = :fapplyreason ";
        }

        if(!count && !ObjectUtil.isEmptory(map.get("pageNumberSize")) && !ObjectUtil.isEmptory(map.get("pageSize"))){
            sql +=  " limit :pageNumberSize, :pageSize ";
        }

        return sql;
    }


    private Map<String, Object> userPutMap(Map<String, Object> map, String userId){
        map.put("userId", userId);
        return map;
    }

    private Map<String, Object> pagePutMap(Map<String, Object> map, Page page){
        map.put("pageNumberSize", page.getPageNumber());
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
