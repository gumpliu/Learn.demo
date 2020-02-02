package com.yss.fsip.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface BaseRepository<T, ID> extends JpaRepository<T, ID>{
	
	/**
	 * 分页查询，每页显示条数为10。
	 * @param courrentPage 当前页面
	 * @return
	 */
	Page<T> findPage(int courrentPage);
	
	/**
	 * 分页查询 
	 * @param courrentPage 当前页面
	 * @param pageSize 每页显示条数
	 * @return
	 */
	Page<T> findPage(int courrentPage, int pageSize);

}
