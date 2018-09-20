package pers.cqb.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import pers.cqb.mall.entity.CategoryEntity;
import pers.cqb.mall.service.CategoryService;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:../web/WEB-INF/applicationContext.xml"})
@WebAppConfiguration
public class CategoryServiceTest {
    @Resource
    CategoryService categoryService;
    @Test
    public void categoryTest(){
        CategoryEntity category = new CategoryEntity();
        category.setHot("true");
        category.setType("meat");
        categoryService.save(category);
    }
}
