<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>读者登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/login.css"> 

  </head>
  
  <body>
  <header>
		<img src="./images/top_backgroup.jpg" alt="无法加载图片资源">
	</header>
	<main>
		<div class="container">
		<div class="logo"></div>
			<fieldset>
			<form action="servlet/dologin" method="post" >
				<label for="Scard_no">借书证编号：</label>
				<br>
			<input type="text" placeholder="请输入借书证编号" name="Scard_no" value="" required>
			<br>
			<label for="password">密码：</label>
			<br>
			<input type="password" placeholder="请输入密码" name="Spwd" value="" required>
			<br>
			<input type="checkbox" name="rememberpwd" value="" align="right">记住密码
			<br>
			<input type="submit" value="进入" name="submit">
			<a class="register" href="register.jsp">注册</a>
	</form>
	</fieldset>
		</div>
	</main>
	<footer></footer>
  </body>
</html>
