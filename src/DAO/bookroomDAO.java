package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.libraryroombean;
import db.dbutilADMIN;

public class bookroomDAO {
	public ArrayList<libraryroombean> getbookroomByname(String name){
		ArrayList<libraryroombean> list = new ArrayList<libraryroombean>();
		dbutilADMIN dbutilADMIN = new dbutilADMIN();
		String sql="select * from LIBRARY_ROOM where name='"+name+"'";
		ResultSet rs =dbutilADMIN.query(sql);
		try {
			if (rs !=  null) {
				while (rs.next()) {	
					libraryroombean libraryroombean =new libraryroombean();
					libraryroombean.setName(rs.getString("name"));
					libraryroombean.setLocation(rs.getString("location"));
					libraryroombean.setAdmin(rs.getString("admin"));
					list.add(libraryroombean);
				}
				return list;
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
}
