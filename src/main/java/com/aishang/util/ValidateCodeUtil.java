package com.aishang.util;

import cn.dsna.util.images.ValidateCode;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author yc950710
 */
@RequestMapping("validate")
@Component
public class ValidateCodeUtil {
    @Resource
    HttpSession session;
    /**
     * 输出验证码图片
     */
    @RequestMapping("/getImg")
    public void getImg(HttpServletResponse response){
        try {
        // 创建validateCode核心对象
            ValidateCode validateCode = new ValidateCode(163,64,4,100);
            String code = validateCode.getCode();
            session.setAttribute("code",code);
            // 写入io到reponse中，返回前台
            validateCode.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/checkValidateCode")
    @ResponseBody
    public String checkValidateCode(String validateCode){
        String code = (String) session.getAttribute("code");
        String msg = "";
        if(validateCode!=null){
            msg = validateCode.trim().equalsIgnoreCase(code)?"ok":"no";
        }
        return msg;
    }
}
