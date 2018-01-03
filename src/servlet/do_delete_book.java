package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.lang.model.element.Element;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbutilADMIN;

/**
 * Servlet implementation class do_add_booktype
 */
@WebServlet(urlPatterns="/servlet/do_delete_book")
public class do_delete_book extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		
		String ISBN=request.getParameter("ISBN");
		System.out.println(ISBN);
		
		
		dbutilADMIN db=new dbutilADMIN();
		String sql = "delete from book where ISBN = '"+ISBN+"'";
		int result = db.delete(sql);
		if (result !=0) {
			String loginURL = "http://localhost:8080/stu_bookadmin/book_admin.jsp";
			String setTime = "3";
			String say = "É¾³ýÊé¼®³É¹¦";
			response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		}else {
			String loginURL = "http://localhost:8080/stu_bookadmin/delte_book.jsp";
			String setTime = "3";
			String say = "É¾³ýÊé¼®Ê§°Ü£¬ÇëÄúÖØÐÂÉ¾³ý";
			response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		}
	}

}
