<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Basic ValidateBox - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="themes/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<link href="css/style1.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="js/jquery.js"></script>
	<script src="js/cloud.js" type="text/javascript"></script>
</head>
<body style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  
	<div class="logintop">    
    <span>欢迎注册博客平台</span>    
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
	     <span style="font-size: 15px;color:red;font-weight: bold;">注册失败！基本信息不能为空</span>
	    </div>
    <%} %>
	<div style="margin:20px 0;"></div>
	<div style="margin-left:35%;">
		<div class="easyui-panel" title="用户注册" style="width:500px;height:400px;padding:10px 60px 20px 60px">
		<form id="fm" action="UserServlet" method="post">
		<input type="hidden" name="oper" value="reg"/>
		<table style="height:250px;width:100%;margin-left:50px;">
			<tr>
				<td>用户名</td>
				<td><input id="username" name="username" class="easyui-validatebox textbox" data-options="required:true" missingMessage="用户名必填"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input  id="pwd"name="pwd" class="easyui-validatebox textbox" data-options="required:true" missingMessage="密码必填"></td>
			</tr>
			<tr>
				<td>手机号码</td>
				<td><input id="phone" name="phone" class="easyui-validatebox textbox" data-options="required:true" missingMessage="手机号码必填"></td>
			</tr>
		</table>
		<input type="submit" value="注册" style="margin-left:180px;width:40px;height:30px;"/>
		</form>
	</div>
	</div>
	
	</div>
	<style scoped="scoped">
		.textbox{
			height:20px;
			margin:0;
			padding:0 2px;
			box-sizing:content-box;
		}
	</style>
</body>
</html>