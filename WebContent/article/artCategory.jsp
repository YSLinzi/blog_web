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
<script type="text/javascript" src="js/jquery.js"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="articleServlet?oper=showPub">首页</a></li>
    <li><a>管理文章</a></li>
    <li><a>管理文章分类</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click"><a href="articleServlet?oper=addCate&flag=false"><img src="images/t01.png" />添加文章分类</a></li>
        </ul>
    </div>
    
    
    <div class="rightinfo"> 
    <table class="tablelist" style="width:100%;">
    
    <thead>
    <tr>
    <th width="100px;">类别</th>
    <th>标题</th>
    <th>内容</th>
    <th>发布时间</th>
    <th>文章索引</th>
    <th>关注量</th>
    </tr>
    </thead>
    
    <tbody>
    <%
    	List<Article> artCate = (List<Article>)request.getAttribute("artCate");
    	for(Article a:artCate){
    %>
    <tr style="height:130px;">
    <td class="imgtd"><%=a.getCategory() %></td>
    <td><%=a.getArt_title() %></td>
    <td style="width:30%;"><%=a.getArt_content() %></td>
    <td><%=a.getArt_pubtime() %></td>
    <td><%=a.getArt_index() %></td>
    <td><%=a.getArt_readnum() %></td>
    </tr>
    <%} %>
    </tbody>
    
    </table>
    </div>
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>

</html>
    