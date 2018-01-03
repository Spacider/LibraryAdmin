package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbutilADMIN;

/**
 * Servlet implementation class do_add_book
 */
@WebServlet(urlPatterns="/servlet/do_add_book")
public class do_add_book extends HttpServlet {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String ISBN=request.getParameter("ISBN");
		String book_name=request.getParameter("book_name");
		String book_author=request.getParameter("book_author");
		String book_press=request.getParameter("book_press");
		String book_rest_num=request.getParameter("book_rest_num");
		String book_type_no = request.getParameter("book_type_no");
		String book_details=request.getParameter("book_details");
		String picture = request.getParameter("picture");
		String library_name = request.getParameter("library_name");
		String money = request.getParameter("money");
		
		dbutilADMIN db=new dbutilADMIN();
		System.out.println(money);
		
		String sql = "insert into Book values ('"+ISBN+"','"
					+book_name+"','"+book_author+"','"+book_press+"','"+book_type_no+
					"','"+book_details+"','"+picture+"','"+library_name+"',"+Integer.parseInt(book_rest_num)+",'"+money+"')";
		int result = db.update(sql);
		if (result !=0) {

			String loginURL = "http://localhost:8080/stu_bookadmin/book_admin.jsp";
			String setTime = "3";
			String say = "加入书籍成功";
			response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
		}
			else {
				String loginURL = "http://localhost:8080/stu_bookadmin/add_book.jsp";
				String setTime = "3";
				String say = "加入书籍失败，请您重新加入";
				response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
			}
		}

}
