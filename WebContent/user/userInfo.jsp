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
    <li><a >个人信息</a></li>
    <li><a >查看个人信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo"> 
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>个性签名</th>
        <th>姓名</th>
        <th>博客名</th>
        <th>注册时间</th>
        <th>是否会员</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><%=((User)session.getAttribute("logoner")).getUserMotto()%></td>
        <td><%=((User)session.getAttribute("logoner")).getUserName()%></td>
        <td><%=((User)session.getAttribute("logoner")).getUserBlogName()%></td>
        <td><%=((User)session.getAttribute("logoner")).getUserCTTime()%></td>
        <%
        	String pro = ((User)session.getAttribute("logoner")).getUser_pro();
        	if("1".equals(pro)){
       %><td>会员</td>
        	<%}else {%><td>管理员</td><%} %>
        <td><a href="user/updateInfo.jsp" class="tablelink">修改</a>
        </tr> 
        </tbody>
    </table>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
