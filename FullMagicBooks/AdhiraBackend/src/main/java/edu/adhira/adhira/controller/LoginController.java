package edu.adhira.adhira.controller;

import edu.adhira.adhira.authentication.Login;
import edu.adhira.adhira.authentication.User;
import edu.adhira.adhira.service.AuthServiceImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.text.ParseException;

@Controller
@CrossOrigin(origins = "http://localhost:4200")
public class LoginController {
    private static Logger logger = LogManager.getLogger(LoginController.class);

    @Autowired
    AuthServiceImpl userService;

    @PostMapping(value = "/registration")
    @ResponseBody
    public String createNewUser(@RequestBody User user) {
        logger.info("inside Registration post method {}", user.toString());

        if (userService.findByEmail(user.getEmail()) != null || userService.findByPhone(user.getPhone()) != null) {
            logger.info("Email/phone id exist");
            return "Email/phone id exist";

        } else {

            return userService.saveUser(user);
        }

    }

    @PostMapping(value = "/login")
    @ResponseBody
    public String login(@RequestBody Login login) {
        logger.info("inside Login post method-->>{}",login.toString());
        if (login.getUserName().matches("^(\\+\\d{1,3}[- ]?)?\\d{10}$")) {
            User userByMobileExists = userService.findByPhone(login.getUserName());
            if (userByMobileExists == null) {
                logger.info("Mobile number does'nt exist");
                return "Mobile/EmailId does'nt Exist.";
            } else {
                boolean result = userService.loginByMobile(login);
                logger.info("Login credencials matched for Mobile Auth");
                if (result) {
                    return "Logged-in successfully.";
                } else {
                    return "Mobile and /or password incorrect";
                }
            }
        } else {
            User userByMailExists = userService.findByEmail(login.getUserName());
            if (userByMailExists == null) {
                logger.info("Email does'nt exist");
                return "Mobile/EmailId does'nt Exist.";

            } else {
                boolean result = userService.loginByEmail(login);
                logger.info("Login credencials matched for email Auth");
                if (result) {
                    return "Logged-in successfully.";
                } else {
                    return "Email and /or password incorrect";
                }
            }
        }
    }

    @GetMapping(value = "/confirm-account")
    @ResponseBody
    public ModelAndView confirmAccount(@RequestParam String token, @RequestParam Long userId)
            throws NumberFormatException, ParseException {
        logger.info("inside confirm-account post method " + token);
        ModelAndView mv = new ModelAndView("home");
        boolean result = userService.findByToken(token, userId.toString());
        if (result) {
            mv.addObject("success", "You have been registered successfully.Please login using below link:");
        } else {
            mv.addObject("failure", "Your registration token expired.Register again.");
        }
        return mv;
    }

    @GetMapping(value = "/confirm-otp")
    @ResponseBody
    public String confirmOtp(@RequestParam String otp, @RequestParam String inputValue)
            throws NumberFormatException, ParseException {
        logger.info("inside confirmOtp post method " + otp);
        int result = userService.verifyOtp(Long.parseLong(inputValue), otp);
        if (result == 1) {
            return "Registration has been completed.Please login.";
        }
        return "Verification failed";

    }

    @GetMapping(value = "/inquire")
    @ResponseBody
    public User inquireEmaiOrMobile(@RequestParam String inquire) {
        logger.info("inside confirmOtp post method " + inquire);
        return userService.searchUser(inquire);


    }

}
