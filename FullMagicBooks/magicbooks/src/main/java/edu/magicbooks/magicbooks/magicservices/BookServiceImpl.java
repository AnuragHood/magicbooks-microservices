package edu.magicbooks.magicbooks.magicservices;

import edu.magicbooks.magicbooks.exceptions.StorageException;
import edu.magicbooks.magicbooks.magicbeans.Book;
import edu.magicbooks.magicbooks.magicrepositories.BookRepo;
import edu.magicbooks.magicbooks.utils.CsvUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service

public class BookServiceImpl implements BookService {
    @Autowired
    private BookRepo bookRepo;
    private static Logger logger = LogManager.getLogger(BookServiceImpl.class);


    @Override
    public Book save(Book book) {
        Float priceDrop = (Float.valueOf((book.getBookMrp() - book.getBookSellingPrice())) / Float.valueOf(book.getBookMrp())) * 100;
        logger.info("priceDrop::" + priceDrop);
        book.setPriceDrop(priceDrop);
        book.setRating(0);
        return bookRepo.save(book);

    }

    @Override
    public Iterable<Book> bulkUpload(InputStream straem) throws StorageException, IOException {
        return bookRepo.saveAll(CsvUtils.read(Book.class, straem));
    }

    @Override
    public List<Book> findAll() {
        return (List<Book>) bookRepo.findAll();
    }

    @Override
    public List<Book> searchBook(String searchParam) {

        return bookRepo.searchBook(searchParam);
    }

    @Override
    public List<Book> filterBooks(String[] categoryList, Integer[] ratingList) {
        return bookRepo.filterBooks(categoryList, ratingList);
    }

    @Override
    public List<Book> filterBooksByCategory(String[] categoryList) {
        return bookRepo.filterBooksByCategory(categoryList);
    }

    @Override
    public List<Book> filterBooksByRating(Integer[] ratingList) {
        return bookRepo.filterBooksByRating(ratingList);
    }

    @Override
    public List<Book> filterSearchedBooks(String[] categoryList, Integer[] ratingList, String searchParam) {
        return bookRepo.filterSearchedBooks(categoryList, ratingList, searchParam);
    }

    @Override
    public List<Book> filterSearchedBooksByCategory(String[] categoryList, String searchParam) {
        return bookRepo.filterSearchedBooksByCategory(categoryList, searchParam);
    }

    @Override
    public List<Book> filterSearchedBooksByRating(Integer[] ratingList, String searchParam) {
        return bookRepo.filterSearchedBooksByRating(ratingList, searchParam);
    }

    @Override
    public List<Book> findList(Long[] idList) {
        return bookRepo.findList(idList);
    }

    @Override
    @Transactional
    public void voidABook(Long id) {
        bookRepo.setQuantityToZero(id);
    }
}
