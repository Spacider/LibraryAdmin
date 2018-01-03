<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="DAO.BookDAO" %>
<%@ page import="bean.Return_book" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>还书查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/query_borrow_return.css">
	

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
			<form action="query_return.jsp" method="post">
		<span class="big">模糊查询:</span>
		<input type="text" placeholder="借书证 " name="Scard_no">
		<input type="text" placeholder="书籍编号" name="book_no">
		<input type="submit" value="查询">
		<br>
		注：输入任何一项即可查询
	</form>

		<table class="table-striped" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>借书证</th>
				<th>书籍编号</th>
				<th>还书数量</th>
				<th>还书时间</th>
			</tr>
			<%
				BookDAO bookDao=new BookDAO();
				String str_Scard_no=request.getParameter("Scard_no");
				String str_book_no=request.getParameter("book_no");
				
				if(str_Scard_no!=null&&str_Scard_no.trim().length()>0){
				ArrayList<Return_book> return_list=bookDao.getReturnMsgByScardNo(str_Scard_no);
					if(return_list!=null&&return_list.size()>0){
					for(int i=0;i<return_list.size();i++){
					Return_book return_book=return_list.get(i);
			 %>
			<tr>
				<td><%=return_book.getScard_no() %></td>
				<td><%=return_book.getISBN() %></td>
				<td><%=return_book.getReturn_book_num() %></td>
				<td><%=return_book.getReturn_book_time() %></td>
			</tr>	
			<%
			       }
				}else{
				String loginURL = "http://localhost:8080/stu_bookadmin/query_return.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关信息";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		
				
				}
			}
			if(str_book_no!=null&&str_book_no.trim().length()>0){
			ArrayList<Return_book> return_list=bookDao.getReturnMsgByBookNo(str_book_no);
				if(return_list!=null&&return_list.size()>0){
					for(int i=0;i<return_list.size();i++){
					Return_book return_book=return_list.get(i);
			 %>
			 <tr>
				<td><%=return_book.getScard_no() %></td>
				<td><%=return_book.getISBN() %></td>
				<td><%=return_book.getReturn_book_num() %></td>
				<td><%=return_book.getReturn_book_time() %></td>
			</tr>	
			 <%
			  	  }
			 	}
			 	else{
			 		String loginURL = "http://localhost:8080/stu_bookadmin/query_return.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关信息";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		
			 	}
			 }
			  %>
		</table>
		</div>
	</main>
	<footer></footer>
	
  </body>
</html>
