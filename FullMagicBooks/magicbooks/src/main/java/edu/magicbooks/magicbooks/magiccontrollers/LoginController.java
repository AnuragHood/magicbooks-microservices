package edu.magicbooks.magicbooks.magiccontrollers;

import edu.magicbooks.magicbooks.magicbeans.Book;
import edu.magicbooks.magicbooks.magicbeans.FilterBooks;
import edu.magicbooks.magicbooks.magicbeans.MagicLogin;
import edu.magicbooks.magicbooks.magicservices.BookService;
import edu.magicbooks.magicbooks.utils.UtilityHelper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class LoginController {
    private static Logger logger = LogManager.getLogger(LoginController.class);
    @Autowired
    private BookService books;
    @Autowired
    private RestTemplate restTemplate;

    @GetMapping("/login")
    public ModelAndView login() {
        ModelAndView mv = new ModelAndView("login");
        mv.addObject("loginDao", new MagicLogin());
        return mv;
    }

    @PostMapping("/login")
    public ModelAndView loginRequest(@ModelAttribute("loginDao") MagicLogin loginDao) {
        logger.info("inside login method post......>>>" + loginDao.getEmail() + "  " + loginDao.getPassword());
        ResponseEntity<String> message = restTemplate.postForEntity("http://localhost:8082/adhira/login", loginDao, String.class);
        ModelAndView mv = new ModelAndView("home");
        List<Book> bookList = books.findAll();
        bookList = UtilityHelper.removeRedundancyFromList(bookList);
        UtilityHelper.sortByName(bookList);
        mv.addObject("bookList", bookList);
        logger.info("inside  show method method bookList......>>>" + message.getBody());
        mv.addObject("bookDao", new Book());
        mv.addObject("filterBooks", new FilterBooks());
        mv.addObject("value", "No");
        mv.addObject("message", message.getBody());
        return mv;
    }
}
