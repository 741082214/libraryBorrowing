package library.interceptor;

import library.domain.AdminBean;
import library.domain.UserInfoBean;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckLogin implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        UserInfoBean user=(UserInfoBean)request.getSession().getAttribute("user");
        AdminBean admin=(AdminBean)request.getSession().getAttribute("admin");
        if (user==null&&admin==null){
            response.sendRedirect("login.jsp");
            return false;
        }
        return true;
    }
}
