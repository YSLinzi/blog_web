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
</head>
<script type="text/javascript">
	$(function(){	
		$('#sub').click(function(){
			var vals = $('#title').val()
			if(vals==""){
				alert("文章分类不能为空")
				return
			}else{
				var flag=window.confirm("添加成功！当前类别文章为空，前去发表文章~");
				if(flag){
					window.location.href="articleServlet?oper=insert";
				}else{
					window.location.href="articleServlet?oper=insert&cate="+vals
				}
			}
		})	
	})

</script>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="articleServlet?oper=showPub">首页</a></li>
    <li><a>添加文章类别</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>当前文章分类</span></div>
    
    <div class="toolsli">
    <ul class="toollist">
	<%
		List<String> lists = (ArrayList<String>)request.getAttribute("artCate");
		for(String l:lists){
	%>
    <li><a href="#"><img src="images/icon18.png" /></a><h2><%=l %></h2></li>
    <%} %>
    </ul>
    </div>    
    <div class="formtitle"><span>添加文章分类</span></div>
    <div style="display:inline-block;">
    	 <label>添加文章分类</label><input class="dfinput" name="art_title" type="text"  style="margin-left:30px;" id="title" value="" />
    	<a id="sub" style="margin-left:30px;padding:10px;background-color:#EB5309;color:white">提交</a> 
    </div>
    </div>
</body>

</html>
