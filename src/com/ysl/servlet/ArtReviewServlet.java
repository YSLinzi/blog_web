package com.ysl.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ysl.dao.artReviewDao;
import com.ysl.dao.articleDao;
import com.ysl.dao.userDao;
import com.ysl.entity.ArtReview;
import com.ysl.entity.User;
import com.ysl.toolsBean.ChangeTime;

/**
 * Servlet implementation class ArtReviewServlet
 */
@WebServlet("/ArtReviewServlet")
public class ArtReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	artReviewDao artRDao = new artReviewDao();
	articleDao artDao=new articleDao();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置请求编码格式
		request.setCharacterEncoding("utf-8");
		//设置响应格式
		response.setContentType("text/html;charset=utf-8");
		String oper = request.getParameter("oper");
		if("show".equals(oper)) {
			try {
				getAllReview(request,response);
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
		}else if("showUser".equals(oper)) {
			try {
				getUserReview(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if("insert".equals(oper)) {
			try {
				reviewInsert(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
		else if("del".equals(oper)) {
			doDelete(request,response);
		}else if("showEsp".equals(oper)) {
			try {
				getReveiwArt(request,response);
			} catch (NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			System.out.println("没有找到此操作符号");
		}
	}
	/*
	 * 获取用户信息
	 */
	private void getUserReview(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		User u = (User)request.getSession().getAttribute("logoner");
		int uid = u.getId();
		System.out.println(u.getId());
		List<ArtReview> s= artRDao.getUserReviewList(uid);
		request.setAttribute("argRU", s);
		request.getRequestDispatcher("/review/userReview.jsp").forward(request, response);		
	}

	/**
	 * <p>Title: 获取所有的评论信息</p>  
	 */
	protected void getAllReview(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, NumberFormatException, SQLException {
		List<ArtReview> artR = artReviewDao.getList();
		if(artR!=null) {
			//将查询的用户数据存储到request对象中
			request.setAttribute("artR", artR);
			//请求转发
			request.getRequestDispatcher("/review/showReview.jsp").forward(request, response);
			return;
		}
	}
	/*
	 * 获取指定文章的公开评论信息
	 */
	private void getReveiwArt(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, SQLException, ServletException, IOException {
		try {
			int art_id =Integer.parseInt(request.getParameter("art_id"));
			List<ArtReview> art_R = artReviewDao.getArtReviewList(art_id);
			if(art_R!=null) {
				//将查询的用户数据存储到request对象中
				request.setAttribute("art_R", art_R);
				//请求转发
				request.getRequestDispatcher("/article/artSingleReview.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	/**
	 * 删除评论信息
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//获取数据
		String review_id = request.getParameter("review_id");
		String art_id=request.getParameter("art_id");
		int s=0;
		try {
			//从评论表中删除评论
			s = artReviewDao.delete(Integer.parseInt(review_id));
			//更新文章表中文章的评论数量
			artDao.desArtRevCount(Integer.parseInt(art_id));
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
		if(s>0) {
			System.out.println("删除成功");
			if(request.getParameter("flag")!=null) {
				//说明是从会员页跳转
				response.sendRedirect("ArtReviewServlet?oper=showUser");
				
			}else {
				try {
					getAllReview(request,response);//重新获取评论信息
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}else {
			System.out.println("删除失败");
		}
	}
	/*
	 * 添加评论
	 */
	private String reviewInsert(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, SQLException{
		//获取数据
		String date = request.getParameter("date");
		String content = request.getParameter("content");
		String pub =request.getParameter("pub");
		String user_id = request.getParameter("user_id");
		String art_id = request.getParameter("art_id");
		//根据用户id查询用户博客姓名
		User user_name = userDao.searchBlogName(user_id);
		int s=0;
		s = artReviewDao.insert(new Object[]{user_name.getUserBlogName(),content,date,user_id,pub,art_id});
		if(s>0) {
			System.out.println("插入成功");
			//更新评论总数
			articleDao.setArtReviewCount(art_id);
			//重定向到首页
			response.sendRedirect("main/main.jsp");
		}else {
			System.out.println("插入失败");
		}
		
		
		return null;
	} 
}
