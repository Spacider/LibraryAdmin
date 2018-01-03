<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>学生图书管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/stu_library.css">
	

  </head>
  
  <body>
   <header>
		<img src="./images/top_backgroup.jpg" alt="无法加载图片资源">
	</header>
	<nav>
		<ul>
			<li>
			<a href="admin_library.jsp">首页</a>
			 </li>
			
			<li>
			<a href="admin_library.jsp">书籍借阅</a>
				<ul class="second-ul">
				<li><a href="book_admin.jsp">查看书库</a></li>
				<li><a href="query_bookroomadmin.jsp">查看图书室</a></li>
				<li><a href="query_borrow.jsp">借书查询</a></li>
				<li><a href="query_return.jsp">还书查询</a></li>		
				</ul>
			</li>
			<li id="more">
			<a href="admin_library.jsp">书籍管理</a>
			<ul class="second-ul">
				<li><a href="query_book.jsp">书籍查询</a></li>
				<li><a href="add_book.jsp">添加书籍</a></li>
				<li><a href="add_book_type.jsp">添加书籍类别</a></li>
				<li><a href="add_bookroom.jsp">添加图书室信息</a></li>
			</ul>
			</li>
		
		<span class="exit">
		<a href="person_msg.jsp?Scard_no=<%=request.getSession().getAttribute("Scard_no") %>" title="查看个人资料">(<%=request.getSession().getAttribute("Scard_no")%>)</a>
		<a href="login.jsp">退出</a>
		</span>
	</nav>
	<main>
		<div class="container">
			<div class="logo"></div>
			<div class="content">
				<div class="say">欢迎管理员来到广西科技大学学生图书馆！ </div>
			</div>
		</div>
	</main>
  </body>
</html>
