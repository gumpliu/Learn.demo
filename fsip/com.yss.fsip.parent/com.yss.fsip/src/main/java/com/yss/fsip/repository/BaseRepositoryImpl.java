package com.yss.fsip.repository;

import java.io.Serializable;

import javax.persistence.EntityManager;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

public class BaseRepositoryImpl<T, TD extends Serializable> extends SimpleJpaRepository<T, TD> implements BaseRepository<T, TD> {

    private final EntityManager entityManager; //父类没有不带参数的构造方法，这里手动构造父类
    
    private final int DEFULT_PAGE_SIZE = 20; //每页默认大小

    public BaseRepositoryImpl(Class<T> domainClass, EntityManager entityManager) {
        super(domainClass, entityManager);
        this.entityManager = entityManager;
    }

	@Override
    @SuppressWarnings("unchecked")
	public Page<T> findPage(int courrentPage) {
		
		return findPage(courrentPage, DEFULT_PAGE_SIZE);
	}

	@Override
    @SuppressWarnings("unchecked")
	public Page<T> findPage(int courrentPage, int pageSize) {
		
		Pageable pageable = new PageRequest(courrentPage, pageSize);

		return findAll((Specification<T>) null, pageable);
	}
}