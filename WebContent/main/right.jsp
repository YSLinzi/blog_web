<%@ page language="java" import="java.util.*,com.ysl.entity.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a >首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="images/sun.png" alt="天气" /></span>
    <b>精选博文</b>
    </div>
    <div class="xline"></div>
    <div class="box"></div> 
    <%
 	    List<Article> artRs = (ArrayList<Article>)request.getAttribute("artpub");
 		for(Article art:artRs){
    %>
    <ul class="infolist" style="margin-left:-40px;">
    <li>
   		 <div>
		    <span><img src="images/dp.png" alt="提醒" /></span>
		    <b><%=art.getArt_title() %></b>
	    </div>
	 </li>
    <li style="margin-top:10px;height:100px;"><%=art.getArt_content() %></li>
    <li>发布时间：<%=art.getArt_pubtime() %></li>
    <li>关注量：<%=art.getArt_readnum() %> &nbsp;&nbsp;&nbsp;评论数量：<%=art.getReviewNum() %>
	    <img src="images/ico04.png" alt="关注"  style="margin-left:15px;"/><a href="articleServlet?oper=notice&art_id=<%=art.getArtid()%>">关注</a>
	    <img src="images/ico06.png" alt="查看"  style="margin-left:15px;"/><a href="ArtReviewServlet?oper=showEsp&art_id=<%=art.getArtid()%>">查看评论</a>
	    <% 
	    	String name=((User)session.getAttribute("logoner")).getUserName();
	    	if(name!=null){
    	%>  
    	<img src="images/iadd.png" alt="评论"  style="margin-left:15px;"/>
	    <a href="review/insertReview.jsp?art_id=<%=art.getArtid()%>">点击评论</a>
	    <%} %>
    </li>
    <li><div class="xline"></div></li>
    <%} %>
    </ul>
    </div>
</body>

</html>
