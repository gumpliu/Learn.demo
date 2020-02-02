package com.gump.spring.transaction.service;

import com.gump.spring.transaction.entity.Book;
import org.springframework.stereotype.Component;

 
@Component
public interface BookService {
	public Book findByBookId(int bookId);
	public Book saveBook(Book book);

	public void deleteBook(int bookId, boolean isThrow);

    public Book delSavleBook(Book book);


}