<%@page import="javax.websocket.Session"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="DAO.BookDAO" %>
<%@ page import="bean.booksBean" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>书库</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/book.css">


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
			<a href="stu_library.jsp">书籍借阅</a>
				<ul class="second-ul">
				<li><a href="book_admin.jsp">查看书库</a></li>
				<li><a href="query_bookroomadmin.jsp">查看图书室</a></li>
				<li><a href="query_borrow.jsp">借书查询</a></li>
				<li><a href="query_return.jsp">还书查询</a></li>
			</ul>
			</li>
			<li id="more">
			<a href="stu_library.jsp">个人借书查询</a>
			<ul class="second-ul">
					<li><a href="query_book.jsp">书籍查询</a></li>
				<li><a href="add_book.jsp">添加书籍</a></li>
				<li><a href="add_book_type.jsp">添加书籍类别</a></li>
				<li><a href="add_bookroom.jsp">添加图书室信息</a></li>
			</ul>
			</li>
		</ul>
		<span class="exit">
		<a href="person_msg.jsp?Scard_no=<%=request.getSession().getAttribute("Scard_no")%>" title="查看个人资料">(<%=request.getSession().getAttribute("Scard_no")%>)</a>
		<a href="login.jsp">退出</a></span>
	</nav>
	<main>
		<div class="container">
		
			<table>
		    <tr>
		    
			 <td>
			<!-- 商品循环开始 -->
				<%
			 BookDAO book = new	 BookDAO();
			 
		 	 ArrayList<booksBean> booklist = book.getAllBooksItem();
		 	 if(booklist == null)
		 	 {
		 	 	System.out.println("空的");	
		 	 }
		 	 if(booklist!=null && booklist.size()>0){
		 	 	for(int i=0;i<booklist.size();i++){
			 	booksBean booksBean=booklist.get(i);
			 	System.out.println(booklist.size());
			 	
				%>
				<div class="bookitem">
					<dl>
						<dt><a href="book_detailadmin.jsp?book_no=<%=booksBean.getISBN()%>"><img src="./images/<%=booksBean.getPicture()%>.jpg" alt="无法加载图片资源"></a></dt>
						<dd><a href="book_detailadmin.jsp?book_no=<%=booksBean.getISBN()%>"><%=booksBean.getBook_name() %></a></dd>
						<dd><a href="book_detailadmin.jsp?book_no">剩余数量:<%=booksBean.getBook_rest_num()%></a></dd>
						<dd><a href="book_detailadmin.jsp?book_no">图书室:<%=booksBean.getLibrary_name()%></a></dd>
					</dl>
				</div>
				<%
				
				}
			}
			
			 %>
			</td>
			<!-- 商品循环结束 -->
			
		</tr>
	</table>

		</div>
	</main>
  </body>
</html>
