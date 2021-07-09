## 一、系统需求分析  
  ### 1.功能需求  
结合JDBC和Servlet、java以及JSP等技术，实现以下功能：<br>
	1.游客可以浏览会员公开发布的文章;<br>
	2.游客可以注册为会员用户； <br>
	3.会员用户可以管理其个人基本资料； <br>
	4.会员用户在登录状态下，可以创建个人博客空间、发布文章（可设定公开或不公开，开放或禁止文字评论）、管理文章（创建和管理文章分类、标注索引关键字、编辑、修改或删除文章等）、文章评论（可对文章跟评、关注文章、删除自己文章的评论等）  <br>
	5.系统管理员可以进行用户管理（浏览或更新、删除用户资料），网站文章管理（删除博客文章和评论等） <br> 
  ### 2.数据需求
tb_bloguser 用户信息表：存储注册用户的基本信息<br>
![image](https://user-images.githubusercontent.com/59837343/125079567-5f470a80-e0f6-11eb-90ee-fab7924b0284.png)  
tb_article 博客文章表：存储用户文章的基本信息<br>
![image](https://user-images.githubusercontent.com/59837343/125079625-6e2dbd00-e0f6-11eb-9f9a-86f4c1d4789c.png)  
tb_artreview 文章评论表：存储已发布文章具体信息<br>
![image](https://user-images.githubusercontent.com/59837343/125079669-7a197f00-e0f6-11eb-8789-3007aa1056bc.png)  
## 二、系统设计
  ### 1.业务流程
游客首先进入博客系统的首页，可以查看公开博文列表、博客评论的内容以及文章的评论数量，关注数量。<br>
博客会员或管理者首先需要登录，登录成功后，进入博客页面，会员就可以对自己博客中的博文信息、评论等内容进行管理，而管理员可以对本站所有的博客信息，文章及评论信息进行管理。<br>
![image](https://user-images.githubusercontent.com/59837343/125079711-83a2e700-e0f6-11eb-8fd7-c33663adec58.png)
  ### 2.系统开发环境
操作系统：Windows 10\
JDK环境：Java SE Development Kit（JDK）version 8\
 开发工具：Eclipse Oxygen Release (4.7.0)\
Web服务器：Tomcat 9.0\
数据库：MySQL 8.0\
浏览器：推荐Google Chrome浏览器\
分辨率：最佳效果为1440×900像素
  ### 3.技术方案
本系统的开发采用的是JSP + Servlet + Javabean + JDBC + MySQL的技术路线，JavaBean作为模型的角色，充当JSP和Servlet通信的中间工具，Servlet处理完后设置JavaBean属性，JSP读取此JavaBean的属性，然后进行显示。即JSP作为视图，来表现页面；Servlet作为控制器，控制程序的流程并调用业务进行处理；JavaBean封装了业务逻辑，遵循了MVC设计模式。<br>
同时在编写项目页面时，应用了HTML，CSS，JQuery，JavaScript知识
  ### 4.项目目录
数据库中一共有3个表：用户表、文章信息表、评论信息表。在项目里建了3个类分别为：userDao、articleDao、artReviewDao以及对应的servlet对象：UserServlet、ArticleServlet、ArtReviewServlet。最后是3个封装类对应3个表，每个表的属性和数据库对应表的字段是一样的，分别是：User、Article、ArtReview。<br>
![image](https://user-images.githubusercontent.com/59837343/125079862-ac2ae100-e0f6-11eb-9ffd-379fef42ace7.png)<br>
ps:项目在eclipse中main.jsp文件会报错，以为eclipse不认识frame标签 ==，不过这并没有太大影响，浏览器可以显示出来<br>
## 三、关键代码及运行结果
1.连接MySql数据库<br>  
把对数据库操作封装成一个DB类，便于后续的操作。<br>  
（1）数据库连接分为以下三步：<br>  
* 加载数据库驱动，注册到驱动管理器Class.forName("com.mysql.jdbc.Driver");
* 构建数据库连接URL,String URL="jdbc:mysql://localhost:3306/test";//test为自己创建的数据库，url格式:"jdbc协议：ip地址或者域名+端口+数据库名称"
* 获取Connection对象 Connection conn=DriverManager.getConnection("root","123456",URL);//root为自己mysql的用户名，123456为自己mysql的密码
（2）读取数据，进行各种数据库操作 <br>  
Statement提供了三种执行SQL语句的方法:<br>  
* executeQuery();返回一个ResultSet型的结果集，包含所有满足条件的记录以及相应数据表的相关信息，用于select语句  
* executeUpdate():返回一个int型数值，代表影响数据库记录的条数，即插入，修改或删除记录的条数。用于insert,update以及delete的sql语句  
* execute():返回boolean类型，代表执行此语句是否有resultset返回,有就是true.用于返回多个结果集，更新计数或二者组合的语句  
(3)关闭数据库连接    
2.用户登录  
![登录页面](https://user-images.githubusercontent.com/59837343/125079988-d5e40800-e0f6-11eb-93ab-186b1674985a.png)  
UserServlet对象根据前端页面传过来的pro参数获取用户身份，若是游客，则直接跳转到博客首页；若是会员或者管理员，则将获取到用户名、密码、身份信息传给Controller层的UserDao类对用户进行验证，验证成功则根据博客身份信息进入不同的首页。  
![游客入口](https://user-images.githubusercontent.com/59837343/125081884-1e9cc080-e0f9-11eb-8889-636eda3d68dd.png)  
![会员首页](https://user-images.githubusercontent.com/59837343/125081934-2b211900-e0f9-11eb-8f49-535b7312f968.png)  
![管理员首页](https://user-images.githubusercontent.com/59837343/125081950-32e0bd80-e0f9-11eb-8b4c-a7e903fd836b.png) 
<br>3.游客注册  
![image](https://user-images.githubusercontent.com/59837343/125081993-3b38f880-e0f9-11eb-8f3b-692916ebd90f.png)<br>
用户点击登录页面或游客首页的注册按钮，即可进入注册页面。前端提交表单，把所有的表单的值传到UserServlet对象，获取用户名，密码和手机号码，如果其中某项信息为空，则使用request.setAttribute()设置错误信息，设置请求转发在注册页面通过getAttribute()方法提示用户“注册失败！基本信息不能为空”；否则，注册成功跳转到登录页面。<br>

4.获取会员文章信息<br>
如果会员已经创建自己的博客空间，则会在博客空间中看到自己已经发布的文章以及文章的关注数量，评论数量，添加关注，查看文章的评论，修改文章信息，删除文章等<br>
![image](https://user-images.githubusercontent.com/59837343/125082046-49871480-e0f9-11eb-8778-10d9a6d9af2e.png)  <br>
如果会员没有创建自己的博客空间，则在博客空间会提示“暂未创建个人空间”<br>
![创建博客空间页面](https://user-images.githubusercontent.com/59837343/125082064-50158c00-e0f9-11eb-8823-b42747da7070.png) <br>
（1）查看文章评论<br>
会员点击“查看评论”，将art_id传递给ArtReviewServlet对象，并调用getReveiwArt方法获取指定文章的公开评论信息。在getReveiwArt方法中调用getArtReviewList方法查询数据库中tb_artreview表。<br>
（2）修改文章<br>
会员点击“修改文章”，将art_id传递给ArtReviewServlet对象，并调用dogetArtId和doChangeArtInfo方法获取文章id并更新文章信息。在doChangeArtInfo方法中调用getArtReviewList方法查询数据库中tb_artreview表。<br>  
![修改文章页](https://user-images.githubusercontent.com/59837343/125082115-64f21f80-e0f9-11eb-9b91-3272052ab20e.png)

5.添加文章分类  
![image](https://user-images.githubusercontent.com/59837343/125082156-73d8d200-e0f9-11eb-8fe2-623f28cfbcb7.png)  
![image](https://user-images.githubusercontent.com/59837343/125082184-7a674980-e0f9-11eb-9e62-8916a9fc188a.png)  <br>
会员点击“添加文章分类”，将用户id传递给ArticleServlet对象，并调用showAllCate和doInsert2方法获取文章分类信息，根据提交的文章分类执行articleDao类的getAllCate和InsertCate方法在数据库中插入新的分类。<br>
6.发布文章<br>
![image](https://user-images.githubusercontent.com/59837343/125082221-881ccf00-e0f9-11eb-81a6-7ea5fbb16ea1.png) <br> 
用户进入发布文章页面，填写文章信息，利用JQuery判断填写检查信息是否完整<br>
```
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
```
会员点击“提交”，form表单提交文这个呢的标题，内容，发布时间等信息给ArticleServlet对象，并获取session中存储的用户id，调用doInsert方法执行articleDao类insert方法在数据库中插入新的文章。<br>

7.删除用户<br>
![image](https://user-images.githubusercontent.com/59837343/125082287-9d91f900-e0f9-11eb-8914-1ffba82a7bfb.png)  <br>
管理员点击“查看用户信息”页面的删除按钮，可以删除博客网站的某一用户及其文章，评论信息。由于用户关联三个表，因此删除用户信息需要同时更新数据库中tb_bloguser、 tb_article、tb_artreview三个表的信息。首先调用UserServlet对象中的useDel方法获取用户id，接着通过调用userDao中的deleteInfo方法删除tb_bloguser中的用户信息，articleDao中的delete方法删除用户的文章信息，并利用getReviewUserNum、desArtRevCountUid方法更新用户评论过的文章的评论数量，同时调用artReviewDao中的deleteUId方法删除用户的所有评论。
## 四、测试说明
![image](https://user-images.githubusercontent.com/59837343/125082329-abe01500-e0f9-11eb-8ddb-046bb522cd05.png)<br>
上表中user_pro为1表示该用户为会员，为2表示为管理员，可以利用上表中的数据中name和password在登录页面进行登录

## 五、总结和反思
由于课程时间较赶，代码书写比较简陋粗糙，也没有采用接口实现类方法，而是直接在类中书写函数，可封装性较差。后期改进：采用接口提高封装性。









