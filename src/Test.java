import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.crypto.Data;

import org.apache.catalina.filters.RestCsrfPreventionFilter;
import org.junit.After;
import org.junit.Before;

import DAO.BookDAO;
import DAO.StudentDAO;
import DAO.borrowDao;
import bean.Return_book;
import db.dbutilADMIN;
import oracle.net.aso.l;

public class Test {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@org.junit.Test
	public void test() {
//		SimpleDateFormat sdf=new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
//		Date date=new Date();
//		System.out.println(sdf.format(date));
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
//		borrowDao borrowdao =new borrowDao();
//		Date[] date = new Date[100];
//	
////		System.out.println(date.toString());
//		dbutil db = new dbutil();
//		
//		ResultSet resultSet;
////		String sql = "select BORROWED_BOOK_NUM,RETURN_BOOK_NUM "+
////      			 "from borrowed_book left join return_book on (borrowed_book.GET_BOOK_NUMBER=return_book.GET_BOOK_NUMBER)";
////		
//		String sql="select time_max from SCARD_MAX WHERE GRADE IN (  SELECT GRADE FROM SCARD  WHERE SCARD_NO='2000' )"; 
//				
//		
//		resultSet = db.query(sql);
//		
//		int BORROWED_BOOK_NUM = 0;
//		int RETURN_BOOK_NUM =0;
//		String isreturn = "已还";
//		int count = 0 ;
//	
//		try {
//			while(resultSet.next()){
////				isreturn = "已还";
////				BORROWED_BOOK_NUM = resultSet.getInt("BORROWED_BOOK_NUM");
////				RETURN_BOOK_NUM = resultSet.getInt("RETURN_BOOK_NUM");
////				if(BORROWED_BOOK_NUM>RETURN_BOOK_NUM){
////					isreturn="未还";
////				BORROWED_BOOK_NUM=resultSet.getInt("time_max");
//				}
//				
////				count++;
////				System.out.println(count);
////				System.out.println(BORROWED_BOOK_NUM);
////				System.out.println(RETURN_BOOK_NUM);
////				System.out.println(isreturn);
//			
//		dbutilADMIN db  = new  dbutilADMIN();
//		String sql = "SELECT SUM(RETURN_BOOK_NUM) FROM return_book,borrowed_book where return_book.get_book_number=borrowed_book.get_book_number and borrowed_book.scard_no='2000'";
////				+ "GET_BOOK_NUMBER IN("
////				+ "select GET_BOOK_NUMBER FROM BORROWED_BOOK where"
////				+ "scard_no='2000')";
//		ResultSet rs=db.query(sql);
//		try {
//			while(rs.next()){
//				System.out.println(rs.getString(1));
////				System.out.println(rs.getString("Scard_no"));
////				System.out.println(rs.getInt("return_book_num"));
////				System.out.println(rs.getString("return_book_time"));
//			}
////				}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

		dbutilADMIN dbutilSYSTEM = new dbutilADMIN();
		String sqlString =  "CREATE ROLE 2000 IDENTIFIED BY 123456";
		dbutilSYSTEM.update(sqlString);
		
		
		
	}
}
