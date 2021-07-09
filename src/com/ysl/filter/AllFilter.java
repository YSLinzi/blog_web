package com.ysl.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ysl.entity.User;

@WebFilter(filterName = "/MyFilter",urlPatterns = {"/main/*"})
public class AllFilter implements Filter {
	private FilterConfig fc;
	
	public void destroy() {
		this.fc=null;
	}

	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)sRequest;
		HttpSession session=request.getSession();//获取当前的session对象
		User mark=(User)session.getAttribute("logoner");
		
		request.setCharacterEncoding("utf-8");
		
		String path= request.getServletPath();
		if(mark!=null) {
			chain.doFilter(sRequest,sResponse);
			System.out.println("通行了~~");
		}
		else{
			//重定向到登录页面
			session.setAttribute("OutTime", true);
			((HttpServletResponse) sResponse).sendRedirect("/blog/login.jsp");
			System.out.println("session失效了");
		}
	}

	public void init(FilterConfig fc) throws ServletException {
		this.fc=fc;
	}
}
