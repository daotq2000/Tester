package Interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import DAO.Views_DAO;
import Model.Views;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	 
	HttpSession session = request.getSession();
	if(session.getAttribute("username") == null || !(session.getAttribute("username").equals("admin")) ){
		response.sendRedirect(request.getContextPath() + "/user/login.htm");
		return false;
	}
	return true;

}
 
}
