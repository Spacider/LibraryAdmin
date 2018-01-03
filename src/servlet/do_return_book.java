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

import DAO.borrowDao;
import db.dbutilUSER;

/**
 * Servlet implementation class do_return_book
 */
@WebServlet(urlPatterns="/servlet/do_return_book")
public class do_return_book extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
response.setContentType("text/html");
		
		//日期格式化
		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		Date date=new Date();
		
		//从表单中获取数据
		String Scard_no = (String) request.getSession().getAttribute("Scard_no");
		String book_no=request.getParameter("book_no");
		String return_book_num=request.getParameter("return_book_num");
		
		String truedate=sdf.format(date);
		
		dbutilUSER db=new dbutilUSER();
		
		String sql4 = "select get_book_ID from borrowed_book where Scard_no='"+Scard_no+"'and ISBN='"+book_no+"'";
		
		ResultSet resultSet;
		
		resultSet = db.query(sql4);
		
		int get_book_number=0;
		try {
			while (resultSet.next()) {
				get_book_number = resultSet.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		String sql = "insert into return_book values ("+Integer.parseInt(return_book_num)+","+"TO_DATE('" + truedate +"', 'YYYY-MM-DD HH24:MI:SS'),"+(Integer)get_book_number+")";
		
		String loginURL ="";
		String setTime = "5";
		String say ="";
		String sql3="select * from borrowed_book where ISBN='"+book_no+"' and Scard_no='"+Scard_no+"'and BORROWED_BOOK_NUM >= "+return_book_num;//查询借书表中此书籍编号的记录
		ResultSet rs1=db.query(sql3);
		try {
			if(rs1.next()){
				
				String sql1="select book_rest_num from Book where ISBN='"+book_no+"'";//查询该书籍编号对应的书籍剩余的书数量
				ResultSet rs=db.query(sql1);
				int	book_rest_num = 0;
				while(rs.next()){
					book_rest_num = rs.getInt("book_rest_num");
				}
				int book_num=book_rest_num+Integer.parseInt(return_book_num);//该书籍编号对应的书籍剩余的书数量+要还的该书的数量
				String sql2="update Book set book_rest_num='"+book_num+"'where ISBN='"+book_no+"'";
				db.update(sql2);//更新书籍表里该书的数量
				borrowDao borrowDao = new borrowDao();
				if (borrowDao.getGETBOOK_NUMBER((Integer)get_book_number)) {
					String sql5="update  RETURN_BOOK set RETURN_BOOK_NUM="+return_book_num
							+"where get_book_ID="+get_book_number;
							db.update(sql5);
				}
				else {
					db.update(sql);//如果借书的表中有结果此借书证借这本书的记录，才可执行还书的记录插入。
				}
				
			
				
				
				
				
//				String sql6="delete from BORROWED_BOOK where get_book_number="+(Integer)get_book_number;
//				db.update(sql6);
				
				loginURL = "http://localhost:8080/stu_bookadmin/book.jsp";
				say = "恭喜"+Scard_no+"还书成功！";
				response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
				
			}else {
				loginURL = "http://localhost:8080/stu_bookadmin/return_book.jsp";
				say = "对不起"+Scard_no+"您没有借过此书！";
				response.sendRedirect("http://localhost:8080/stu_bookadmin/goto.html?gotoURL=" + loginURL + "&setTime=" + setTime + "&say=" + java.net.URLEncoder.encode(say,"utf8"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
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
