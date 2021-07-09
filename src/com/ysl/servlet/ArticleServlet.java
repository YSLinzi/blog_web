package com.ysl.servlet;

import java.io.IOException;
import java.sql.SQLException;
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
import com.ysl.entity.Article;
import com.ysl.entity.User;
import com.ysl.toolsBean.ChangeTime;

/**
 * Servlet implementation class articleServlet
 */
@WebServlet("/articleServlet")
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	articleDao artDao=new articleDao();
	artReviewDao artRDao = new artReviewDao();
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//设置请求编码格式
				request.setCharacterEncoding("utf-8");
				//设置响应编码格式
				response.setContentType("text/html;charset=utf-8");
				//获取操作符
				String oper = request.getParameter("oper");
				if("show".equals(oper)) {
					//查询所有文章的功能
					try {
						doListShow(request,response);
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
				}else if("showPub".equals(oper)) {
					try {
						doSingleShow(request,response);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}else if("changeEsp".equals(oper)) {
					//修改文章--获取文章id
					try {
						dogetArtId(request,response);
					} catch (NumberFormatException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
				else if("changeEsp2".equals(oper)) {
					//修改文章--获取 表单信息，修改文章
					try {
						doChangeArtInfo(request,response);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				else if("notice".equals(oper)) {
					//文章关注数量加1
					try {
						doReviewAdd(request,response);
					} catch (NumberFormatException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else if("create".equals(oper)) {
					//创建个人博客空间
					try {
						doCreateArea(request,response);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if("addCate".equals(oper)) {
					try {
						showAllCate(request,response);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if("del".equals(oper)) {
					//删除文章的功能
					doDelete(request,response);
				}else if("showCate".equals(oper)) {
					//文章分类展示
					try {
						doShowCate(request,response);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if("insert".equals(oper)) {
					if(request.getParameter("cate")!=null) {
						try {
							doInsert2(request,response);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}else {
						//发表文章的功能
						try {
							doInsert(request,response);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					
				}
				else {
					System.out.println("没有找到对应的操作符："+oper);
				}
	}
	/*
	 * 添加文章（只有类别，标题，内容为空）
	 */
	private void doInsert2(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		User u = (User)request.getSession().getAttribute("logoner");
		String art_author = u.getUserName();
		int author_id = u.getId();
		String cate = request.getParameter("cate");
		artDao.InsertCate(new Object[] {art_author,author_id,cate});
		//回到博客空间
		//重新回到博客空间页
		doCreateArea(request,response);
	}
	/*
	 * 显示所有文章的类别并添加文章的类别
	 */
	private void showAllCate(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String flag = request.getParameter("flag");
		User u = (User)request.getSession().getAttribute("logoner");
		int uid = u.getId();
		if("false".equals(flag)) {
			//只执行获取分类信息
			List<String> artCate = artDao.getAllCate(uid);
			request.setAttribute("artCate", artCate);
			//请求转发
			request.getRequestDispatcher("/article/addCate.jsp").forward(request, response);
			return;
		}else {
			//添加分类信息，并跳转到创建文章
			System.out.println("开始添加");
		}
		
	}
	/*
	 * 文章分类显示信息
	 */
	private void doShowCate(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		//获取会员信息
		User u = (User)request.getSession().getAttribute("logoner");
		int uid = u.getId();
		List<Article> art = artDao.getCateArticle(uid);
		if(art!=null) {
			//将查询的用户数据存储到request对象中
			request.setAttribute("artCate", art);
			//请求转发
			request.getRequestDispatcher("/article/artCategory.jsp").forward(request, response);
			return;
		}
		
	}

	/*
	 * 修改文章信息--根据文章id获取文章信息
	 */
	private void dogetArtId(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, SQLException, ServletException, IOException {
		String art_id = request.getParameter("art_id");
		List<Article> art = articleDao.getArticleById(Integer.parseInt(art_id));
		if(art!=null) {
			request.setAttribute("art", art);
			//请求转发
			request.getRequestDispatcher("article/changeArticle.jsp").forward(request, response);
			return;
		}
	}
	/*
	 * 修改文章信息--获取表单信息，更新数据库信息
	 */
	private void doChangeArtInfo(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		//获取数据
		String art_id = request.getParameter("artid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		String cate = request.getParameter("cate");
		String indexArt = request.getParameter("indexArt");
		String pub = request.getParameter("pub");
		String rev = request.getParameter("rev");
		
		//更新文章表
		int flag = artDao.modify(new Object[] {title,content,date,cate,indexArt,pub,rev,art_id});
		if(flag>0) {
			System.out.println("更新文章表成功！");
		}else {
			System.out.println("更新文章表失败");
		}
		//重新回到博客空间页
		doCreateArea(request,response);
	}
	/*
	 * 创建个人博客空间
	 */
	private void doCreateArea(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		// 获取用户id
		User u = (User)request.getSession().getAttribute("logoner");
		int uid = u.getId();
		//在数据库中更新用户已经创建
		userDao.updateArea(uid);
		//在数据库中查询用户是否有发布过文章
		List<Article> art = artDao.getUserArticle(uid);
		if(art!=null) {
			//有，则将文章信息存储到request域中，返回true
			request.setAttribute("Uart", art);
			request.setAttribute("artFlag", "true");
		}else {
			request.setAttribute("artFlag", "false");
			//没有，返回false
		}
		//请求转发
		request.getRequestDispatcher("/user/areaUser.jsp").forward(request, response);
		return;
	}
	/**	
	 * <p>Title: 显示所有文章信息</p>  
	 */
	protected void doListShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException {
		List<Article> art = artDao.getListArticle();
		if(art!=null) {
			//将查询的用户数据存储到request对象中
			request.setAttribute("art", art);
			//请求转发
			request.getRequestDispatcher("/article/showArticle.jsp").forward(request, response);
			return;
		}
	}
	/**
	
	 * <p>Title: 删除文章信息</p>  
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//获取数据
		String artid = request.getParameter("artid");
		int s=0;
		try {
			s = artDao.delete(Integer.parseInt(artid));
			//删除评论表中关于用户的文章的评论
			artReviewDao.deleteArtId(Integer.parseInt(artid));
			
		} catch (NumberFormatException | SQLException e) {
			e.printStackTrace();
		}
		if(s>0) {
			System.out.println("删除成功");
			if(request.getParameter("from")==null) {
				try {
					doListShow(request,response);//重新获取文章信息
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}else {
				//回到博客空间页
				try {
					doCreateArea(request,response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}else {
			System.out.println("删除失败");
		}
		
	}
	/*
	 * 显示公开的文章信息
	 */
	protected void doSingleShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException {
		List<Article> artpub = artDao.getListArticlePub();
		if(artpub!=null) {
			//将查询的用户数据存储到request对象中
			request.setAttribute("artpub", artpub);
			//请求转发
			request.getRequestDispatcher("/main/right.jsp").forward(request, response);
			return;
		}
	}
	/*
	 * 增加文章关注
	 */
	private void doReviewAdd(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, SQLException, ServletException, IOException {
		//获取文章编号
		String art_id=request.getParameter("art_id");
		System.out.println(art_id);
		//调用方法增加关注量
		int s = artDao.getArticleRoteNum(Integer.parseInt(art_id));
		if(s>0) {
			System.out.println("关注成功");
			doSingleShow(request,response);
		}else {
			System.out.println("关注失败");
		}	
	}
	/*
	 * 根据文章id获取文章信息
	 */
	protected void doArtidShow(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException {
		
		List<Article> artpub = artDao.getListArticlePub();
		if(artpub!=null) {
			//将查询的用户数据存储到request对象中
			request.setAttribute("artpub", artpub);
			//请求转发
			request.getRequestDispatcher("/main/right.jsp").forward(request, response);
			return;
		}
	}
	
	
	protected void doInsert(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException {
		//获取文章信息
		String title = request.getParameter("art_title");
		String content = request.getParameter("art_content");
		String pub = request.getParameter("pub");
		String rev = request.getParameter("rev");
		String date =request.getParameter("date");
		String cate = request.getParameter("art_cate");
		String art_index = request.getParameter("art_index");
		User u = (User)request.getSession().getAttribute("logoner");
		if(title==""||content==""||cate==""||art_index=="") {
			//重新回到发布文章页面
			response.sendRedirect("article/issueArt.jsp");
			return;
		}
		String art_author = u.getUserName();
		int author_id = u.getId();
		//更新数据库
		int i = artDao.insert(new Object[] {title,content,art_author,author_id,pub,rev,date,cate,art_index});
		if(i>0) {
			System.out.println("发布成功");
			//重新回到博客空间页
			doCreateArea(request,response);
		}else {
			System.out.println("发布失败");
			return;
		}
	}


}
