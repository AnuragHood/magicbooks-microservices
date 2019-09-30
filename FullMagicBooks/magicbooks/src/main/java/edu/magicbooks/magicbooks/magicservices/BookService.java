package edu.magicbooks.magicbooks.magicservices;

import edu.magicbooks.magicbooks.magicbeans.Book;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public interface BookService {
    Book save(Book book);

    Iterable<Book> bulkUpload(InputStream stream) throws IOException;

    List<Book> findAll();

    List<Book> searchBook(String searchParam);

    List<Book> filterBooks(String[] categoryList, Integer[] ratingList);

    List<Book> filterBooksByCategory(String[] categoryList);

    List<Book> filterBooksByRating(Integer[] ratingList);

    List<Book> filterSearchedBooks(String[] categoryList, Integer[] ratingList, String searchParam);

    List<Book> filterSearchedBooksByCategory(String[] categoryList, String searchParam);

    List<Book> filterSearchedBooksByRating(Integer[] ratingList, String searchParam);

    List<Book> findList(Long[] idList);

    void voidABook(Long id);


}
