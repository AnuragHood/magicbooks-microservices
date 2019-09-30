package edu.magicbooks.magicbooks.magiccontrollers;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class BasicErrorController implements ErrorController {

    @RequestMapping("/error")
    @ResponseBody
    public ModelAndView handleError(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("default");
        return mv;
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }

}