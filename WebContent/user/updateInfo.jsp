<%@ page language="java" import="java.util.*,com.ysl.entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
</head>
<script type="text/javascript">
	//校验表单信息
	$(function(){
		$("#fm").submit(function(){
			if($("#blogname").val()==""){
				alert("博客名不能为空");
				return false;
			}else if($("#motto").val()==""){
				alert("个性签名不能为空");
				return false;
			}else{
				return true;
			}
		})
	})
</script>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="articleServlet?oper=showPub">首页</a></li>
    <li><a>个人信息</a></li>
    <li><a>修改个人信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form action="UserServlet" method="post" id="fm">
    	<input  type="hidden" name="oper" value="update"></input>
	    <ul class="forminfo">
	    
	    <li><label>博客名</label><input name="blogname" type="text"  class="dfinput" id="blogname" value="" /></li>
	    <li><label>个性签名</label><textarea name="motto" cols="" rows=""  class="dfinput" id="motto"></textarea></li>
	    <li><label>身份</label><cite><input name="pro" type="radio" value="1" checked="checked" />会员&nbsp;&nbsp;&nbsp;&nbsp;<input name="pro" type="radio" value="2" />管理员</cite></li>
	    
	    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    
    </div>


</body>

</html>
