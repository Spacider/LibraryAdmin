package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import bean.StudentsBean;
import db.dbutilADMIN;

public class StudentDAO {
	public StudentsBean getStudentByScardNo(String scard_no){
		dbutilADMIN dbutilADMIN = new dbutilADMIN();
		String sql="select * from SYSTEM.SCARD_VIEW where Scard_no='"+scard_no+"'";
		ResultSet rs =dbutilADMIN.query(sql);
		try {
			if (rs !=  null) {
				while (rs.next()) {	
					StudentsBean stu =new StudentsBean();
					stu.setSname(rs.getString("Sname"));
					stu.setSsex(rs.getString("Ssex"));
					stu.setGrade(rs.getString("grade"));
					stu.setSpwd(rs.getString("Spwd"));
					stu.setBook_max(rs.getString("book_max"));
					return stu;
				}
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	public int getmax_book(String scard_no){
		dbutilADMIN dbutilADMIN = new dbutilADMIN();
		String sql="select book_max from SCARD_MAX,SCARD  where SCARD_MAX.GRADE=SCARD.GRADE AND SCARD.SCARD_NO='"+scard_no+"'";
		ResultSet rs =dbutilADMIN.query(sql);
		int max_book = 0;
		try {
			if (rs !=  null) {
				while (rs.next()) {	
					 max_book = rs.getInt("book_max");
				}
				return max_book;
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
		return 0;
	}
	
	
}
