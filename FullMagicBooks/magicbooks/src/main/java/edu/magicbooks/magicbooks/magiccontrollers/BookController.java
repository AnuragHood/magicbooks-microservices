package edu.magicbooks.magicbooks.magiccontrollers;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.magicbooks.magicbooks.exceptions.StorageException;
import edu.magicbooks.magicbooks.magicbeans.Book;
import edu.magicbooks.magicbooks.magicbeans.BookCategory;
import edu.magicbooks.magicbooks.magicbeans.BulkUpload;
import edu.magicbooks.magicbooks.magicbeans.FilterBooks;
import edu.magicbooks.magicbooks.magicservices.BookService;
import edu.magicbooks.magicbooks.magicservices.StorageService;
import edu.magicbooks.magicbooks.utils.UtilityHelper;

@Controller
@RequestMapping(value = "home/magicbooks")
public class BookController {
    @Autowired
    private BookService books;
    @Autowired
    private StorageService storePhotoService;
    private static Logger logger = LogManager.getLogger(BookController.class);
    ModelAndView mv = null;
    private static final String BOOK_DAO = "bookDao";
    int i = 0, j = 0;
    int k = 1;

    @PostMapping("/addOne")
    public ModelAndView magicAdd(@ModelAttribute(BOOK_DAO) Book bookDto) {
        logger.info("inside addBook method Post......>>>" + bookDto.toString());
        if (bookDto.getBookSellingPrice() > bookDto.getBookMrp() || bookDto.getBookSellingPrice() == 0
                || bookDto.getBookMrp() == 0) {
            bookDto.setBookButton("Add");
            mv = new ModelAndView("addBook", "message",
                    "Book Selling Price should be lesser than or equal to Book MRP, and can not be 0");
            mv.addObject(bookDto);
            mv.addObject("categories", new ArrayList<BookCategory>(Arrays.asList(BookCategory.values())));
            return mv;
        }
        if (bookDto.getQuantity() <= 0) {
            bookDto.setBookButton("Add");
            mv = new ModelAndView("addBook", "message", "Book Quantity can not be 0.");
            mv.addObject(bookDto);
            mv.addObject("categories", new ArrayList<BookCategory>(Arrays.asList(BookCategory.values())));
            return mv;
        }
        if (bookDto.getName().isEmpty() || bookDto.getCategory().isEmpty() || bookDto.getAuthor().isEmpty()) {
            bookDto.setBookButton("Add");
            mv = new ModelAndView("addBook", "message",
                    "Book Name,Book Category,Book Author Name are required fields.");
            mv.addObject(bookDto);
            mv.addObject("categories", new ArrayList<BookCategory>(Arrays.asList(BookCategory.values())));
            mv.addObject("filterBooks", new FilterBooks());

            return mv;
        }
        Book book = books.save(bookDto);
        try {
            bookDto.setId(book.getId());
            String pictures = uploadImages(bookDto);
            bookDto.setPictures(pictures);
            List<String> elementList = Arrays.asList(pictures.split(","));
            bookDto.setPicture(elementList.get(0));
            books.save(bookDto);
        } catch (StorageException e) {

        }
        mv = new ModelAndView("addBook", "message", "Your new change will be visible to People on magicBooks now!!");
        Book boook = new Book();
        boook.setBookButton("Add");
        mv.addObject(BOOK_DAO, boook);
        mv.addObject("categories", new ArrayList<BookCategory>(Arrays.asList(BookCategory.values())));
        mv.addObject("filterBooks", new FilterBooks());

        return mv;
    }

    @PostMapping("/bulkUpload")
    public ModelAndView magicBulkUpload(@ModelAttribute("bulkUpload") BulkUpload bulkUpload) {
        logger.info("inside bulkUpload method Post......>>>" + bulkUpload.getBulkFile().getName());
        File file = bulkUpload.getBulkFile();

        try {
            if (notEmpty(file)) {
                logger.info("inside upload method Post......file empty?>>>" + notEmpty(file));
                InputStream targetStream = new FileInputStream(file);
                Iterable<Book> result = books.bulkUpload(targetStream);
                mv = new ModelAndView("bulkUpload", "message", result);
                mv.addObject("bulkUpload", new BulkUpload());
                mv.addObject(BOOK_DAO, new Book());
                mv.addObject("filterBooks", new FilterBooks());

                return mv;
            }

        } catch (Exception e) {
            logger.error(e);

        }
        return null;
    }

    @GetMapping("/managebooks")
    public ModelAndView manageBooks() {
        logger.info("inside manageBooks method GET......>>>");
        mv = new ModelAndView("manageBooks");
        mv.addObject(BOOK_DAO, new Book());
        List<Book> bookList = books.findAll();
        UtilityHelper.sortByName(bookList);
        mv.addObject("bookList", bookList);
        mv.addObject("filterBooks", new FilterBooks());

        return mv;
    }

    @GetMapping("/sortLowToHigh")

    public ModelAndView sortBooksLowToHigh(@RequestParam String search) {
        logger.info("inside sortLowToHigh method GET......>>>");
        if (search.isEmpty() || search.equals("No")) {
            logger.info("inside sortLowToHigh method home......>>>" + search);
            mv = new ModelAndView("home");
            mv.addObject(BOOK_DAO, new Book());
            List<Book> bookList = books.findAll();
            bookList = UtilityHelper.removeRedundancyFromList(bookList);
            UtilityHelper.sortByPriceLowToHigh(bookList);
            mv.addObject("bookList", bookList);
            mv.addObject("filterBooks", new FilterBooks());

            return mv;
        } else {
            logger.info("inside sortLowToHigh method search......>>>" + search);

            mv = new ModelAndView("searchResult");
            mv.addObject(BOOK_DAO, new Book());
            List<Book> bookList = books.searchBook(search);
            bookList = UtilityHelper.removeRedundancyFromList(bookList);
            UtilityHelper.sortByPriceLowToHigh(bookList);
            mv.addObject("bookList", bookList);
            mv.addObject("value", search);
            mv.addObject("filterBooks", new FilterBooks());

            return mv;
        }
    }

    @GetMapping("/sortHighToLow")
    public ModelAndView sortHighToLow(@RequestParam String search) {
        logger.info("inside sortHighToLow method GET......>>>");
        if (search.isEmpty() || search.equals("No")) {
            logger.info("inside sortByPriceHighToLow method home......>>>" + search);
            mv = new ModelAndView("home");
            mv.addObject(BOOK_DAO, new Book());
            List<Book> bookList = books.findAll();
            bookList = UtilityHelper.removeRedundancyFromList(bookList);
            UtilityHelper.sortByPriceHighToLow(bookList);
            mv.addObject("bookList", bookList);
            mv.addObject("filterBooks", new FilterBooks());

            return mv;
        } else {
            logger.info("inside sortByPriceHighToLow method search......>>>" + search);

            mv = new ModelAndView("searchResult");
            mv.addObject(BOOK_DAO, new Book());
            List<Book> bookList = books.searchBook(search);
            bookList = UtilityHelper.removeRedundancyFromList(bookList);
            UtilityHelper.sortByPriceHighToLow(bookList);
            mv.addObject("bookList", bookList);
            mv.addObject("value", search);
            mv.addObject("filterBooks", new FilterBooks());

            return mv;
        }
    }

    @GetMapping("/sortByRating")
    public ModelAndView sortByRating(@RequestParam String search) {
        logger.info("inside sortByRating method GET......>>>");
        if (search.isEmpty() || search.equals("No")) {
            logger.info("inside sortByRating method home......>>>" + search);
            mv = new ModelAndView("home");
            mv.addObject(BOOK_DAO, new Book());
            List<Book> bookList = books.findAll();
            bookList = UtilityHelper.removeRedundancyFromList(bookList);
            UtilityHelper.sortByRating(bookList);
            mv.addObject("bookList", bookList);
            mv.addObject("filterBooks", new FilterBooks());

            return mv;
        } else {
            logger.info("inside sortByRating method search......>>>" + search);

            mv = new ModelAndView("searchResult");
            mv.addObject(BOOK_DAO, new Book());
            List<Book> bookList = books.searchBook(search);
            bookList = UtilityHelper.removeRedundancyFromList(bookList);
            UtilityHelper.sortByRating(bookList);
            mv.addObject("bookList", bookList);
            mv.addObject("value", search);
            mv.addObject("filterBooks", new FilterBooks());
            return mv;
        }
    }

    @GetMapping("/delete")
    public String deleteBook(@RequestParam(defaultValue = "0") Long id, RedirectAttributes attributes) {
        logger.info("inside deleteBook method ......>>>");
        books.voidABook(id);
        attributes.addFlashAttribute("message", "Your Changes are done!!");
        return "redirect:/home/magicbooks/managebooks";
    }

    @GetMapping("/update")
    public ModelAndView updateBook(@RequestParam(defaultValue = "") String name,
                                   @RequestParam(defaultValue = "") String category, @RequestParam(defaultValue = "") String author,
                                   @RequestParam(defaultValue = "0") String bookMrp, @RequestParam(defaultValue = "0") String bookSellingPrice,
                                   @RequestParam(defaultValue = "0") Long id, @RequestParam(defaultValue = "") String publishingDate,
                                   @RequestParam(defaultValue = "0") Long quantity) {
        logger.info("inside updateBook method GET......>>>");

        mv = new ModelAndView("addBook", "message", "You can upload new photoes..old one will be deleted.");
        Book bookDTO = new Book();
        bookDTO.setName(name);
        bookDTO.setAuthor(author);
        bookDTO.setCategory(category);
        bookDTO.setBookMrp(Long.valueOf(bookMrp));
        bookDTO.setBookSellingPrice(Long.valueOf(bookSellingPrice));
        bookDTO.setBookButton("Update");
        bookDTO.setId(id);
        bookDTO.setPublishingDate(publishingDate);
        bookDTO.setQuantity(quantity);
        mv.addObject(BOOK_DAO, bookDTO);
        mv.addObject("categories", new ArrayList<BookCategory>(Arrays.asList(BookCategory.values())));
        mv.addObject("filterBooks", new FilterBooks());
        return mv;
    }

    @PostMapping("/search")
    public ModelAndView magicSearch(@ModelAttribute("bookDao") Book bookDto) {

        logger.info("inside searchBooks method GET......>>>" + bookDto.getName());
        mv = new ModelAndView("searchResult");
        List<Book> bookList = books.searchBook(bookDto.getName());
        bookList = UtilityHelper.removeRedundancyFromList(bookList);
        UtilityHelper.sortByName(bookList);
        mv.addObject("bookList", bookList);
        logger.info("inside searchBooks method searchResults......>>>" + bookList.toString());
        mv.addObject("bookDao", new Book());
        mv.addObject("value", bookDto.getName());
        mv.addObject("filterBooks", new FilterBooks());
        return mv;
    }

    @PostMapping("/filter")
    public ModelAndView filterRecords(@ModelAttribute("filterBooks") FilterBooks filterBooks,
                                      RedirectAttributes attributes) {
        logger.info("inside filter method POST......>>>" + filterBooks.toString());
        List<Book> bookList = null;
        if (filterBooks.getValue().isEmpty() || filterBooks.getValue().equals("No")) {
            mv = new ModelAndView("home");
            mv.addObject("bookDao", new Book());
            mv.addObject("filterBooks", new FilterBooks());
            if (filterBooks.getCategoryList() != null && filterBooks.getRatingList() == null) {
                bookList = books.filterBooksByCategory(filterBooks.getCategoryList());
                logger.info("inside filterBooks method filterByCategoryResults......>>>" + bookList.toString());
            } else if (filterBooks.getRatingList() != null && filterBooks.getCategoryList() == null) {
                bookList = books.filterBooksByRating(filterBooks.getRatingList());
                logger.info("inside filterBooks method filterByRatingResults......>>>" + bookList.toString());
            } else if (filterBooks.getCategoryList() != null && filterBooks.getRatingList() != null) {
                bookList = books.filterBooks(filterBooks.getCategoryList(), filterBooks.getRatingList());
                logger.info("inside filterBooks method filterResults......>>>" + bookList.toString());
            } else {
                bookList = books.findAll();
            }

            UtilityHelper.sortByName(bookList);
            mv.addObject("bookList", bookList);

            return mv;

        } else {
            logger.info("inside filterForSearch method filter......>>>");

            mv = new ModelAndView("searchResult");
            mv.addObject(BOOK_DAO, new Book());
            if (filterBooks.getCategoryList() != null && filterBooks.getRatingList() == null) {
                bookList = books.filterSearchedBooksByCategory(filterBooks.getCategoryList(), filterBooks.getValue());
                logger.info(
                        "inside filterBooks method filterByCategoryResults for search......>>>" + bookList.toString());
            } else if (filterBooks.getRatingList() != null && filterBooks.getCategoryList() == null) {
                bookList = books.filterSearchedBooksByRating(filterBooks.getRatingList(), filterBooks.getValue());
                logger.info(
                        "inside filterBooks method filterByRatingResults for search......>>>" + bookList.toString());
            } else if (filterBooks.getCategoryList() != null && filterBooks.getRatingList() != null) {
                bookList = books.filterSearchedBooks(filterBooks.getCategoryList(), filterBooks.getRatingList(),
                        filterBooks.getValue());
                logger.info("inside filterBooks method filterResults for search......>>>" + bookList.toString());
            } else {
                bookList = books.searchBook(filterBooks.getValue());
            }
            bookList = UtilityHelper.removeRedundancyFromList(bookList);

            mv.addObject("bookList", bookList);
            mv.addObject("value", filterBooks.getValue());
            mv.addObject("filterBooks", new FilterBooks());
            return mv;
        }
    }

    @PostMapping("/cartFeature")
    @ResponseBody
    public ModelAndView cartFeature(@RequestParam(value = "bookids[]", defaultValue = "0") Long[] bookids) {
        mv = new ModelAndView("cart");
        mv.addObject(BOOK_DAO, new Book());
        if (!bookids.equals("0")) {

            List<Book> bookList = findItemsInCart(bookids, books.findList(bookids));
            bookList.forEach(b -> logger.info(b.getItemInCart() + b.getName()));
            mv.addObject("bookList", bookList);
            return mv;
        } else {
            return null;
        }

    }

    private String uploadImages(Book bookDto) {
        // Get the uploaded files and store them
        List<MultipartFile> files = bookDto.getBulkFile();
        String imageList = "";
        if (null != files && files.size() > 0) {
            int i = 0;
            for (MultipartFile multipartFile : files) {
                i++;
                if (i % 2 == 0 && i != files.size()) {
                    imageList += "," + storePhotoService.uploadFile(multipartFile, bookDto.getId(), i) + ",";
                } else if (i == files.size() && i != 1) {
                    imageList += "," + storePhotoService.uploadFile(multipartFile, bookDto.getId(), i);
                    break;

                } else {
                    imageList += storePhotoService.uploadFile(multipartFile, bookDto.getId(), i);
                }

            }
        }
        return imageList;
    }

    private boolean notEmpty(File file) {
        return !file.exists() || file.length() == 0;
    }

    private List<Book> findItemsInCart(Long[] bookidList, List<Book> bookList) {
        List<Long> bookidList2 = Arrays.asList(bookidList);
        bookidList2.forEach(temp -> {
            bookList.forEach(b -> {
                if (temp.equals(b.getId())) {
                    b.setItemInCart(Collections.frequency(bookidList2, temp));
                    return;
                }

            });
        });
        return bookList;
    }
}
