package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbutilADMIN;

/**
 * Servlet implementation class doRegister
 */
@WebServlet(urlPatterns="/servlet/doRegister")
public class doRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		final PrintWriter out=response.getWriter();
		//防止输出中文乱码
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");   
		request.setCharacterEncoding("UTF-8");  
		
		
		String Scard_no=request.getParameter("Scard_no");
		String Spwd=request.getParameter("Spwd");
		String Sname=request.getParameter("Sname");
		String Ssex=request.getParameter("Ssex");
		String grade=request.getParameter("grade");
		int max_book = 0;
		
		System.out.println(grade);
		
		if ("本科生".equals(grade)) {
			max_book=10;
		}
		
		if ("研究生".equals(grade)) {
			max_book=20;
		}
		
		if ("教师".equals(grade)) {
			max_book=50;
		}
		
		
		
		if (Scard_no!=null && Spwd!=null && Sname!=null && Ssex!=null && grade!=null) {	
		dbutilADMIN db = new dbutilADMIN();
		String sql="insert into SCARD values('"+Scard_no+"','"+Spwd+"','"+Sname
				+"','"+Ssex+"','"+grade+"')";
//		String msg[] = {Scard_no,Spwd,Sname,Ssex,grade};
		
		db.update(sql);
		
		
		
		
		String loginURL = "http://localhost:8080/stu_bookadmin/login.jsp";
		String setTime = "5";
		String say = "恭喜"+Sname+"注册成功！";
		response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		return;
		}
		
	}

}
