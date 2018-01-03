<%@page import="bean.libraryroombean"%>
<%@page import="DAO.bookroomDAO"%>
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
	<form action="query_bookroom.jsp" method="post">
		<span class="big">图书室查询:</span>
		<input type="text" placeholder="图书室名" name="library_name">
		<input type="submit" value="检索">
		<br>
		
	</form>
	<table class="table-striped" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>图书室名</th>
				<th>地点</th>
				<th>管理员</th>
			</tr>
			<%
				bookroomDAO bookroomDAO =new bookroomDAO();
				String str_libraryroom = request.getParameter("library_name");
				
				System.out.println(str_libraryroom);
				
			if(str_libraryroom != null ){
				ArrayList<libraryroombean> libraryroomList=bookroomDAO.getbookroomByname(str_libraryroom);		
				if(libraryroomList!=null&&libraryroomList.size()>0){
					for(int i=0;i<libraryroomList.size();i++){
						libraryroombean libraryroombean=libraryroomList.get(i);
			 %>
			<tr>
				<td><%=libraryroombean.getName() %></td>
				<td><%=libraryroombean.getLocation() %></td>
				<td><%=libraryroombean.getAdmin() %></td>
			</tr>	
			<%
					}
				}else{
			String loginURL = "localhost:8080/query_bookroom.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关图书室";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
			return;
				}
			}
			else{
				System.out.println("kong");
			}
			%>
		</table>
		</div>
	</main>
	<footer></footer>
	
  </body>
</html>
