package com.ui;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;


import com.alibaba.fastjson.JSON;
import com.entity.Easybuy_info;
import com.entity.Easybuy_user;
import com.service.IUserControService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class UserControServlet
 */
@Controller
@RequestMapping("/UserControServlet/")
public class UserControServlet {
    @Autowired
    public IUserControService controservice;


    // 退出
    @RequestMapping("loginout")
    public ModelAndView invaliDate(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/page/login/login");
        request.getSession().invalidate();
        System.out.println("111");
        return modelAndView;
    }

    // 登陆
    @RequestMapping("login")
    public void login(String username, String password, PrintWriter pw, HttpSession session) throws Exception {
        Easybuy_info info = new Easybuy_info();
        info.setName(username);// 用户名
        info.setPwd(password);// 密码
        try {
            // 获取密码和用户名
            boolean flag = controservice.isLogin(info);
            // 判断flag对不对且验证码相同
            if (flag) {
                pw.write("true");
                session.setAttribute("upwdname", "登陆成功");
            } else {
                pw.write("false");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // 登陆img
    @RequestMapping("imges")
    public void imges(String productName, HttpSession session, PrintWriter pw) throws Exception {
        Easybuy_info list = controservice.userinfo(productName);
        if (null != list) {
            pw.write(list.getHead() + "+" + list.getName());
            session.setAttribute("uid", list);
        } else {
            pw.write(0 + "+" + 0);
        }

    }

    // 总数数据
    @RequestMapping("totalRecords")
    @ResponseBody
    public void totalRecords(String count, PrintWriter pw) throws Exception {
        int totalRecords = controservice.getTotalusers(count); // 获取总数量
        System.out.println(count);
        System.out.println(totalRecords);
        pw.write(totalRecords);
    }

    // 分页查询
    @RequestMapping("listselectpage_EasybuyUser")
    @ResponseBody
    public void listselectpage(int page, int userraid, String productName, HttpServletResponse response) throws Exception {
        List<Easybuy_user> list = controservice.getOnePage(page, 10, productName, userraid);
        String data = JSON.toJSONString(list);
        response.getWriter().write(data);

    }

    // 总数数据
    @RequestMapping("uptotal")
    public void updateUser(int uid, int type, PrintWriter pw) throws Exception {
        Easybuy_user productUp = new Easybuy_user(); // 创建对象集合
        productUp.setId(uid); // 商品id
        productUp.setType(type);
        boolean flag = controservice.up_user(productUp);
        if (flag) {
            System.out.println(flag);
            pw.write("true");
        } else {
            pw.write("false");
        }
    }


    // 总数数据
    @RequestMapping("selename")
    @ResponseBody
    public void selename(String productName, HttpServletResponse response) throws Exception {
        List<Easybuy_info> list = controservice.findAll(productName);
        System.out.println(list);
        String data = JSON.toJSONString(list);
        System.out.println(data);
        response.getWriter().write(data);
    }

}
