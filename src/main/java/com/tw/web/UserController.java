package com.tw.web;

import com.tw.domain.LoginLog;
import com.tw.domain.User;
import com.tw.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Administrator
 * @version 1.0
 * @date 2018-09-12
 */

@Controller
public class UserController extends BasicController {

    private static String MESSAGE="message";

    @Autowired
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping({"/","/login"})
    public String login(@ModelAttribute("user") User user, HttpServletRequest request,Model model){
        if (user.getUsername()!=null&&user.getPassword()!=null){
            User _user = userService.getUserByName(user.getUsername());
            if (_user!=null){
                if (!_user.getPassword().equals(user.getPassword())){
                    model.addAttribute(MESSAGE,"用户密码不正确！");
                }else {
                    setSession("loginUser",_user,request);
                    setSession("lastLoginLog",(LoginLog)_user.getLoginLogs().iterator().next(),request);
                    LoginLog loginLog = new LoginLog();
                    loginLog.setIp(request.getLocalAddr());
                    loginLog.setUser(_user);
                    userService.loginSuccess(loginLog);
                    return "main";
                }
            }else {
                model.addAttribute(MESSAGE,"用户不存在!");
            }
        }
        return "login";
    }

    @RequestMapping("/home")
    public String home(HttpServletRequest request){
        return "home";
    }

}
