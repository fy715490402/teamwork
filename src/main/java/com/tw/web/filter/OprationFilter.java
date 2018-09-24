package com.tw.web.filter;

import org.springframework.boot.autoconfigure.security.SecurityProperties;

import javax.servlet.*;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OprationFilter extends HttpFilter {
   @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
       String rootPath = req.getRequestURI().substring(req.getContextPath().length());
       if (rootPath.equals("/")||rootPath.equals("/login")){
           super.doFilter(req,res,chain);
       }else {
           res.sendRedirect(req.getContextPath()+"/");
           chain.doFilter(req,res);
       }
    }

}
