<%@ page language="java" import="java.util.*, com.ysl.entity.*" pageEncoding="utf-8"%>
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
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})
	//退出功能
	$("#out").click(function(){
		var flag=window.confirm("你真的要退出吗?");
		if(flag){
			window.top.location.href="UserServlet?oper=out";
		}
	})
	//注册功能
	$("#reg").click(function(){
			window.top.location.href="register.jsp";
	})
})	
</script>
</head>
<body style="background:url(images/topbg.gif) repeat-x;">
    <div class="topleft">
    <a target="_parent"><p style="color:white;font-size:40px;margin:20px;font-style:italic;font-family:'华文行楷'">轻博客小站</p></a>
    </div>        
    <div class="topright">  
    <% 
    	String name=((User)session.getAttribute("logoner")).getUserName();
    	if(name!=null){
    %>  
    <ul>
    <li><a href="javascript:void(0)" id="out">退出</a></li>
    </ul>
     
    <div class="user">
		<span><%=name%></span>
    </div>    
    <%}else{ %>
   	 <ul>
    	<li><a href="javascript:void(0)" id="reg">注册</a></li>
    	</ul>
    <%} %>
    </div>

</body>
</html>
