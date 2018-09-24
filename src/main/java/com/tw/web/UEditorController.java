package com.tw.web;

import com.baidu.ueditor.ActionEnter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 */
@RestController
public class UEditorController extends BasicController {

    @RequestMapping("/ueditor")
    public ResponseEntity<String> config(HttpServletRequest request, HttpServletResponse response) throws Exception{
        request.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Type" , "text/html");
        String rootPath=request.getSession().getServletContext().getRealPath("/");
        String contextPath = request.getContextPath();
        String uri = request.getRequestURI();
        return new ResponseEntity<String>(new ActionEnter(request,rootPath).exec(),
                HttpStatus.OK);
    }

}
