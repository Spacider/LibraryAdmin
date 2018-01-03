<%@page import="DAO.borrowDao"%>
<%@page import="bean.booksBean"%>
<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" contentType="text/html; charset=utf-8"%>
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
			<a href="stu_library.jsp">首页</a>
				<ul class="second-ul">
				<li><a href="register.jsp">注册</a></li>
				<li><a href="login.jsp">登录</a></li>
				</ul>
			 </li>
			
			<li>
			<a href="stu_library.jsp">书籍借阅</a>
				<ul class="second-ul">
				<li><a href="book.jsp">查看书库</a></li>
				<li><a href="query_bookroom.jsp">查看图书室</a></li>
				<li><a href="borrow_book.jsp">借书</a></li>
				<li><a href="return_book.jsp">还书</a></li>		
				</ul>
			</li>
			<li>
			<a href="stu_library.jsp">个人借书查询</a>
				<ul class="second-ul">
				<li><a href="query_borrowmyself.jsp">查看个人已借</a></li>	
				<li><a href="query_returnmyself.jsp">查看个人已还</a></li>	
				</ul>
			</li>
			
		</ul>
		
		<span class="exit">
		<a href="person_msg.jsp?Scard_no=<%=request.getSession().getAttribute("Scard_no") %>" title="查看个人资料">(<%=request.getSession().getAttribute("Scard_no")%>)</a>
		<a href="login.jsp">退出</a>
		</span>
	</nav>
	<main>
		<div class="container">
			<div class="logo"></div>
			<div class="content">
				<div class="say">欢迎来到广西科技大学学生图书馆，我要<a href="borrow_book.jsp">借书</a>或<a href="return_book.jsp">还书</a>！</div>
			</div>
		</div>
	</main>
  </body>
</html>
