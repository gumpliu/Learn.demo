package com.gump.spring.transaction.repository;

import com.gump.spring.transaction.entity.Book;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository
public interface BookRepository extends CrudRepository<Book,Serializable> {

    Book findByBookId(int bookId);


	Book findByBookName(String bookName);
	
	
	
	
	
}