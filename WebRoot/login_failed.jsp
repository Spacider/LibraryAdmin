<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitz`ional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录失败</title>
    
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
			 <br>
   			 <br>
   			 <br>
   			 <br>
   			 <h1>你的用户名或密码错误，请您重新登录</h1>
   			 <br>
   			 <br>
   			 <a class="register" href="login.jsp">重新登录</a>
   			 <a class="register" href="register.jsp">注册</a>
    	</div>
	</main>
    
  </body>
</html>
