package pers.cqb.mall.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse rep = (HttpServletResponse) servletResponse;
        if(req.getSession().getAttribute("user") == null) {
            String goURL = req.getServletPath();
            String param = req.getQueryString();
            System.out.println(goURL+" "+param);
            if(param != null)
                goURL = goURL + "?" +param;
            req.getSession().setAttribute("goURL", goURL);
            req.getSession().setAttribute("error", "请先登录！");
            rep.sendRedirect(req.getContextPath() + "/ulogin.jsp");
        } else {
            filterChain.doFilter(req, rep);
        }
    }

    @Override
    public void destroy() {

    }
}
