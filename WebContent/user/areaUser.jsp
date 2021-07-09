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
    <li><a href="articleServlet?oper=showPub">首页</a></li>
    <li><a>博客空间</a></li>
    <li><a>创建博客空间</a></li>
    </ul>
    </div>
    <div class="mainindex">
    <div class="welinfo">
    <span><img src="images/ico01.png" alt="个人" /></span>
    <b>我的文章</b>
    </div>
    <div class="xline"></div>
    <div class="box"></div> 
    <%
    	String flag = (String)request.getAttribute("artFlag");
    	List<Article> article = (ArrayList<Article>)request.getAttribute("Uart");
    	if("false".equals(flag)){%>
    		<div class="error">
    	    <h2>您暂未创建个人博客空间</h2>
    	    <div class="reindex"><a href="articleServlet?oper=create">前去发表文章</a></div>  
    	    </div>
    <%}else {
    	for(Article art:article){
    	%>
    	
    	<ul class="infolist" style="margin-left:-40px;">
	    <li>
	   		 <div>
			    <span><img src="images/dp.png" alt="提醒" /></span>
			    <b><%=art.getArt_title() %></b>
		    </div>
		 </li>
	    <li style="margin-top:10px;height:100px;"><%=art.getArt_content() %></li>
	    <li>发布时间：<%=art.getArt_pubtime() %>&nbsp;&nbsp;&nbsp;文章类别：<%=art.getCategory() %>&nbsp;&nbsp;&nbsp;文章索引：<%=art.getArt_index() %></li>
	    <li>关注量：<%=art.getArt_readnum() %> &nbsp;&nbsp;&nbsp;评论数量：<%=art.getReviewNum() %>
		    <img src="images/ico06.png" alt="查看"  style="margin-left:15px;"/><a href="ArtReviewServlet?oper=showEsp&art_id=<%=art.getArtid()%>">查看评论</a>
		    <img src="images/iadd.png" alt="修改"  style="margin-left:15px;"/><a href="articleServlet?oper=changeEsp&art_id=<%=art.getArtid()%>">修改文章</a>
		    <img src="images/i04.png" alt="评论"  style="margin-left:15px;width:30px;height:30px;"/><a href="articleServlet?oper=del&from=area&artid=<%=art.getArtid() %>">删除文章</a>
	    </li>
	    <li><div class="xline"></div></li>
	    </ul>
    <%}} %>
    
    </div>
</body>

</html>
