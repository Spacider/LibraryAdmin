package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbutilADMIN;

/**
 * Servlet implementation class do_update_book
 */
@WebServlet(urlPatterns="/servlet/do_update_book")
public class do_update_book extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		response.setHeader("content-type", "text/html;charset=UTF-8");   
		request.setCharacterEncoding("UTF-8");  
		
		String book_no=request.getParameter("book_no");
		String book_name=request.getParameter("book_name");
		String book_author=request.getParameter("book_author");
		String book_press=request.getParameter("book_press");
		String book_rest_num=request.getParameter("book_rest_num");
		String book_details=request.getParameter("book_details");
		
		dbutilADMIN db=new dbutilADMIN();
		String sql="update Book set book_name='"+book_name+"',book_author='"+book_author+"'," +
				"book_press='"+book_press+"',book_rest_num='"+Integer.parseInt(book_rest_num)+"',book_details='"+book_details+"' where " +
						"ISBN='"+book_no+"'";
		db.update(sql);
		String loginURL = "http://localhost:8080/stu_bookadmin/book_admin.jsp";
		String setTime = "3";
		String say = "ÐÞ¸Ä³É¹¦£¡";
		response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
