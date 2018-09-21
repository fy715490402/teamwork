package com.tw.web;

import com.tw.dao.Page;
import com.tw.domain.User;
import com.tw.domain.forum.Board;
import com.tw.domain.forum.MainPost;
import com.tw.domain.forum.Post;
import com.tw.domain.forum.Topic;
import com.tw.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
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
            board.setImageUrl(fileName);
        }
        forumService.addBoard(board);
        return "redirect:/forum/";
    }

    @RequestMapping("/{boardId}/topics/{pageNo}")
    public String showTopics(@PathVariable("boardId") Serializable boardId,@PathVariable("pageNo") int pageNo, Model model){
        Page<Topic> topicPage = forumService.getTopicsByBoardId(boardId,20,pageNo);
        model.addAttribute("topicPage",topicPage);
        model.addAttribute("boardId",boardId);
        return "forum/topics";
    }

    @RequestMapping("/{boardId}/topics/new")
    public String createTopic(@PathVariable("boardId") Serializable boardId,HttpServletRequest request,Topic topic,Model model){
        if (topic.getTitle()!=null){
            User user = (User) getSession("loginUser",request);
            topic.setUser(user);
            MainPost post = topic.getMainPost();
            post.setTopic(topic);
            post.setUser(user);
            forumService.addTopic(topic);
            forumService.addPost(post);
            return "redirect:/forum/"+boardId+"/topics/1";
        }
        Board board = forumService.getBoardById(boardId);
        List<Board> boards = forumService.getAllBoards();
        model.addAttribute("board",board);
        model.addAttribute("boards",boards);
        return "forum/newTopic";
        //return "redirect:/"+boardId+"/topics/1";
    }

    @RequestMapping("/topics/{topicId}")
    public String showTopic(@PathVariable("topicId")Serializable topicId,Model model){
        Topic topic = forumService.getTopicById(topicId);
        model.addAttribute("topic",topic);
        return "forum/showTopic";
    }

    @RequestMapping("/topics/{topicId}/newPost")
    public String newPost(@PathVariable("topicId") Serializable topicId, Post post,HttpServletRequest request){
        post.setTopic(forumService.getTopicById(topicId));
        post.setUser((User) getSession("loginUser",request));
        forumService.addPost(post);
        return "redirect:/forum/topics/"+topicId;
    }

    /**
     * 获得文件服务器地址
     * @return
     */
    private String getFileServerUrl() {
       return "";
    }
    
}
