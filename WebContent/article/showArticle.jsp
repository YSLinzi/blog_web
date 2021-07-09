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
    <li><a>个人信息</a></li>
    <li><a>查看文章信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo"> 
    <table class="tablelist" style="width:100%;">
    	<thead>
    	<tr>
    	<th>文章编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>标题</th>
        <th>内容</th>
        <th>发布时间</th>
        <th>关注量</th>
        <th>作者</th>
        <th>文章状态</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
	      	List<Article> article = (ArrayList<Article>)request.getAttribute("art");
	      	for(Article art:article){
	      %>
        <tr style="height:130px;">
        <td class="id"><%=art.getArtid() %></td>
        <td><%=art.getArt_title() %></td>
        <td style="width:30%;"><%=art.getArt_content() %></td>
        <td><%=art.getArt_pubtime() %></td>
        <td><%=art.getArt_readnum() %></td>
        <td><%=art.getUserName() %></td>
        <%
        	int pro = art.getIsPublic();
        	if(pro>0){
       %><td>公开</td>
        	<%}else {%><td >私密</td><%} %>
        <td><a href="articleServlet?oper=del&artid=<%=art.getArtid()%>" class="tablelink">删除</a>
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
