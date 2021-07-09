package com.ysl.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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
import com.ysl.entity.Article;
import com.ysl.entity.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	userDao userDao=new userDao();
	articleDao artDao=new articleDao();
	artReviewDao artRDao = new artReviewDao();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置请求编码格式
		request.setCharacterEncoding("utf-8");
		//设置响应编码格式
		response.setContentType("text/html;charset=utf-8");
		//获取操作符
		String oper = request.getParameter("oper");
		if("login".equals(oper)) {
			//调用登录处理的方法
			try {
				checkUserLogin(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("reg".equals(oper)) {
			//调用注册方法
			try {
				userReg(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("out".equals(oper)) {
			//调用退出的功能
			userOut(request,response);
		}else if("show".equals(oper)) {
			//查询所有用户的功能
			try {
				userShow(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("del".equals(oper)) {
			try {
				useDel(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		else if("update".equals(oper)) {
			//调用修改信息的功能
			try {
				userChangePwd(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("create".equals(oper)) {
			//判断是否已经创建个人博客空间
			try {
				judgeArea(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else {
			System.out.println("没有找到对应的操作符："+oper);
		}
	}
	/*
	 * 用户注册
	 */
	private void userReg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		//获取请求信息
		String name = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		if(name==""||pwd==""||phone=="") {
			//添加标识符
			request.setAttribute("flag", 0);
			//请求转发
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		//获取当前注册时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		Date date = new Date();
		String s = simpleDateFormat.format(date);
		//处理请求信息
		int sh = userDao.insert(new Object[] {name,pwd,s,phone});
		if(sh>0) {
			System.out.println("插入成功");
			HttpSession hs = request.getSession();
			//强制销毁session
			hs.invalidate();
			request.setAttribute("reg", 0);
			//请求转发
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}else {
			System.out.println("插入失败");
		}
	}
	private void judgeArea(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		//获取用户id
		User u = (User)request.getSession().getAttribute("logoner");
		int uid = u.getId();
		User user = userDao.searchBlogName(String.valueOf(uid));
		if("1".equals(user.getUser_area())) {
			//已经创建空间
			response.sendRedirect("articleServlet?oper=create");
		}else {
			//没有创建空间，跳转到创建页面
			response.sendRedirect("user/areaUserError.jsp");
		}
		
	}
	private void useDel(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		//获取用户id
		String uid = request.getParameter("id");
		//在用户信息表中删除用户信息
		int s = userDao.deleteInfo(uid);
		//在文章表中删除用户发布过的文章
			//根据用户id查找文章id
		List<Article> arts = artDao.getUserArticle(Integer.parseInt(uid));
		
		if(arts!=null) {
			System.out.println("删除的文章id是：");
			for(Article tmp:arts) {
				artDao.delete(tmp.getArtid());
			}
		}
		//在评论表中删除用户发布的评论
			//根据用户id获取评论文章信息
		Map<Integer, Integer> artrs = artRDao.getReviewUserNum(Integer.parseInt(uid));
		Set<Entry<Integer, Integer>> sets2 = artrs.entrySet();
		for(Entry<Integer, Integer> entry : sets2) {
			int key = entry.getKey();
			int val = entry.getValue();
			//更新文章表中用户评论过的文章的评论数量
			artDao.desArtRevCountUid(val,key);
		}
		//根据用户id删除评论
		artReviewDao.deleteUId(Integer.parseInt(uid));
		
		if(s>0) {
			System.out.println("删除成功");
			userShow(request,response);
		}else {
			System.out.println("删除失败");
		}
	}
	//显示所有的用户信息
	private void userShow(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		//显示所有的用户信息
		List<User> lu = userDao.getUserId();
		if(lu!=null) {
			//将查询的用户数据存储到request对象中
			request.setAttribute("lu", lu);
			//请求转发
			request.getRequestDispatcher("/user/showUser.jsp").forward(request, response);
			return;
		}	
	}
	//用户修改个人信息
	private void userChangePwd(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		//获取请求信息
		String upflag = request.getParameter("upflag");
		String pros=request.getParameter("pro");//用户身份
		if(upflag!=null) {
			String uid = request.getParameter("userid");
			if("会员".equals(pros)) {
				pros = "1";
			}else if("管理员".equals(pros)) {
				pros = "2";
			}
			//处理请求
			int indexs = userDao.updateInfo(new Object[] {pros,uid},"true");
			if(indexs>0) {
				userShow(request,response);
				System.out.println("修改成功");
			}else {
				System.out.println("修改失败");
			}
		}
		else {
			String bname=request.getParameter("blogname");//博客名
			String motto = request.getParameter("motto");//个性签名
			User u = (User)request.getSession().getAttribute("logoner");
			int uid = u.getId();
			//处理请求
			int indexs = userDao.updateInfo(new Object[] {motto,bname,pros,uid},"false");
			if(indexs>0) {
				//获取session对象
				HttpSession hs = request.getSession();
				//重新查询用户信息
				User logoner = userDao.getMasterSingle(uid);
				//将用户数据存储到session对象中
				hs.setAttribute("logoner", logoner);
				hs.setAttribute("update", true);
				response.sendRedirect("user/userInfo.jsp");
			}else {
				System.out.println("修改失败");
			}
		}
	
	}
	//处理登录
	private void checkUserLogin(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		//用户身份
		String pros=request.getParameter("pro");
		if("3".equals(pros)) {
			HttpSession hs = request.getSession();
			User logoner = new User();
			logoner.setUser_pro("3");
			//将用户数据存储到session对象中
			hs.setAttribute("logoner", logoner);
			//重定向
			response.sendRedirect("main/main.jsp");
			return;
		}
		//获取请求信息
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		//判断请求信息是否为空	
		if(uname==""||pwd==""||pros=="") {
			//添加标识符
			request.setAttribute("flag1", 0);
			//请求转发
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		//处理请求信息
		User logoner = userDao.getLogoner(new Object[] {uname, pwd,pros});
		if(logoner!=null) {
			HttpSession hs = request.getSession();
			//将用户数据存储到session对象中
			hs.setAttribute("logoner", logoner);
			//重定向
			response.sendRedirect("main/main.jsp");
		}else {
			//添加标识符
			request.setAttribute("flag", 0);
			//请求转发
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}	
	}
	private void userOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取session对象
		HttpSession hs = request.getSession();
		//强制销毁session
		hs.invalidate();
		//重定向
		response.sendRedirect("login.jsp");
	}

}
