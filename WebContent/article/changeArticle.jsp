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

// 获取表单信息
$(function(){    
 // 找到所在标签元素
    var $date = $('#date')
    var $Ispub=$('#pub')
    var $Isrev=$('#rev')
   
  // 1.如果失去焦点，则进行检查判断日期是否合法
    $date.blur(function () {
        // 封装函数 调用函数
        fnCheckDate()
    })
    
    function fnCheckDate() {
        // 获取用户输入的数据
        var vals = $date.text()
        // 正则，正则验证用户输入的数据是否合法
        var reDateTime = /^(?:19|20)[0-9][0-9]-(?:(?:0[1-9])|(?:1[0-2]))-(?:(?:[0-2][1-9])|(?:[1-3][0-1])) (?:(?:[0-2][0-3])|(?:[0-1][0-9])):[0-5][0-9]:[0-5][0-9]$/;
		var isDateTime = reDateTime.test(vals);
        if (!isDateTime) {
        	alert('日期格式：yyyy-mm-dd hh:mm:ss')
//             $date.next().show().html('日期格式：yyyy-mm-dd hh:mm:ss')
            return
        }
    }
 
 // 2.如果失去焦点，则进行检查判断文章状态是否合法
    $Ispub.blur(function () {
        // 封装函数 调用函数
        fnCheckPub()
    })
 	function fnCheckPub() {
        // 获取用户输入的数据
        var vals = $Ispub.text()
        // 正则，正则验证用户输入的数据是否合法
        console.log(vals)
        if (!(vals=="是"||vals=="否")) {
        	alert('只能填 是 或者 否');
            return
        }
    }
 
 // 3.如果失去焦点，则进行检查判断评论状态是否合法
    $Isrev.blur(function () {
        // 封装函数 调用函数
        fnCheckRev()
    })
 	function fnCheckRev() {
        // 获取用户输入的数据
        var vals = $Isrev.text()
        // 正则，正则验证用户输入的数据是否合法
        
        if (!(vals=="是"||vals=="否")) {
        	alert('只能填 是 或者 否');
            return
        }
    }
 
 
	$(".tableupdate").click(function(){
		var id = ($(this).parent().parent().find("td").eq(0).text());//文章id
		var title = ($(this).parent().parent().find("td").eq(1).text());//文章标题
		var content = ($(this).parent().parent().find("td").eq(2).text());//文章内容
		var date = ($(this).parent().parent().find("td").eq(3).text());//文章发布时间
		var cate = ($(this).parent().parent().find("td").eq(4).text());//文章类别
		var indexArt = ($(this).parent().parent().find("td").eq(5).text());//文章索引
		var pro = ($(this).parent().parent().find("td").eq(6).text());//文章是否公开
		var rev = ($(this).parent().parent().find("td").eq(6).text());//文章是否允许评论
		if(pro=="是"){
			pro = "1";
		}else{
			pro = "0";
		}
		if(rev=="是"){
			rev = "1";
		}else{
			rev = "0";
		}
		var link = "articleServlet?oper=changeEsp2&artid="+id+"&title="+title+"&content="+content+"&date="+date+"&cate="+cate+"&indexArt="+indexArt+"&pub="+pro+"&rev="+rev;
		window.location.href=link;
	})
})	
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
        <th>类别</th>
        <th>文章索引</th>
        <th>是否公开</th>
        <th>允许评论</th>
        <th>操作</th>
        </tr>
        </thead>
    	
        <tbody>
		<%
    	List<Article> art = (List<Article>)request.getAttribute("art");
    	for(Article a:art){
    %>
        <tr style="height:150px;">
        
        <td class="id"><%=a.getArtid() %></td>
        <td contentEditable="true"><%=a.getArt_title() %></td>
        <td contentEditable="true" style="width:30%;"><%=a.getArt_content() %></td>
        <td contentEditable="true" id="date"><%=a.getArt_pubtime() %></td>
        <td contentEditable="true"><%=a.getCategory() %></td>
        <td contentEditable="true"><%=a.getArt_index() %></td>
        <%
        	int pro = a.getIsPublic();
        	if(pro>0){
       			%><td contentEditable="true" id="pub">是</td>
        	<%}else {%><td contentEditable="true" id="pub">否</td><%} %>
        <%
        	int rev = a.getIsReview();
        	if(rev>0){
       			%><td contentEditable="true" id="rev">是</td>
        	<%}else {%><td contentEditable="true" id="rev">否</td><%} %>
        <td ><a class="tableupdate" style="color:red">修改</a></td>
        </tr>
        <%}%>
        </tbody>
    </table>

    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>

</html>
