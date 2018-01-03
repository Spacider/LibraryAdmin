package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbutilADMIN;

/**
 * Servlet implementation class do_modify_personMsg
 */
@WebServlet(urlPatterns="/servlet/do_modify_personMsg")
public class do_modify_personMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String Scard_no=request.getParameter("Scard_no");
		String Sname=request.getParameter("Sname");
		String Ssex=request.getParameter("Ssex");
		String  grade=request.getParameter("grade");
		String spwd=request.getParameter("Spwd");
		
		dbutilADMIN db=new dbutilADMIN();
		String sql="update Students set Scard_no='"+Scard_no+"',spwd='"+spwd+"'," +
				"Sname='"+Sname+"',Ssex='"+Ssex+"',grade='"+grade+"' where Scard_no='"+Scard_no+"'";
		db.update(sql);
		String loginURL = "http://localhost:8080/admin_bookadmin/bookadmin.jsp";
		String setTime = "10";
		String say = "修改个人信息成功";
		response.sendRedirect("http://localhost:8080/admin_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
