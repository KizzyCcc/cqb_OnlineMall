package pers.cqb.mall.action;

import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.CategoryEntity;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;

@Controller("categoryAction")
@Scope("prototype")
public class CategoryAction extends BaseAction implements ModelDriven<CategoryEntity> {


    private CategoryEntity categoryEntity;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    private String result;

    @Override
    public CategoryEntity getModel() {
        categoryEntity = new CategoryEntity();
        return categoryEntity;
    }
    /**********功能测试***********/
    public String test(){
        categoryService.deleteByIds("10,11");
        return "success";
    }
    /**********项目代码***********/
    public String queryJoinAccount(){
        pageMap = new HashMap<String, Object>();
        System.out.println(categoryEntity.getType());
        List<CategoryEntity> categoryList = categoryService
                                            .queryJoinAccount(categoryEntity.getType()+"", page, rows);
        pageMap.put("rows", categoryList);
        int total = categoryService.getCount(categoryEntity.getType()+"");
        pageMap.put("total", total);
        JSONObject json = JSONObject.fromObject(pageMap);
        result = json.toString();
        return "category_query";
    }

    public void save() {
        //System.out.println(categoryEntity);
        categoryService.save(categoryEntity);
    }

    public void update() {
        System.out.println(categoryEntity.getId()+ "   " +categoryEntity.getType());
        categoryService.update(categoryEntity);
    }

    public String deleteByIds() {
        System.out.println(ids);
        categoryService.deleteByIds(ids);
        inputStream = new ByteArrayInputStream("true".getBytes());
        return "stream";
    }

    public String query() {
        jsonList = categoryService.query();
        return "jsonList";
    }
}
