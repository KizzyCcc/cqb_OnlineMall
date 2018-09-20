package pers.cqb.mall.listener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import pers.cqb.mall.entity.CategoryEntity;
import pers.cqb.mall.entity.ProductEntity;
import pers.cqb.mall.service.CategoryService;
import pers.cqb.mall.service.ProductService;
import pers.cqb.mall.utils.Impl.ProductTimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;

public class InitDateListener implements ServletContextListener {

    private ApplicationContext context = null;
    private ProductTimerTask productTimerTask = null;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        context = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext());
        productTimerTask = (ProductTimerTask) context.getBean("productTimerTask");
        productTimerTask.setApplication(servletContextEvent.getServletContext());
        new Timer(true).schedule(productTimerTask, 0, 1000*60*60);

    }
    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
