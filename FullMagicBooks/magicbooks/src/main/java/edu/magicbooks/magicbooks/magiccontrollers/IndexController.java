package edu.magicbooks.magicbooks.magiccontrollers;

import edu.magicbooks.magicbooks.magicbeans.Book;
import edu.magicbooks.magicbooks.magicbeans.BookCategory;
import edu.magicbooks.magicbooks.magicbeans.BulkUpload;
import edu.magicbooks.magicbooks.magicbeans.FilterBooks;
import edu.magicbooks.magicbooks.magicservices.BookService;
import edu.magicbooks.magicbooks.utils.UtilityHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@Controller
@RequestMapping(value = "home")
public class IndexController {
    @Autowired
    private BookService books;
    private static Logger logger = LogManager.getLogger(IndexController.class);
    ModelAndView mv = null;

    private static final String EXTENSION = ".csv";
    @Value("${upload.dir.location}")
    private String SERVER_LOCATION;

    @GetMapping("/download")
    public ResponseEntity<Resource> download() throws IOException {
        File file = new File(SERVER_LOCATION + File.separator + "bookTemplate" + EXTENSION);

        HttpHeaders header = new HttpHeaders();
        header.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=bulkUploadTemplate.csv");
        header.add("Cache-Control", "no-cache, no-store, must-revalidate");
        header.add("Pragma", "no-cache");
        header.add("Expires", "0");

        Path path = Paths.get(file.getAbsolutePath());
        ByteArrayResource resource = new ByteArrayResource(Files.readAllBytes(path));

        return ResponseEntity.ok().headers(header).contentLength(file.length())
                .contentType(MediaType.parseMediaType("application/octet-stream")).body(resource);
    }

    @GetMapping("/show")
    public ModelAndView magicShowHome() {
        logger.info("inside show method GET......>>>");
        mv = new ModelAndView("home");
        List<Book> bookList = books.findAll();
        bookList = UtilityHelper.removeRedundancyFromList(bookList);
        UtilityHelper.sortByName(bookList);
        mv.addObject("bookList", bookList);
        logger.info("inside  show method method bookList......>>>" + bookList.toString());
        mv.addObject("bookDao", new Book());
        mv.addObject("filterBooks", new FilterBooks());
        mv.addObject("value", "No");
        return mv;
    }


    @GetMapping("/addOne")
    public ModelAndView magicAdd() {
        logger.info("inside addBook method GET......>>>" + BookCategory.values().length);
        mv = new ModelAndView("addBook");
        Book book = new Book();
        book.setBookButton("Add");
        mv.addObject("bookDao", book);
        mv.addObject("categories", new ArrayList<BookCategory>(Arrays.asList(BookCategory.values())));
        mv.addObject("filterBooks", new FilterBooks());

        return mv;
    }

    @GetMapping("/bulkUpload")
    public ModelAndView magicUpload() {
        logger.info("inside bulkUpload method GET......>>>");
        mv = new ModelAndView("bulkUpload");
        mv.addObject("bulkUpload", new BulkUpload());
        mv.addObject("bookDao", new Book());
        mv.addObject("filterBooks", new FilterBooks());

        return mv;
    }

}
