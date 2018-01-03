package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.dbutilADMIN;

/**
 * Servlet implementation class dologin
 */
@WebServlet(urlPatterns="/servlet/dologin")
public class dologin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dologin() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String Scard_no = request.getParameter("Scard_no");
		String Spwd = request.getParameter("Spwd");
//		System.out.println(name);
//		System.out.println(pwd);
		dbutilADMIN db = new dbutilADMIN();
		String sql ="select * from SCARD where Scard_no='"+Scard_no+"' and Spwd ='"+Spwd+"'";
	 	ResultSet rs = db.query(sql);

	 	
	 	try {
			if(rs.next()){
				//StudentLogin.setLogined(true);
				request.getSession().setAttribute("Scard_no", Scard_no);
				if ("admin".equals(Scard_no)) {
					request.getRequestDispatcher("/admin_library.jsp").forward(request, response);
					return;
				}
				else {
					request.getRequestDispatcher("/stu_library.jsp").forward(request, response);
					return;
				}
				
			}else{
				//StudentLogin.setLogined(false);
				response.sendRedirect("http://localhost:8080/stu_bookadmin/login_failed.jsp");
				return;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
