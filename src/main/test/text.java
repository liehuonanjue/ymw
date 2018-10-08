import com.entity.Easybuy_info;
import com.entity.Easybuy_order;
import com.entity.Easybuy_user;
import com.github.pagehelper.PageInfo;
import com.service.IAmountService;
import com.service.IIndentService;
import com.service.IUserControService;
import com.service.impl.IIndentServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class text {

    @Test
    public void text1() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IAmountService bean = context.getBean(IAmountService.class);
        System.out.println(bean.grossCount());
    }

    @Test
    public void text2() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IIndentServiceImpl bean = context.getBean(IIndentServiceImpl.class);
        System.out.println(bean.byidpage(1001));
    }

    @Test
    public void text3() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IIndentService bean = context.getBean(IIndentService.class);
        PageInfo<Easybuy_order> s = bean.getOnePage("1001", 1, 5);
        for (Easybuy_order o : s.getList()) {
            System.out.println("d");
        }
        System.out.println("ds");
    }

    @Test
    public void text4() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IIndentService bean = context.getBean(IIndentService.class);
        List<Easybuy_order> twoPage = bean.getTwoPage(1, 5, "1004");
        for (Easybuy_order easybuy_order : twoPage) {
            System.out.println(easybuy_order);
        }
        System.out.println("ds");
    }

    @Test
    public void text5() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IIndentService bean = context.getBean(IIndentService.class);
        Easybuy_order w = bean.orderdetali("12");
        System.out.println(w);
    }

    @Test
    public void text6() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IIndentService bean = context.getBean(IIndentService.class);
        int totalusers = bean.getTotalusers("", 0);
        System.out.println(totalusers);
    }

    @Test
    public void text7() throws Exception {
        Easybuy_order easybuy_order = new Easybuy_order();
        easybuy_order.setStatus(1);
        easybuy_order.setId(2);
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IIndentService bean = context.getBean(IIndentService.class);
        System.out.println(bean.up_Order(easybuy_order));
    }

    @Test
    public void text8() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IUserControService bean = context.getBean(IUserControService.class);
        System.out.println(bean.userinfo("2"));
    }

    @Test
    public void text9() throws Exception {
        Easybuy_info info = new Easybuy_info();
        info.setName("1");
        info.setPwd("3");
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IUserControService bean = context.getBean(IUserControService.class);
        System.out.println(bean.isLogin(info));
    }

    @Test
    public void text10() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IUserControService bean = context.getBean(IUserControService.class);
        System.out.println(bean.findAll(""));
    }

    @Test
    public void text11() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IUserControService bean = context.getBean(IUserControService.class);
        System.out.println(bean.getOnePage(1, 5, "", 3));

    }

    @Test
    public void text12() throws Exception {
        Easybuy_user info = new Easybuy_user();
        info.setType(1);
        info.setId(2);
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IUserControService bean = context.getBean(IUserControService.class);
        System.out.println(bean.up_user(info));
    }

    @Test
    public void text13() throws Exception {
        Easybuy_info info = new Easybuy_info();
        info.setName("1");
        info.setPwd("3");
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IUserControService bean = context.getBean(IUserControService.class);
        System.out.println(bean.up_userpwd(info));
    }

    @Test
    public void text14() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("spring/spring-config.xml");
        IUserControService bean = context.getBean(IUserControService.class);
        System.out.println(bean.getTotalusers(""));
    }
}

