<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加书籍</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/add_book.css">
	

  </head>
  <%
   request.setCharacterEncoding("utf-8");
   %>
  <body>
   <main>
		<div class="container">
		<div class="logo"></div>
			<fieldset>
			<form action="servlet/do_add_bookroom" method="post">
				<label for="book_no">图书室名：</label>
				<br>
			<input type="text" placeholder="请输入图书室名" name="bookroomname" required>
			<br>
			<label for="book_name">地点：</label>
			<br>
			<input type="text" placeholder="请输入图书室地点" name="bookroomlocation" required>
			<br>
			<label for="book_name">管理员：</label>
			<br>
			<input type="text" placeholder="请输入图书室管理员" name="bookroomadmin" required>
			<br>
			<input type="submit" class="register" value="添加"></a>
	</form>
	</fieldset>
		</div>
	</main>
	<footer></footer>
  </body>
</html>
