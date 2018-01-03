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
@WebServlet(urlPatterns="/servlet/do_add_booktype")
public class do_add_booktype extends HttpServlet {
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
		
		String book_type_no=request.getParameter("book_type_no");
		String book_type_name=request.getParameter("book_type_name");
		
		
		dbutilADMIN db=new dbutilADMIN();
		String sql = "insert into Book_type values ('"+book_type_no+"','"+book_type_name+"')";
		int result = db.update(sql);
		if (result !=0) {
			String loginURL = "http://localhost:8080/stu_bookadmin/book_admin.jsp";
			String setTime = "3";
			String say = "加入书籍状态成功";
			response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		}else {
			String loginURL = "http://localhost:8080/stu_bookadmin/add_book_type.jsp";
			String setTime = "3";
			String say = "加入书籍状态失败，请您重新加入";
			response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		}
	}

}
