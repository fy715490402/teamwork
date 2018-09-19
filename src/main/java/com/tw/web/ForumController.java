package com.tw.web;

import com.tw.domain.User;
import com.tw.domain.forum.Board;
import com.tw.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

/**
 * @author Administrator
 * @version 1.0
 * @date 2018-09-12
 */

@Controller
@RequestMapping("/forum")
public class ForumController extends BasicController {

    @Autowired
    private ForumService forumService;

    public ForumService getForumService() {
        return forumService;
    }

    public void setForumService(ForumService forumService) {
        this.forumService = forumService;
    }

    @RequestMapping("/")
    public String home(Model model){
        List<Board> boards = forumService.getAllBoards();
        model.addAttribute("boards",boards);
        return "forum/home";
    }
    
    @RequestMapping("/mystore")
    public String mystore(){
        return "forum/mystore";
    }

    @RequestMapping("/board/create")
    public String createBoardForm(HttpServletRequest request,Board board, @RequestParam("file") MultipartFile file) throws IOException {
        //保存文件
        if (file!=null){
            //生成文件名
            String fileName = UUID.randomUUID().toString()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            //文件服务器地址
            String path = "/home/fy/tools/temp/"+fileName;
            //file.transferTo(new File(path));
            file.transferTo(new File(path));
            board.setImageUrl(path);
        }
        forumService.addBoard(board);
        return "redirect:/forum/";
    }

    /**
     * 获得文件服务器地址
     * @return
     */
    private String getFileServerUrl() {
       return "";
    }
    
}
