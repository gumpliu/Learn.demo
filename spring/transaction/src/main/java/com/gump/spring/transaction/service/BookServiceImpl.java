package com.gump.spring.transaction.service;

import com.gump.spring.transaction.entity.Book;
import com.gump.spring.transaction.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("bookServiceImpl")
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

    public Book findByBookId(int bookId) {
        Book book = bookRepository.findByBookId(bookId);
        return book;
    }

    @Transactional
    public Book saveBook(Book book) {
        Book book1 = bookRepository.save(book);

        return book1;
    }

    @Override
    @Transactional
    public void deleteBook(int bookId, boolean isThrow) {
        Book book = bookRepository.findByBookId(bookId);

        bookRepository.delete(book);

        if(isThrow){
            throw new RuntimeException("not delete book!");
        }
    }

    /**
     * 删除保存
     *
     * @param book
     * @return
     */
    public Book delSavleBook(Book book){

        Book delBook =  bookRepository.findByBookName(book.getBookName());

        Book dbBook = saveBook(book);

        deleteBook(delBook.getBookId(), true);

        return dbBook;
    }


}