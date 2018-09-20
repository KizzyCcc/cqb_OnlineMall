package pers.cqb.mall.utils.Impl;

import org.springframework.stereotype.Component;
import pers.cqb.mall.entity.CategoryEntity;
import pers.cqb.mall.entity.ProductEntity;
import pers.cqb.mall.service.CategoryService;
import pers.cqb.mall.service.ProductService;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;
@Component
public class ProductTimerTask extends TimerTask {
    @Resource
    private ProductService productService;

    @Resource
    private CategoryService categoryService;

    private ServletContext application;

    public void setApplication(ServletContext application) {
        this.application = application;
    }

    @Override
    public void run() {
        System.out.println("---run---");
        List<List<ProductEntity>> bigList = new ArrayList<>();
        for(CategoryEntity categoryEntity : categoryService.queryByHot("true")) {
            List<ProductEntity> list = productService.queryByCategoryId(categoryEntity.getId());
            bigList.add(list);
        }
        application.setAttribute("bigList", bigList);
    }
}
