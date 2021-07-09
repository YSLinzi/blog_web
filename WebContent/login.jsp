<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    }) 
});  
</script> 

</head>

<body style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
<div class="logintop">    
    <span>欢迎登录博客后台管理界面平台</span>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo">轻博客小站</span> 
    <br />
    <%
    	//声明java代码块进行错误提示语的逻辑校验
    	Object obj=request.getAttribute("flag");
    	if(obj!=null){
    %>
	    <div style="text-align: center;">
	     <span style="font-size: 15px;color:darkred;font-weight: bold;">用户名或者密码或者身份错误</span>
	    </div>
    <%} %>
    <%
    	//声明java代码块进行错误提示语的逻辑校验
    	Object obj1=request.getAttribute("flag1");
    	if(obj1!=null){
    %>
	    <div style="text-align: center;">
	     <span style="font-size: 15px;color:darkred;font-weight: bold;">用户名或者密码或者身份不能为空</span>
	    </div>
    <%} %>
       <%
    	//声明java代码块进行注册提示语
    	Object reg=request.getAttribute("reg");
    	if(reg!=null){
    %>
	    <div style="text-align: center;">
	     <span style="font-size: 15px;color:darkred;font-weight: bold;">注册成功</span>
	    </div>
    <%}
    	session.removeAttribute("reg");
    %>
    
    <%
    	//声明java代码块进行Session过期提示语的逻辑校验
    	Object loginOver=request.getAttribute("OutTime");
    	if(loginOver!=null){
    %>
	    <div style="text-align: center;">
	     <span style="font-size: 15px;color:darkred;font-weight: bold;">长时间未会话，请重新登录</span>
	    </div>
    <%} %>
    <div class="loginbox loginbox1">
    <form action="UserServlet" method="post">
    	<input type="hidden" name="oper" value="login" />
    	<ul>
    	<li></li>
	    <li><input name="uname" type="text" placeholder="用户名" class="loginuser"  /></li>
	    <li><input name="pwd" type="password" placeholder="密码" class="loginpwd"  /></li>
	    <li><input name="pro" type="radio" class="loginpro" value="1"/>会员
	    	<input name="pro" type="radio" class="loginpro" value="2"/>管理员<br>
	    </li>
	    <li><input name="" type="submit" class="loginbtn" value="登录"  onclick="javascript:window.location='main.html'"  />
	    <label><a href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;<a  href="UserServlet?oper=login&pro=3" mid="youke">游客入口</a></label>
	    </li>
	   </ul>
    </form>
    
    </div>
    
    </div>
    
	
    
</body>

</html>
