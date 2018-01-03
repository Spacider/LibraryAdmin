<%@page import="bean.Return_book"%>
<%@page import="java.sql.SQLException"%>
<%@page import="db.dbutilUSER"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="oracle.net.aso.s"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
	
		<table class="table-striped" border="0" cellspacing="80%" cellpadding="50px">
			<tr>
				<th>借书证</th>
				<th>书籍编号</th>
				<th>借书数量</th>
				<th>借书时间</th>
				<th>间隔天数</th>
				<th>是否已还</th>
				<th>逾期时间</th>
				<th>应缴纳罚金 </th>
			</tr>
			<%
				//查询是否还书
					String str_Scard_no = (String)request.getSession().getAttribute("Scard_no");
					String sql = "select BORROWED_BOOK_NUM,RETURN_BOOK_NUM "+
           			 "from borrowed_book left join return_book on (borrowed_book.GET_BOOK_ID=return_book.GET_BOOK_ID)"
           			 +"where borrowed_book.SCARD_NO ='"+str_Scard_no+"'";
					
					String sql2="select time_max from SCARD_MAX WHERE GRADE IN ( SELECT GRADE FROM SCARD  WHERE SCARD_NO='"+str_Scard_no+"')"; 
					
					ResultSet resultSet;
					ResultSet resultSet1;
					int time_max = 0 ;
					
					dbutilUSER db = new dbutilUSER();
					
					resultSet = db.query(sql);
					
					resultSet1 = db.query(sql2);
					while(resultSet1.next()){
						time_max = resultSet1.getInt("TIME_MAX");
					}
					
					
					int BORROWED_BOOK_NUM = 0;
					int RETURN_BOOK_NUM =0;
					String isreturn="未还";	
					int i=0;
				
				BookDAO  bookDao = new BookDAO();
				int rest;
				if(str_Scard_no!=null&&str_Scard_no.trim().length()>0){
				ArrayList<Borrowed_book> borrow_list=bookDao.getBorrowMsgByScardNo(str_Scard_no);
					if(borrow_list!=null&&borrow_list.size()>0){
					while(resultSet.next()){
						
						isreturn = "已还";
						BORROWED_BOOK_NUM = resultSet.getInt("BORROWED_BOOK_NUM");
						RETURN_BOOK_NUM = resultSet.getInt("RETURN_BOOK_NUM");
						if(BORROWED_BOOK_NUM > RETURN_BOOK_NUM){
							rest=BORROWED_BOOK_NUM-RETURN_BOOK_NUM;
							isreturn="未还"+rest+"本";	
						}
	
					Borrowed_book borrow=borrow_list.get(i);
					i++;
					String date = borrow.getBorrowed_book_time();
					//查询时间
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
			<tr>
				<%
				
				 %>
				<td><%=borrow.getScard_no() %></td>
				<td><%=borrow.getISBN() %></td>
				<td><%=borrow.getBorrowed_book_num() %></td>
				<td><%=borrow.getBorrowed_book_time() %></td>
				<%
					
					
				 %>
				<td><%=daysbetween%></td>
				<td><%=isreturn%></td>
				
				<%
				if(daysbetween>time_max ) {
				%>
				<td><%=daysbetween-time_max%>天</td>
				<td><%=daysbetween-time_max%>元</td>
				
				<%} else{ %>
				<td>没有逾期</td>	
				<td>无罚金</td>
				<% }%>
				
			</tr>	
			<% 
						}
					}
			}
				else{
					String loginURL = "http://localhost:8080/stu_bookadmin/stu_library.jsp";
			String setTime = "3";
			String say = "不好意思，查询不到相关信息";
			response.sendRedirect("goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		
				}
			
			
			
			  %>
		</table>
		</div>
	</main>
	<footer></footer>
	
  </body>
</html>
