<%@ page language="java" import="java.util.*,com.ysl.entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>

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
    <li><a>文章评论</a></li>
    </ul>
    </div>
    
    <div class="rightinfo"> 
    <table class="tablelist" style="width:100%;">
    	<thead>
    	<tr>
        <th>评论用户</th>
        <th>内容</th>
        <th>评论文章标题</th>
        <th>评论时间</th>
        <th>是否公开</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
        	List<ArtReview> artRs = (ArrayList<ArtReview>)request.getAttribute("argRU");
        	for(ArtReview artR:artRs){
        %>
        <tr style="height:130px;">
        <td><%=artR.getReview_user() %></td>
        <td style="width:30%;"><%=artR.getReview_txt() %></td>
        <td><%=artR.getReview_time() %></td>
        <td><%=artR.getArt_title() %></td>
        <%
        	int pro = artR.getIsPublic();
        	if(pro>0){
       			%><td>公开</td>
        	<%}else {%><td >私密</td><%} %>
        <td><a href="ArtReviewServlet?oper=del&flag=true&review_id=<%=artR.getReview_id() %>&art_id=<%=artR.getArt_id() %>" class="tablelink">删除</a>
        </tr> 
        <%} %>
        </tbody>
    </table>
    </div>   
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
