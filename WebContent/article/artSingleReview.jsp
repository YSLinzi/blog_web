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
    <li><a>评论信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo"> 
    <table class="tablelist" style="width:80%;">
    	<thead>
    	<tr>
    	<th>评论编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>内容</th>
        <th>发布时间</th>
        <th>作者</th>
        </tr>
        </thead>
        <tbody>
        <%
        	List<ArtReview> artR = (ArrayList<ArtReview>)request.getAttribute("art_R");
        	for(ArtReview s:artR){
        %>
        <tr style="height:130px;">
        <td class="id"><%=s.getReview_id() %></td>
        <td style="width:30%;"><%=s.getReview_txt() %></td>
        <td><%=s.getReview_time() %></td>
        <td><%=s.getReview_user() %></td>
        <%} %>
        </tbody>
    </table>

    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
