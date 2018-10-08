package com.ui;

import com.entity.Easybuy_info;
import com.service.IAmountService;
import com.service.IUserControService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class AmountServlet {
    @Autowired
    public IAmountService amount;

    @RequestMapping("/amountServlet")
    @ResponseBody
    public void selectall(String productName, PrintWriter pw) throws Exception {
        int user = amount.userCount(); // 用户数量
        int commodity = amount.commodityCount(); // 商品数量
        int signFor = amount.signForCount(); // 签收数量
        int unreceipted = amount.unreceiptedCount(); // 未签收数量
        double gross = amount.grossCount();// 总金额
        pw.write(user + "+" + commodity + "+" + signFor + "+" + unreceipted + "+" + gross);
    }

}
