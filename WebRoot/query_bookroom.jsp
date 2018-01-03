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
			<a href="stu_library.jsp">首页</a>
				<ul class="second-ul">
				<li><a href="register.jsp">注册</a></li>
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
			<li id="more">
			<a href="stu_library.jsp">个人借书查询</a>
				<ul class="second-ul">
				<li><a href="query_borrowmyself.jsp">查看个人已借</a></li>	
				<li><a href="query_returnmyself.jsp">查看个人已还</a></li>	
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
			String loginURL = "localhost:8080/stu_bookadmin/query_bookroom.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关图书室";
			response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
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
