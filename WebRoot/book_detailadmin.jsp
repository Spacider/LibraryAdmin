<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="DAO.BookDAO" %>
<%@ page import="bean.booksBean" %>
<%@page import="bean.Book_type"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书详情页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/book_detail.css">
	

  </head>
  <%
  request.setCharacterEncoding("utf-8");
   %>
  <body>
  <%
		BookDAO bookDAO = new BookDAO();
		booksBean book = bookDAO.getBookByno(request.getParameter("book_no"));
		Book_type book_type = bookDAO.getBookTypeByno(book.getBook_type_no());
	 %>
    <span class="big">图书</span>> <%=book_type.getBook_type_name() %>
	<hr>
	
	<div class="book-img">
		<img src="./images/<%=book.getPicture() %>.jpg" alt="无法加载图片资源">
	</div>
	<div class="content">
		<p class="book-name"><%=book.getBook_name() %></p>
		<p class="book-author"><%=book.getBook_author() %></p>
		书籍编号：<span class="book-no"><%=book.getISBN() %></span>
		
		<div class="introduce"><h4>内容简介</h4></p>
		<div class="line"></div>
		<p class="book-intro"><%=book.getBook_details() %></p>
		<a href="http://localhost:8080/stu_bookadmin/modify_book_msg.jsp?book_no=<%=book.getISBN()%>&book_name=<%=book.getBook_name()%>
		&book_author=<%=book.getBook_author()%>&book_press=<%=book.getBook_press()%>
		&book_rest_num=<%=book.getBook_rest_num() %>&book_type_no=<%=book.getBook_type_no()%>
		&book_details=<%=book.getBook_details()%>" class="submit-msg">修改信息</a>
		<a href="http://localhost:8080/stu_bookadmin/delte_book.jsp?book_no=<%=book.getISBN()%>
		&book_name=<%=book.getBook_name()%>
		" class="submit-msg">删除书籍</a> 
		
	</div>
	</div>
  </body>
</html>
