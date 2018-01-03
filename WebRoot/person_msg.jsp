<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="bean.StudentsBean" %>
<%@ page import="DAO.StudentDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人资料</title>
    
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
			<form action="" method="post">
			<%
			 String Scard_no=request.getParameter("Scard_no");
			 StudentDAO stuDao=new StudentDAO();
			 StudentsBean stu=stuDao.getStudentByScardNo(Scard_no);
			 %>
				<label for="Scard_no">借书证编号：</label>
				<br>
			<input type="text" placeholder="请输入借书证编号" name="Scard_no" value=<%=Scard_no %> required>
			<br>
			<label for="Spwd">密码：</label>
				<br>
			<input type="text" placeholder="请输入密码" name="Spwd" value=<%=stu.getSpwd() %> required>
			<br>
			<label for="Sname">姓名：</label>
				<br>
			<input type="text" placeholder="请输入姓名" name="Sname" value=<%=stu.getSname() %> required>
			<br>
			<label for="Ssex">性别：</label>
			<input type="text" name="Ssex" value=<%=stu.getSsex() %> required>
			
			<br>
			<label for="grade">年级：</label>
			<input type="text" name="grade" value=<%=stu.getGrade() %> required>
			<br>
			<a class="register" href="modify_person_msg.jsp?Scard_no=<%=Scard_no%>&Sname=<%=stu.getSname()%>&
			Ssex=<%=stu.getSsex()%>&grade=<%=stu.getGrade()%>&Spwd=<%=stu.getSpwd()%>">修改信息</a>
			<a class="register" href="admin_library.jsp">返回</a>
	</form>
	</fieldset>
		</div>
	</main>
	<footer></footer>
  </body>
</html>
