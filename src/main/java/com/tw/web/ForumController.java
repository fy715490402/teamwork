package com.tw.web;

import com.baidu.ueditor.PathFormat;
import com.baidu.ueditor.define.BaseState;
import com.baidu.ueditor.define.FileType;
import com.baidu.ueditor.define.State;
import com.baidu.ueditor.upload.BinaryUploader;
import com.baidu.ueditor.upload.StorageManager;
import com.tw.dao.Page;
import com.tw.domain.User;
import com.tw.domain.forum.Board;
import com.tw.domain.forum.MainPost;
import com.tw.domain.forum.Post;
import com.tw.domain.forum.Topic;
import com.tw.service.ForumService;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;

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

    /**
     * 处理Ueditor文件上传
     */
    @RequestMapping("/upload")
    @ResponseBody
    public String upload(HttpServletRequest request) throws IOException{

        FileItemStream fileStream = null;
        boolean isAjaxUpload = request.getHeader("X_Requested_With") != null;
        if (!ServletFileUpload.isMultipartContent(request)) {
            return new BaseState(false, 5).toJSONString();
        } else {
            ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
            if (isAjaxUpload) {
                upload.setHeaderEncoding("UTF-8");
            }

            try {
                for(FileItemIterator iterator = upload.getItemIterator(request); iterator.hasNext(); fileStream = null) {
                    fileStream = iterator.next();
                    if (!fileStream.isFormField()) {
                        break;
                    }
                }

                if (fileStream == null) {
                    return new BaseState(false, 7).toJSONString();
                } else {
                    String savePath = "/home/fy/tools/temp/";
                    String originFileName = fileStream.getName();
                    String suffix = FileType.getSuffixByFilename(originFileName);
                    //生产新的文件名
                    originFileName = UUID.randomUUID().toString();
                    savePath = savePath + originFileName +suffix;
                    //long maxSize = (Long)conf.get("maxSize");
                    if (!validType(suffix)) {
                        return new BaseState(false, 8).toJSONString();
                    } else {
                        savePath = PathFormat.parse(savePath, originFileName);
                        //String physicalPath = (String)conf.get("rootPath") + savePath;
                        String physicalPath =  savePath;
                        InputStream is = fileStream.openStream();
                        State storageState = StorageManager.saveFileByInputStream(is, physicalPath, 2048000);
                        is.close();
                        if (storageState.isSuccess()) {
                            storageState.putInfo("url", request.getContextPath()+"/files/"+originFileName+suffix);
                            storageState.putInfo("type", suffix);
                            storageState.putInfo("original", originFileName + suffix);
                        }

                        return storageState.toJSONString();
                    }
                }
            } catch (FileUploadException var14) {
                return new BaseState(false, 6).toJSONString();
            } catch (IOException var15) {
                return new BaseState(false, 4).toJSONString();
            }
        }


    }

    public boolean validType(String type){
        String[] allowTypes=new String[]{".png", ".jpg", ".jpeg", ".gif", ".bmp"};
        List<String> list = Arrays.asList(allowTypes);
        return list.contains(type);
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
    public String showTopic(@PathVariable("topicId")Serializable topicId,
                            @MatrixVariable(required = false,defaultValue = "1")int pageNo, Model model){
        Page<Post> postPage = forumService.getPostsByTopicId(topicId,20,pageNo);
        Topic topic = forumService.getTopicById(topicId);
        model.addAttribute("postPage",postPage);
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
