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
		
		<table class="table-striped" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th>借书证</th>
				<th>书籍编号</th>
				<th>还书数量</th>
				<th>还书时间</th>
			</tr>
			<%
				String str_Scard_no = (String)request.getSession().getAttribute("Scard_no");
				BookDAO bookDao=new BookDAO();
				
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
			String loginURL = "http://localhost:8080/stu_bookadmin/stu_library.jsp";
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
