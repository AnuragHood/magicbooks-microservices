package edu.magicbooks.magicbooks.magiccontrollers;

import edu.magicbooks.magicbooks.magicbeans.Book;
import edu.magicbooks.magicbooks.magicbeans.FilterBooks;
import edu.magicbooks.magicbooks.magicservices.BookService;
import edu.magicbooks.magicbooks.utils.UtilityHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class HomeController {
    private static Logger logger = LogManager.getLogger(HomeController.class);
    @Autowired
    private BookService books;
    @GetMapping({"/",""})
    public ModelAndView magicShowHome() {
        logger.info("inside show method GET......>>>");
        ModelAndView mv = new ModelAndView("home");
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
}
