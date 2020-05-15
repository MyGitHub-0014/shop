package com.aishang.controller;

import com.aishang.po.User;
import com.aishang.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author yc950710
 */
@Controller
@RequestMapping("/user") //地址映射@RequestMapping(""),既可以用在类上(隔离路径)又可以用在方法上()
public class UserController {
    /**
     * 调用service
     */
    @Resource
    UserService userService;

    /**
     * 调用session
     */
    @Resource
    HttpSession session;

    /**
     * 修改个人资料
     */
    @RequestMapping("/updatePersonalData")
    public String updatePersonalData(User user,HttpServletResponse response){
    //执行修改
        userService.updatePersonalData(user);
        Cookie cookie = new Cookie("passWord",null);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
        return "personalData";
    }

    /**
     * 跳转到登录页
     */
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    /**
     * 登录校验
     * @return
     */
    @RequestMapping("/doLogin")
    public String doLogin(User user,Model model, HttpServletResponse response,String save){
    //查询用户信息
        User result =  userService.doLogin(user);
        if(result!=null){
        //登陆成功
        //将用户信息放入session
            session.setAttribute("user",result);
            String userName = null;
            try {
                userName = URLEncoder.encode(result.getUserName(),"utf-8");
                Cookie cookie = new Cookie("userName",userName);
                Cookie cookie1 = new Cookie("passWord",result.getPassWord());
                Cookie cookie2 = new Cookie("save", "checked");
                cookie.setPath("/");
                cookie1.setPath("/");
                cookie2.setPath("/");
                if(save!=null){
                    cookie.setMaxAge(60*60*24*7);
                    cookie1.setMaxAge(60*60*24*7);
                    cookie2.setMaxAge(60*60*24*7);
                }else{
                    cookie.setMaxAge(0);
                    cookie1.setMaxAge(0);
                    cookie2.setMaxAge(0);
                }
                response.addCookie(cookie);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            //将登陆人的信息放到model里
                model.addAttribute("user",result);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            return "redirect:/index/toIndex.do";
        }else{
        //登陆失败
            model.addAttribute("msg","用户名或密码有误");
            return "login";
        }
    }

    /**
     * 跳转到注册页
     */
    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    /**
     * 检测用户名是否可用
     */
    @RequestMapping("/checkUserName")
    @ResponseBody
    public String checkUserName(String userName){
    //@ResponseBody相当于response.getWriter().print("ok");
    //若查到记录，则用户名不可用
        Integer count = userService.checkUserName(userName);
    // 请求转发
        return count==0?"ok":"no";
    }

    /**
     * 执行添加
     */
    @RequestMapping("/doRegister")
    public String doRegister(User user,Model model,String passWord1){
    //获取页面信息
        String userName = user.getUserName();
        String passWord = user.getPassWord();
        String phone = user.getPhone();
    //校验
        boolean c = true;
        if(userName==null || "".equals(userName.trim())){
            model.addAttribute("errName","cuo");
            model.addAttribute("userNameMsg","用户名不可为空");
            c = false;
        }
        String regEx = "^(?=.*[\\d])(?=.*[a-zA-Z])(?=.*[\\W])[a-zA-Z\\d\\W]{6,16}$";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(user.getPassWord());
        boolean result1 = m.matches();
        if (result1 == false) {
            model.addAttribute("errPass","cuo");
            model.addAttribute("passWordMsg","密码由6-16的字母、数字、符号组成");
            c = false;
        }
        if(!passWord1.equals(passWord)){
            model.addAttribute("errPass1","cuo");
            model.addAttribute("passWordMsg1","两次密码输入不一致");
            c = false;
        }
        String regEx1 = "^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\\d{8}$";
        Pattern p1 = Pattern.compile(regEx1);
        Matcher m1 = p1.matcher(phone);
        boolean result = m1.matches();
        if(result == false){
            model.addAttribute("errPhone","cuo");
            model.addAttribute("phoneMsg","手机号格式不正确");
            c = false;
        }
    //判断c是true注册成功跳转到登录页否则跳转回注册页
        if(c){
            userService.addUser(user);
            return "login";
        }else{
            model.addAttribute("user",user);
            return "register";
        }

    }

}
