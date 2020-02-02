package com.yss.fsip.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import com.yss.fsip.service.BaseService;

/**
 * 
 * 基础controller，提供基础增删改查功能
 * 
 * @author LSP
 */
public class BaseController<T,ID> {
	
	@Autowired
	private BaseService<T,ID> baseService;
	

	/**
	 * 持久化
	 * 
	 * @param model
	 */
    public void save(T model) {
    	baseService.save(model);
    }

    /**
     * 通过主鍵刪除
     * 
     * @param id
     */
    public void deleteById(ID id) {
    	baseService.deleteById(id);
    }
    
    /**
     * 通过对象删除
     * 
     * @param T entity
     */
    public void delete(T entity) {
    	baseService.delete(entity);
    }
    
    /**
     * 删除所有
     */
    public void deleteAll() {
    	baseService.deleteAll();
    }
    


    /**
     * 通过ID查找
     * 
     * @param id
     * @return
     */
    public T findById(ID id) {
        return baseService.findById(id);
    }
    
    /**
     * 单表分页，每页显示20条数据
     * 
     * @param pageNumber 当前页
     * @return
     */
    public Page<T> findPage(int pageNumber){ 	
    	return baseService.findPage(pageNumber);
    }
    
    /**
     * 单表分页
     * 
     * @param pageNumber 当前页
     * @param pageSize 每页显示条数
     * @return
     */
    public Page<T> findPage(int pageNumber, int pageSize){
   	   return baseService.findPage(pageNumber, pageSize);
   }
    
    /**
     * 查询所有
     * 
     * @return
     */
    public List<T> findAll() {
        return baseService.findAll();
    }
}
