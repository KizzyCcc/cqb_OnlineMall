package pers.cqb.mall.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import pers.cqb.mall.entity.FileImage;
import pers.cqb.mall.service.*;
import pers.cqb.mall.utils.FileUpload;

import javax.annotation.Resource;
import java.io.InputStream;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

@Controller("baseAction")
@Scope("prototype")
public class BaseAction<T> extends ActionSupport implements RequestAware, SessionAware, ApplicationAware {

    @Resource
    protected CategoryService categoryService;
    @Resource
    protected AccountService accountService;
    @Resource
    protected ProductService productService;
    @Resource
    protected FileUpload fileUpload;
    @Resource
    protected ForderService forderService;
    @Resource
    protected SorderService sorderService;
    @Resource
    protected UserService userService;
    @Resource
    protected StatusService statusService;

    protected Map<String, Object> request;
    protected Map<String, Object> session;
    protected Map<String, Object> application;

    protected Integer page;
    protected Integer rows;
    protected Map<String, Object> pageMap = null;
    protected  String ids;
    protected InputStream inputStream;
    protected List<T> jsonList;
    protected FileImage fileImage;

    public FileImage getFileImage() {
        return fileImage;
    }

    public void setFileImage(FileImage fileImage) {
        this.fileImage = fileImage;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public String getIds() {
        return ids;
    }

    public List<T> getJsonList() {
        return jsonList;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    protected T model;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public Map<String, Object> getPageMap() {
        return pageMap;
    }

    public void setPageMap(Map<String, Object> pageMap) {
        this.pageMap = pageMap;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Override
    public void setApplication(Map<String, Object> map) {
        this.application = map;
    }

    @Override
    public void setRequest(Map<String, Object> map) {
        this.request = map;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

}
