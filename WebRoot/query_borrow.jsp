<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="bean.Borrowed_book" %>
<%@ page import="DAO.BookDAO" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>借书查询</title>
    
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
			<form action="query_borrow.jsp" method="post">
		<span class="big">模糊查询:</span>
		<input type="text" placeholder="借书证 " name="Scard_no">
		<input type="text" placeholder="书籍编号" name="book_no">
		<input type="submit" value="查询">
		<br>
		注：输入任何一项即可查询
	</form>

		<table class="table-striped" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>索书号</th>
				<th>借书证</th>
				<th>书籍编号</th>
				<th>借书数量</th>
				<th>借书时间</th>
				<th>间隔天数</th>
				<th>逾期时间</th>
				<th>应缴纳罚金 </th>
			</tr>
			<%
				BookDAO bookDao=new BookDAO();
				String str_Scard_no=request.getParameter("Scard_no");
				String str_book_no=request.getParameter("book_no");
				
				if(str_Scard_no!=null&&str_Scard_no.trim().length()>0){
				ArrayList<Borrowed_book> borrow_list=bookDao.getBorrowMsgByScardNo(str_Scard_no);
					if(borrow_list!=null&&borrow_list.size()>0){
					for(int i=0;i<borrow_list.size();i++){
					Borrowed_book borrow=borrow_list.get(i);
			 %>
			<tr>
				<td><%=borrow.getGet_book_number() %></td>
				<td><%=borrow.getScard_no() %></td>
				<td><%=borrow.getISBN() %></td>
				<td><%=borrow.getBorrowed_book_num() %></td>
				<td><%=borrow.getBorrowed_book_time() %></td>
				
				<%
					String date = borrow.getBorrowed_book_time();
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					Date date1 = sdf.parse(date);
					Calendar startDate = Calendar.getInstance();
					startDate.setTime(date1);
					
					Date date2 = new Date();
					sdf.format(date2);
					Calendar endDate = Calendar.getInstance();
					endDate.setTime(date2);
					
					Calendar date5 = (Calendar) startDate.clone(); 
					int daysbetween = 0;
					while(date5.before(endDate)){
						date5.add(Calendar.DAY_OF_MONTH, 1);
						daysbetween++;
					}
				 %>
				<td><%=daysbetween%></td>
				
				<%
				if(daysbetween>10) {
				%>
				<td><%=daysbetween-10%>天</td>
				<td><%=daysbetween-10%>元</td>
				
				<%} else{ %>
				<td>没有逾期</td>	
				<td>无罚金</td>
				<% }%>
				
			</tr>	
			<%
			       }
				}else{
					String loginURL = "http://localhost:8080/stu_bookadmin/query_borrow.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关信息";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		
				}
			}
			if(str_book_no!=null&&str_book_no.trim().length()>0){
			ArrayList<Borrowed_book> borrow_list=bookDao.getBorrowMsgByBookNo(str_book_no);
				if(borrow_list!=null&&borrow_list.size()>0){
					for(int i=0;i<borrow_list.size();i++){
					Borrowed_book borrow=borrow_list.get(i);
			 %>
			 <tr>
				<td><%=borrow.getScard_no() %></td>
				<td><%=borrow.getISBN() %></td>
				<td><%=borrow.getBorrowed_book_num() %></td>
				<td><%=borrow.getBorrowed_book_time() %></td>
			</tr>	
			 <%
			  	  }
			 	}else{
			String loginURL = "http://localhost:8080/stu_bookadmin/query_borrow.jsp";
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
