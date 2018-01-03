package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import db.dbutilADMIN;

public class borrowDao {
	public String getbook_max(String scard_no){
		dbutilADMIN db =new dbutilADMIN();
		String sql = "select book_max from scard where scard_no='"+scard_no+"'";
		ResultSet resultSet = db.query(sql);
		String book_max = null;
		
		try {
			while (resultSet.next()) {
				book_max = resultSet.getString("book_max");
			}
			return book_max;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	
	public int getborrrownumber (String  scard_no){
		dbutilADMIN db =new dbutilADMIN();
		String sql = "select sum(BORROWED_BOOK_NUM) from borrowed_book where scard_no='"+scard_no+"'";
		ResultSet resultSet = db.query(sql);
		int book_borrowed = 0;
		
		try {
			while (resultSet.next()) {
				book_borrowed = resultSet.getInt("sum(BORROWED_BOOK_NUM)");
			}
			return book_borrowed;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	public int getreturnnumber (String  scard_no){
		dbutilADMIN db =new dbutilADMIN();
		String sql = "SELECT SUM(RETURN_BOOK_NUM) FROM return_book,borrowed_book where return_book.get_book_ID=borrowed_book.get_book_ID and borrowed_book.scard_no='"+scard_no+"'";
				
		ResultSet resultSet = db.query(sql);
		int book_borrowed = 0;
		
		try {
			while (resultSet.next()) {
				book_borrowed = resultSet.getInt("sum(RETURN_BOOK_NUM)");
			}
			return book_borrowed;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	
	
	public int getbooknumber (String  scard_no){
		int book_borrowed =getborrrownumber(scard_no);
		int book_returned =getreturnnumber(scard_no);
		int book_rest = book_borrowed-book_returned;
		return book_rest;
	}
	
	public boolean getGETBOOK_NUMBER (int GET){
		dbutilADMIN db =new dbutilADMIN();
		String sql = "select  GET_BOOK_ID from return_book";
				
		ResultSet resultSet = db.query(sql);
		int GETBOOK_NUMBER = 0;
		boolean istrue =false;
		
		try {
			while (resultSet.next()) {
				GETBOOK_NUMBER = resultSet.getInt("GET_BOOK_ID");
				if (GETBOOK_NUMBER == GET ) {
					istrue=true;
				}
			}
			return istrue;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return istrue;
		}
	}
	
}
