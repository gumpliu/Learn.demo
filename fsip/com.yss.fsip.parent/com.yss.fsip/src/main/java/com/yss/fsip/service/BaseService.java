package com.yss.fsip.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;

import com.yss.fsip.repository.BaseRepository;

public class BaseService<T, ID> {
	
	@Resource
    BaseRepository<T,ID> baseRepository;

	/**
	 * 持久化
	 * 
	 * @param model
	 */
    public void save(T model) {
    	baseRepository.save(model);
    }

    /**
     * 通过主鍵刪除
     * 
     * @param id
     */
    public void deleteById(ID id) {
    	baseRepository.deleteById(id);
    }
    
    /**
     * 通过对象删除
     * 
     * @param T entity
     */
    public void delete(T entity) {
    	baseRepository.delete(entity);
    }
    
    /**
     * 删除所有
     */
    public void deleteAll() {
    	baseRepository.deleteAll();
    }
    


    /**
     * 通过ID查找
     * 
     * @param id
     * @return
     */
    public T findById(ID id) {
        return baseRepository.findById(id).get();
    }
    
    /**
     * 单表分页，每页显示20条数据
     * 
     * @param pageNumber 当前页
     * @return
     */
    public Page<T> findPage(int pageNumber){ 	
    	return baseRepository.findPage(pageNumber);
    }
    
    /**
     * 单表分页
     * 
     * @param pageNumber 当前页
     * @param pageSize 每页显示条数
     * @return
     */
    public Page<T> findPage(int pageNumber, int pageSize){
   	   return baseRepository.findPage(pageNumber, pageSize);
   }
    
    /**
     * 查询所有
     * 
     * @return
     */
    public List<T> findAll() {
        return baseRepository.findAll();
    }
	
}
