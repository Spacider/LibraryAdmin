package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.Book_type;
import bean.Borrowed_book;
import bean.Return_book;
import bean.booksBean;
import db.dbutilADMIN;

public class BookDAO {

	public ArrayList<booksBean> getAllBooksItem(){
		ArrayList<booksBean> list = new ArrayList<booksBean>();
		dbutilADMIN dbutilADMIN =new dbutilADMIN();
		String sql = "select * from Book";
		ResultSet resultSet = dbutilADMIN.query(sql);
		try {
			while (resultSet.next()) {
				booksBean booksBean =new booksBean();
				booksBean.setBook_name(resultSet.getString("book_name"));
				booksBean.setPicture(resultSet.getString("picture"));
//				System.out.println(resultSet.getString("picture"));
				booksBean.setISBN(resultSet.getString("ISBN"));
				booksBean.setLibrary_name(resultSet.getString("Library_name"));
				int temp = resultSet.getInt("book_rest_num");
				booksBean.setBook_rest_num(resultSet.getInt("book_rest_num"));
				
				
				list.add(booksBean);
			}
			return list;
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return null;
	}
	
	public booksBean getBookByno(String ISBN){
		dbutilADMIN db = new dbutilADMIN();
		String sql = "select * from Book where ISBN='"+ISBN+"'";
		ResultSet rs = db.query(sql);
			try {
				if (rs.next()) {
					booksBean book = new booksBean();
					book.setBook_name(rs.getString("book_name"));
					book.setPicture(rs.getString("picture"));
					book.setISBN(rs.getString("ISBN"));
					book.setBook_author(rs.getString("book_author"));
					book.setBook_press(rs.getString("book_press"));
					book.setBook_rest_num(rs.getInt("book_rest_num"));
					book.setBook_type_no(rs.getString("book_type_no"));
					book.setBook_details(rs.getString("book_details"));
					return book;				
				}
				else{
					return null;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}return null;
	}
	
	public Book_type getBookTypeByno(String book_type_no){
		dbutilADMIN dbutilADMIN = new dbutilADMIN();
		String sql = "select * from Book_type where book_type_no='"+book_type_no+"'";
		ResultSet rs= dbutilADMIN.query(sql);
		try {
			if(rs.next()){
				Book_type book_type=new Book_type();
				book_type.setBook_type_name(rs.getString("book_type_name"));
				return book_type;
			}
			else{
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return null;
	}
	
	public ArrayList<booksBean> getBooksByAuthor(String book_author){
		ArrayList<booksBean> list = new ArrayList<booksBean>();
		
		dbutilADMIN db = new dbutilADMIN();
		String sql = "select * from Book where book_author='"+book_author+"'";
		ResultSet rs = db.query(sql);
		try {
			while (rs.next()) {
				booksBean book = new booksBean();
				book.setBook_name(rs.getString("book_name"));
				book.setISBN(rs.getString("ISBN"));
				book.setBook_author(rs.getString("book_author"));
				book.setBook_press(rs.getString("book_press"));
				book.setBook_rest_num(rs.getInt("book_rest_num"));
				book.setBook_type_no(rs.getString("book_type_no"));
				book.setLibrary_name(rs.getString("Library_name"));
				list.add(book);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return null;
	}
	
	public ArrayList<booksBean> getBooksByPress(String book_press){
		ArrayList<booksBean> list = new ArrayList<booksBean>();
		dbutilADMIN db = new dbutilADMIN();
		String sql = "select * from Book where book_press ='"+book_press+"'";
		ResultSet rs = db.query(sql);
		try {
			while (rs.next()) {
				booksBean book = new booksBean();
				book.setBook_name(rs.getString("book_name"));
				book.setISBN(rs.getString("ISBN"));
				book.setBook_author(rs.getString("book_author"));
				book.setBook_press(rs.getString("book_press"));
				book.setBook_rest_num(rs.getInt("book_rest_num"));
				book.setBook_type_no(rs.getString("book_type_no"));
				list.add(book);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return null;
	}
	
	public Book_type getBookTypenoByBookType(String book_type_name){
		dbutilADMIN db=new dbutilADMIN();
		String sql="select * from Book_type where book_type_name='"+book_type_name+"'";
		ResultSet rs=db.query(sql);
		try {
			while(rs.next()){
				Book_type book_type=new Book_type();
				book_type.setBook_type_no(rs.getString("book_type_no"));
				book_type.setBook_type_name(book_type_name);
				return book_type;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return null;
	}
	
	public ArrayList<booksBean>	getBookByBookTypeno(String book_type_no){
		ArrayList<booksBean> list=new ArrayList<booksBean>();
		dbutilADMIN db=new dbutilADMIN();
		String sql="select * from Book where book_type_no='"+book_type_no+"'";
		ResultSet rs=db.query(sql);
			try {
				while(rs.next()){
					booksBean book= new booksBean();
					book.setISBN(rs.getString("ISBN"));
					System.out.println(rs.getString("book_name"));
					book.setBook_name(rs.getString("book_name"));
					book.setBook_author(rs.getString("book_author"));
					book.setBook_press(rs.getString("book_press"));
					book.setBook_rest_num(rs.getInt("book_rest_num"));
					book.setBook_type_no(rs.getString("book_type_no"));
					book.setLibrary_name(rs.getString("Library_name"));
					list.add(book);
				}
				return list;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return null;
	}
	
	public booksBean getBookByname(String Book_name){
		dbutilADMIN db = new dbutilADMIN();
		String sql = "select * from Book where book_name='"+Book_name+"'";
		ResultSet rs = db.query(sql);
			try {
				if(rs.next()) {
					booksBean book= new booksBean();
					book.setBook_name(rs.getString("book_name"));
					book.setISBN(rs.getString("ISBN"));
					book.setBook_author(rs.getString("book_author"));
					book.setBook_press(rs.getString("book_press"));
					book.setBook_rest_num(rs.getInt("book_rest_num"));
					book.setBook_type_no(rs.getString("book_type_no"));
					book.setLibrary_name(rs.getString("Library_name"));
					return book;		
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			return null;
	}
	
	public ArrayList<Borrowed_book> getBorrowMsgByScardNo(String Scard_no){
		ArrayList<Borrowed_book> borrow_list=new ArrayList<Borrowed_book>();
		dbutilADMIN db=new dbutilADMIN();
		String sql="select * from borrowed_book where Scard_no='"+Scard_no+"'";
		ResultSet rs=db.query(sql);
		try {
			while(rs.next()){
				Borrowed_book borrow=new Borrowed_book();
				borrow.setISBN(rs.getString("ISBN"));
				borrow.setBorrowed_book_time(rs.getString("borrowed_book_time"));
				borrow.setScard_no(Scard_no);
				borrow.setBorrowed_book_num(rs.getString("borrowed_book_num"));
				borrow.setGet_book_number(rs.getString("get_book_ID"));
				borrow_list.add(borrow);
			}
			return borrow_list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Borrowed_book> getBorrowMsgByBookNo(String ISBN){
		ArrayList<Borrowed_book> borrow_list=new ArrayList<Borrowed_book>();
		dbutilADMIN db=new dbutilADMIN();
		String sql="select * from borrowed_book where ISBN='"+ISBN+"'";
		ResultSet rs=db.query(sql);
		try {
			while(rs.next()){
				Borrowed_book borrow=new Borrowed_book();
				borrow.setISBN(ISBN);
				borrow.setBorrowed_book_time(rs.getString("borrowed_book_time"));
				borrow.setScard_no(rs.getString("Scard_no"));
				borrow.setBorrowed_book_num(rs.getString("borrowed_book_num"));
				borrow_list.add(borrow);
			}
			return borrow_list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public ArrayList<Return_book> getReturnMsgByScardNo(String ScardNo){
		ArrayList<Return_book> return_list=new ArrayList<Return_book>();
		dbutilADMIN db=new dbutilADMIN();
		String sql = "SELECT ISBN,SCARD_NO,return_book_num,return_book_time from SYSTEM.BOOK_RETURN_VIEW where SCARD_NO='"+ScardNo+"'";
		ResultSet rs=db.query(sql);
		try {
			while(rs.next()){
				Return_book returnBook=new Return_book();
				returnBook.setISBN(rs.getString("ISBN"));
				returnBook.setScard_no(rs.getString("Scard_no"));
				returnBook.setReturn_book_num(rs.getString("return_book_num"));
				returnBook.setReturn_book_time(rs.getString("return_book_time"));
				return_list.add(returnBook);
			}
			return return_list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public ArrayList<Return_book> getReturnMsgByBookNo(String ISBN){
		ArrayList<Return_book> return_list=new ArrayList<Return_book>();
		dbutilADMIN db=new dbutilADMIN();
		String sql = "SELECT ISBN,SCARD_NO,return_book_num,return_book_time from SYSTEM.BOOK_RETURN_VIEW where ISBN='"+ISBN+"'";
		ResultSet rs=db.query(sql);
		try {
			while(rs.next()){
				Return_book returnBook=new Return_book();
				returnBook.setISBN(rs.getString("ISBN"));
				returnBook.setScard_no(rs.getString("Scard_no"));
				returnBook.setReturn_book_num(rs.getString("return_book_num"));
				returnBook.setReturn_book_time(rs.getString("return_book_time"));
				return_list.add(returnBook);
			}
			return return_list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
