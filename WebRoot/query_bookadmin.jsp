<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="DAO.BookDAO" %>
<%@ page import="bean.booksBean" %>
<%@ page import="bean.Book_type" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书籍查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/query_book.css">
	

  </head>
  
  <body>
   	<header>
		<img src="./images/top_backgroup.jpg" alt="无法加载图片资源">
	</header>
	<nav>
		<ul>
			<li>
			<a href="admin_library.jsp">首页</a>
				<ul class="second-ul">
				<li><a href="register.jsp">注册</a></li>
				</ul>
			 </li>
			
			<li>
			<a href="admin_library.jsp">书籍借阅</a>
				<ul class="second-ul">
				<li><a href="book.jsp">查看书库</a></li>
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
	<form action="query_book.jsp" method="post">
		<span class="big">模糊查询:</span>
		<input type="text" placeholder="作者" name="book_author">
		<input type="text" placeholder="书名" name="book_name">
		<input type="text" placeholder="出版社" name="book_press">
		<input type="text" placeholder="书籍编号" name="book_no">
		<input type="text" placeholder="书籍类型" name="book_type">
		<input type="submit" value="检索">
		<br>
		注：输入任何一项即可查询
	</form>
	<table class="table-striped" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>书籍编号</th>
				<th>书籍名称</th>
				<th>作者</th>
				<th>出版社</th>
				<th>剩余数量</th>
				<th>书籍类型</th>
				
			</tr>
			<%
				BookDAO bookDao = new BookDAO();
				String str_book_press = request.getParameter("book_press");
				String str_book_author = request.getParameter("book_author");
				String str_book_type = request.getParameter("book_type");
				String str_book_name = request.getParameter("book_name");
				String str_book_no = request.getParameter("book_no");
			if(str_book_press != null && str_book_press.trim().length() > 0){
				ArrayList<booksBean> bookList=bookDao.getBooksByPress(str_book_press);
				System.out.println(bookList);
				if(bookList!=null&&bookList.size()>0){
					for(int i=0;i<bookList.size();i++){
						booksBean booksbean=bookList.get(i);
						Book_type book_type = bookDao.getBookTypeByno(booksbean.getBook_type_no());
			 %>
			<tr>
				<td><%=booksbean.getISBN() %></td>
				<td><%=booksbean.getBook_name() %></td>
				<td><%=booksbean.getBook_author() %></td>
				<td><%=booksbean.getBook_press() %></td>
				<td><%=booksbean.getBook_rest_num() %></td>
				<td><%=book_type.getBook_type_name() %></td>
			</tr>	
			<%
					}
				}else{
					String loginURL = "http://localhost:8080/stu_bookadmin/query_bookadmin.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关书籍";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
			return;
				}
			}
			
			if(str_book_author != null && str_book_author.trim().length() > 0){
				ArrayList<booksBean> bookList=bookDao.getBooksByAuthor(str_book_author);
				if(bookList!=null&&bookList.size()>0){
					for(int i=0;i<bookList.size();i++){
						booksBean booksbean=(booksBean)bookList.get(i);
						Book_type book_type = bookDao.getBookTypeByno(booksbean.getBook_type_no());
		
			 %>
			<tr>
				<td><%=booksbean.getISBN() %></td>
				<td><%=booksbean.getBook_name() %></td>
				<td><%=booksbean.getBook_author() %></td>
				<td><%=booksbean.getBook_press() %></td>
				<td><%=booksbean.getBook_rest_num() %></td>
				<td><%=book_type.getBook_type_name() %></td>
			</tr>	
			<%
					}
				}
				else{
					String loginURL = "http://localhost:8080/stu_bookadmin/query_bookadmin.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关书籍";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
			return;
				}
			}
			if(str_book_type != null && str_book_type.trim().length() > 0){
				Book_type book_type=bookDao.getBookTypenoByBookType(str_book_type);
				ArrayList<booksBean> bookList=bookDao.getBookByBookTypeno(book_type.getBook_type_no());
				System.out.print("长度："+bookList.size());
				if(bookList!=null && bookList.size()>0){
					for(int i=0;i<bookList.size();i++){
						booksBean booksbean=(booksBean)bookList.get(i);
			 %>
			<tr>
				<td><%=booksbean.getISBN() %></td>
				<td><%=booksbean.getBook_name() %></td>
				<td><%=booksbean.getBook_author() %></td>
				<td><%=booksbean.getBook_press() %></td>
				<td><%=booksbean.getBook_rest_num() %></td>
				<td><%=book_type.getBook_type_name() %></td>
			</tr>	
			<%
					}
				}
				else{
					String loginURL = "http://localhost:8080/stu_bookadmin/query_bookadmin.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关书籍";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
			return;
				}
			}
			 if(str_book_name != null && str_book_name.trim().length() > 0 ){
				booksBean booksbean=bookDao.getBookByname(str_book_name);
				if(booksbean!=null){
				Book_type book_type = bookDao.getBookTypeByno(booksbean.getBook_type_no());
			 %>
			<tr>
				<td><%=booksbean.getISBN() %></td>
				<td><%=booksbean.getBook_name() %></td>
				<td><%=booksbean.getBook_author() %></td>
				<td><%=booksbean.getBook_press() %></td>
				<td><%=booksbean.getBook_rest_num() %></td>
				<td><%=book_type.getBook_type_name() %></td>
			</tr>	
			<%
					 }else{
					 	String loginURL = "http://localhost:8080/stu_bookadmin/query_bookadmin.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关书籍";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
			return;
					 }
					}
					if(str_book_no != null && str_book_no.trim().length() > 0 ){
				booksBean booksbean=bookDao.getBookByno(str_book_no);
				if(booksbean!=null){
				Book_type book_type = bookDao.getBookTypeByno(booksbean.getBook_type_no());
			 %>
			<tr>
				<td><%=booksbean.getISBN() %></td>
				<td><%=booksbean.getBook_name() %></td>
				<td><%=booksbean.getBook_author() %></td>
				<td><%=booksbean.getBook_press() %></td>
				<td><%=booksbean.getBook_rest_num() %></td>
				<td><%=book_type.getBook_type_name() %></td>
			</tr>	
			<%
					}
					else{
					String loginURL = "http://localhost:8080/stu_bookadmin/query_bookadmin.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关书籍";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
			return;
					}
		
				}
			 %>
			 
		</table>
		</div>
	</main>
	<footer></footer>
	
  </body>
</html>
