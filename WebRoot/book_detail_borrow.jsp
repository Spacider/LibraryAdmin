<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>借书</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/borrow_book.css">
	

  </head>
  
  <body>
    <header>
		<img src="./images/top_backgroup.jpg" alt="无法加载图片资源">
	</header>
	<main>
		<div class="container">
		<div class="logo"></div>
		<fieldset>
			<form action="servlet/do_borrow_book" method="post">
			<%
			if(request.getSession().getAttribute("Scard_no")!=null){
			
			 %>
				<label for="Scard_no">借书证编号：</label>
				<br>
			<input type="text" disabled="disabled" placeholder="请输入借书证编号" name="Scard_no" value="<%=request.getSession().getAttribute("Scard_no") %>" required>
			<br>
			<label for="book_no">书籍编号：</label>
			<br>
			<input type="text" placeholder="请输入书籍编号" name="book_no" value="<%=request.getParameter("book_no") %>" required>
			<br>
			<label for="borrowed_book_num">借阅数目：</label>
			<br>
			<input type="number" placeholder="借书数目" name="borrowed_book_num" value="1">
			<br>
			
			<input type="submit" value="借书">
			
			<%
			}else{
			String loginURL = "http://localhost:8080/stu_bookadmin/login.jsp";
			String setTime = "5";
			String say = "不好意思，请先登录！";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
				
			}
			 %>
	</form>
	</fieldset>
		</div>
	</main>
  </body>
</html>
