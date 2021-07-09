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
			var date = $("#date").val();
			var content = $('#content').val();
			var pub =  $('#pub').val();
			var art_id = $('#art_id').val();
			var user_id = $('#user_id').val();
			var user_name = $('user_name').val();
			if(content==""){
				alert("评论内容不能为空");
				return;
			}
			var str = '&content='+content+'&pub='+pub+'&art_id='+art_id+'&user_id='+user_id+'&date='+date+'&user_name='+user_name;
			window.top.location.href="ArtReviewServlet?oper=insert"+str;
		})
	})
</script>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="articleServlet?oper=showPub">首页</a></li>
    <li><a href="#">博客空间</a></li>
    <li><a href="#">添加评论</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    <form id="fm">
    	<input type="hidden" value="<%=request.getParameter("art_id") %>" id="art_id"/>
	     <input type="hidden" value="<%=((User)session.getAttribute("logoner")).getId() %>" id="user_id"/>
	    <input type="hidden" value="<%=((User)session.getAttribute("logoner")).getUserBlogName() %>" id="user_name"/>
	    <ul class="forminfo">
	    <li><label></label><input type="date" value="2021-05-01" id="date"/></li>
	    <li><label>评论内容</label><textarea cols="" rows=""  class="dfinput" id="content" style="height:150px;"></textarea></li>
	    <li><label>是否公开</label><cite><input id="pub" type="radio" value="1" checked="checked" />公开&nbsp;&nbsp;&nbsp;&nbsp;<input id="pub" type="radio" value="0" />私密</cite></li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>   
    </div>
</body>

</html>
