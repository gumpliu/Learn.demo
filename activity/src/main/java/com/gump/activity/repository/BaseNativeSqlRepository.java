package com.gump.activity.repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;
import java.util.List;

/**
 * JPA使用原生Sql元素
 *
 */
public class BaseNativeSqlRepository {
    
    @PersistenceUnit
    private EntityManagerFactory emf;
    /**
     * 查询多个属性
     * 返回List<Object[]>数组形式的，数组中内容按照查询字段先后
     * @param sql
     * @return
     */
    public List<Object[]> sqlArrayList(String sql){
        EntityManager em =emf.createEntityManager();
        Query query =em.createNativeQuery(sql);
        List<Object[]> list = query.getResultList();
        em.close();
        return list;
    }
    /**
     * 查询多个属性
     * 返回List<Object>对象形式的List，Object为Class格式对象
     * @param sql
     * @param obj
     * @return
     */
    public List sqlObjectList(String sql ,Object obj){
        EntityManager em =emf.createEntityManager();
        Query query = em.createNamedQuery(sql,obj.getClass());
        List list = query.getResultList();
        em.close();
        return list;
    }
    
    /**
     * 查询单个属性
     * @param sql
     * @return
     */
    public List
    qlSingleList(String sql){
        EntityManager em = emf.createEntityManager();
        Query query = em.createNativeQuery(sql);
        List list = query.getResultList();
        em.close();
        return list;
    }
}