package com.tw.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Administrator
 * @version 1.0
 * @date 2018-09-12
 */

@Controller
public class HomeController extends BasicController {

    @RequestMapping("/")
    public String index(){
        return "main";
    }
    
    @RequestMapping("/home")
    public String home(){
        return "home";
    }

}
