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

$(function(){	
	//顶部导航切换
	$(".tableupdate").click(function(){
		var id = ($(this).parent().parent().find("td").eq(0).text());
		var pro = ($(this).parent().parent().find("td").eq(5).text());
		if(pro=="管理员"||pro=="会员"){
			var flag=window.confirm("你确定要修改用户身份吗?");
			if(flag){
				window.location.href="UserServlet?oper=update&userid="+id+"&pro="+pro+"&upflag=1";
			}
		}else{
			alert("你只能修改用户的身份为管理员或会员");
			return;
		}
		
	})
})	

</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="articleServlet?oper=showPub">首页</a></li>
    <li><a href="#">个人信息</a></li>
    <li><a href="#">查看个人信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo"> 
    <table class="tablelist">
    	<thead>
    	<tr>
    	<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>姓名</th>
        <th>博客名</th>
        <th>个性签名</th>
        <th>注册时间</th>
        <th>是否会员</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
        	List<User> lu = (ArrayList<User>)request.getAttribute("lu");
        	for(User u:lu){
        %>
        <tr>
        <td class="id"><%=u.getId() %></td>
        <td><%=u.getUserName() %></td>
        <td><%=u.getUserBlogName() %></td>
        <td><%=u.getUserMotto() %></td>
        <td><%=u.getUserCTTime() %></td>
        <%
        	String pro = u.getUser_pro();
        	if("1".equals(pro)){
       %><td class="pro" contentEditable="true">会员</td>
        	<%}else {%><td class="pro" contentEditable="true">管理员</td><%} %>
        <td><a class="tableupdate" style="color:red">修改</a> <a href="UserServlet?oper=del&id=<%=u.getId()%>" class="tablelink">删除</a>
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
