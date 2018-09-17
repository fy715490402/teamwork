package com.tw.web;

import com.tw.domain.forum.Board;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Administrator
 * @version 1.0
 * @date 2018-09-12
 */

@Controller
@RequestMapping("/forum")
public class ForumController extends BasicController {

    @RequestMapping("/")
    public String home(){
        return "forum/home";
    }
    
    @RequestMapping("/mystore")
    public String mystore(){
        return "forum/mystore";
    }

    @RequestMapping("/board/create")
    public String createBoardForm(@ModelAttribute("board")Board board){
        return "forum/createBoardForm";
    }
    
}
