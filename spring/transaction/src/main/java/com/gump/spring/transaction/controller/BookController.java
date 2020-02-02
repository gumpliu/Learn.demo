package com.gump.spring.transaction.controller;

import com.gump.spring.transaction.entity.Book;
import com.gump.spring.transaction.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/book")
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/getBook", method = RequestMethod.GET)
    @ResponseBody
    public Book getBookDetails(int bookId) {
        Book bookResponse = bookService.findByBookId(bookId);

        return bookResponse;
    }

    @RequestMapping(value = "/savebook", method = RequestMethod.POST)
    @ResponseBody
    public Book saveBook(@RequestBody Book book) {
        Book bookResponse = bookService.saveBook(book);

        return bookResponse;
    }

    @RequestMapping(value = "/delBook", method = RequestMethod.GET)
    @ResponseBody
    public String delBook(int bookId) {
        try {
            bookService.deleteBook(bookId, false);
        }catch (Exception e){
            return "fail";
        }
        return "success";
    }

    @RequestMapping(value = "/delAndSaveBook", method = RequestMethod.GET)
    @ResponseBody
    public String delAndSaveBook(String bookName) {
        try {
            Book book = new Book();
            book.setBookName(bookName);
            book.setAutherName(bookName);
            bookService.delSavleBook(book);
        }catch (Exception e){
            return "fail";
        }
        return "success";
    }


}