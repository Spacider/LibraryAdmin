<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/register.css">


  </head>
  
  <%
   request.setCharacterEncoding("utf-8");
   %>
  <body>
   <main>
		<div class="container">
		<div class="logo"></div>
		
			<fieldset>
			<form action="servlet/do_modify_personMsg" method="post">
			
				<label for="Scard_no">借书证编号：</label>
				<br>
			<input type="text" placeholder="请输入借书证编号" name="Scard_no" value=<%=request.getParameter("Scard_no") %> required>
			<br>
			<label for="Spwd">密码：</label>
				<br>
			<input type="text" placeholder="请输入密码" name="Spwd" value=<%=request.getParameter("Spwd") %> required>
			<br>
			<label for="Sname">姓名：</label>
				<br>
			<input type="text" placeholder="请输入姓名" name="Sname" value=<%=request.getParameter("Sname") %> required>
			<br>
			<label for="Ssex">性别：</label>
			<input type="text" name="Ssex" value=<%=request.getParameter("Ssex") %> required>
			
			<br>
			<label for="grade">年级：</label>
			<input type="text" name="grade" value=<%=request.getParameter("grade") %> required>
			<br>
			<input class="register" type="submit" value="确认修改" />
			<a class="register" href="stu_library.jsp">返回</a>
	</form>
	</fieldset>
		</div>
	</main>
	<footer></footer>
  </body>
</html>
