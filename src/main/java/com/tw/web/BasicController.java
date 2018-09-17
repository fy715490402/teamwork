package com.tw.web;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Administrator
 * @version 1.0
 * @date 2018-09-12
 */

public class BasicController {

    public void setSession(String key, Object value, HttpServletRequest request){
        request.getSession().setAttribute(key,value);
    }

    public Object getSession(String key,HttpServletRequest request){
        return request.getSession().getAttribute(key);
    }


}
