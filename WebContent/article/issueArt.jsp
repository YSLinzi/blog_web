<%@ page language="java" import="java.util.*,com.ysl.entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style1.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
</head>
<style>
           /* 控制编辑区域的 */
         input[type="date"]::-webkit-datetime-edit{
           /* content: '起始时间'; */
           color: rgb(188,188,188); 
           height:30px;
           padding-top:20px;
           padding-left: 20px;
   </style>

<script type="text/javascript">
	//校验表单信息
	$(function(){
		// 找到所在标签元素
	    var $title = $('#title')
	    var $content=$('#content')
	    var $cate = $('#cate')
	    var $index = $('#art_index')
	    // 1.如果失去焦点，则进行检查判断标题是否为空
	    $title.blur(function () {
	        // 封装函数 调用函数
	        fnCheckTitle()
	    })
	    
	    function fnCheckTitle() {
	        // 获取用户输入的数据
	        var vals = $title.val()
	        console.log(vals)
			//验证用户是否为空
	        if (vals=="") {
	        	alert('文章标题不能为空')
	            return
	        }
	    }
	    
	 // 2.如果失去焦点，则进行检查判断内容是否为空
	    $content.blur(function () {
	        // 封装函数 调用函数
	        fnCheckContent()
	    })
	    
	    function fnCheckContent() {
	        // 获取用户输入的数据
	        var vals = $content.val()
	        console.log(vals)
			//验证用户是否为空
	        if (vals=="") {
	        	alert('文章内容不能为空')
	            return
	        }
	    }
	 //3.如果失去焦点，检查文章类别是否为空
	  $cate.blur(function () {
	        // 封装函数 调用函数
	        fnCheckCate()
	    })
	    
	    function fnCheckCate() {
	        // 获取用户输入的数据
	        var vals = $cate.val()
			//验证用户是否为空
	        if (vals=="") {
	        	alert('文章类别不能为空')
	            return
	        }
	    }
	 //4.如果失去焦点，检查文章索引是否为空
	 $index.blur(function () {
	        // 封装函数 调用函数
	        fnCheckIndex()
	    })
	    function fnCheckIndex() {
	        // 获取用户输入的数据
	        var vals = $index.val()
			//验证用户是否为空
	        if (vals=="") {
	        	alert('文章类别不能为空')
	            return
	        }
	    }
	})
</script>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="articleServlet?oper=showPub">首页</a></li>
    <li><a>博客空间</a></li>
    <li><a>发布文章</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>文章信息</span></div>
    <form action="articleServlet?oper=insert" method="post" id="fm">
    	<input  type="hidden" name="oper" value="update"></input>
	    <ul class="forminfo">
	    
	    <li><label>标题</label><input class="dfinput" name="art_title" type="text"   id="title" value="" /></li>
	    <li><label>文章内容</label><textarea name="art_content" cols="" rows=""  class="dfinput" id="content" style="height:100px;"></textarea></li>
	    <li><label>文章类别</label><input class="dfinput" name="art_cate" type="text"  id="cate" value="" /></li>
	    <li><label>文章索引</label><input class="dfinput" name="art_index" type="text"  id="art_index" value="" /></li>
	    <li><label>是否公开</label><cite><input name="pub" type="radio" value="1" checked="checked"  id="pub" />公开&nbsp;&nbsp;&nbsp;&nbsp;<input name="pro" type="radio" value="0" id="pub"/>私密</cite></li>
	    <li><label>是否允许评论</label><cite><input name="rev" type="radio" value="1" checked="checked" id="rev" />是&nbsp;&nbsp;&nbsp;&nbsp;<input name="pro" type="radio" value="0" id="rev"/>否</cite></li>
	    <li><label>发表时间</label><input type="date" value="2021-05-01" name="date"/></li>
	    
	    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    
    </div>


</body>

</html>
