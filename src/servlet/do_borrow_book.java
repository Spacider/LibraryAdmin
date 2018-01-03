package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookDAO;
import DAO.StudentDAO;
import DAO.borrowDao;
import db.dbutilUSER;

/**
 * Servlet implementation class do_borrow_book
 */
@WebServlet(urlPatterns="/servlet/do_borrow_book")
public class do_borrow_book extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		
		//���ڸ�ʽ��
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		Date date=new Date();
		
		String truedate = sdf.format(date);
		//�ӱ��л�ȡ����
		String Scard_no = (String) request.getSession().getAttribute("Scard_no");
		String book_no=request.getParameter("book_no");
		String borrowed_book_num=request.getParameter("borrowed_book_num");
		
		dbutilUSER db=new dbutilUSER();
		System.out.println(date);
		System.out.println(Integer.parseInt(borrowed_book_num));
		
		String sql4 = "select max(get_book_ID) from borrowed_book";
		int get_book_numer = 0;
		
		
		ResultSet resultSet =  db.query(sql4);
			try {
				while (resultSet.next()) {
				get_book_numer = resultSet.getInt(1);
				}
				get_book_numer++;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		
		

		String sql1="select book_rest_num from Book where ISBN='"+book_no+"'";//��ѯ���鼮��Ŷ�Ӧ���鼮ʣ���������
		ResultSet rs=db.query(sql1);
		int	book_rest_num = 0;
		try {
			if(rs.next()){
					book_rest_num=rs.getInt("book_rest_num");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int book_num=book_rest_num-Integer.parseInt(borrowed_book_num);//���鼮��Ŷ�Ӧ���鼮ʣ�����������ȥ���ߺ������
		String sql2="update Book set book_rest_num='"+book_num+"'where ISBN='"+book_no+"'";
		//TO_DATE('2017-12-21 02:08:55', 'YYYY-MM-DD HH24:MI:SS')
		String sql = "insert into borrowed_book values ('"+book_no+"','"+Scard_no+"',TO_DATE('" + truedate +"', 'YYYY-MM-DD HH24:MI:SS'),BOOKSEQUENCE.nextval,"+borrowed_book_num+")";
		
		
		
		String loginURL="";
		String setTime = "";
		String say="";
		
		//�ж��û��Ƿ���δ���鼮
		String scard_no = (String) request.getSession().getAttribute("Scard_no");
		
		System.out.println("scard_no="+scard_no);
		
		borrowDao borrowDao =new borrowDao();
		
		int book_rest = borrowDao.getbooknumber(scard_no);
		
		System.out.println("book_rest="+book_rest);
		
		StudentDAO studentDAO = new StudentDAO();
		
		int max_book = studentDAO.getmax_book(scard_no);
			
		
		System.out.println("max_book="+max_book);
		
		boolean isbuying =true;
		if (book_rest < max_book) {
			System.out.println("�������Խ���");
		}
		else {
			isbuying =false;
			System.out.println("�����Ѿ�����");
		}
		
		
		
		if (isbuying) {
			//���book_num>=0����ִ�н���Ĳ����������������ĸ��²���
			if (book_num>=0) {
				db.update(sql);
				db.update(sql2);
				loginURL = "http://localhost:8080/stu_bookadmin/stu_library.jsp";
				say = "��ϲ"+Scard_no+"����ɹ���";
				response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime +
						"&say=" + java.net.URLEncoder.encode(say,"utf8"));
				return;
			}else{//�������ص��������
				loginURL = "http://localhost:8080/stu_bookadmin/borrow_book.jsp";
				setTime = "10";
				say = "������˼~"+Scard_no+"���鲻�������ѱ���⣬��������鼮��~";
				response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime +
						"&say=" + java.net.URLEncoder.encode(say,"utf8"));
				return;
			}	
		}
		else {
			loginURL = "http://localhost:8080/stu_bookadmin/borrow_book.jsp";
			setTime = "10";
			say = "������˼~"+Scard_no+",���Ľ����Ѿ�����";
			response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime +
					"&say=" + java.net.URLEncoder.encode(say,"utf8"));
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
