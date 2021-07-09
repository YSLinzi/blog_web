<%@ page language="java" import="java.util.*,com.ysl.entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>目录</div>
    
    <dl class="leftmenu">
    <%
	  //声明java代码块进行用户信息校验
		User u = (User)request.getSession().getAttribute("logoner");
		String obj=u.getUser_pro();
		String prosflag = (String)request.getSession().getAttribute("pros");
		if("1".equals(obj)||"2".equals(obj)){
    %>
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>个人信息
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="user/userInfo.jsp" target="rightFrame">查看个人信息</a><i></i></li>
        </ul>    
    </dd>
    <%} %>
	    <%
	    	if("1".equals(obj)){
    	%>
	    <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>博客空间
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="UserServlet?oper=create" target="rightFrame">创建博客空间</a></li>
	        <li><cite></cite><a href="article/issueArt.jsp" target="rightFrame">发布文章</a></li>
	        </ul>    
	    </dd>
	    
	    <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>管理文章
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="articleServlet?oper=showCate" target="rightFrame">管理文章分类</a></li>
	        <li><cite></cite><a href="ArtReviewServlet?oper=showUser" target="rightFrame">文章评论</a></li>
	        </ul>    
	    </dd>
	    <%} else if("2".equals(obj)){%>
	    <dd>
	    <div class="title">
	    <span><img src="images/leftico01.png" /></span>管理员菜单
	    </div>
	    	<ul class="menuson">
	        <li><cite></cite><a href="UserServlet?oper=show" target="rightFrame">查看用户信息</a></li>
	        <li><cite></cite><a href="articleServlet?oper=show" target="rightFrame">查看文章信息</a></li>
	        <li><cite></cite><a href="ArtReviewServlet?oper=show" target="rightFrame">查看评论信息</a></li>
	        </ul>    
	    </dd>
	   <%} %> 
    </dl>
</body>
</html>
 