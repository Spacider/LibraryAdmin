package db;

import java.sql.Statement;

import javax.websocket.Session;

import org.apache.jasper.tagplugins.jstl.core.If;

import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class dbutilADMIN{
	
	// 创建一个数据库连接
	Connection connection = null;
	// 创建编译语句对象
	Statement stat =null;
	// 创建预编译语句对象
	PreparedStatement pstat = null;
	// 创建结果集对象
	ResultSet rs1 = null;
	int rs2 ;
	
	//驱动名称
	private static final String driverName="oracle.jdbc.driver.OracleDriver";
	//数据库的地址(通过端口和SID找到对应的数据库)
	private static final String URL="jdbc:oracle:thin:@localhost:1521:stulibrary";
	//数据库登录用户名
	private static final String userName="ADMIN"; 
	//数据库登录密码
	private static final String pwd="123456";
	
	public dbutilADMIN(){
		//默认构造函数
	}
	
	public Connection getConnection(){
		try {
			//加载oracle驱动
			Class.forName(driverName);
			//通过驱动获取数据库的连接
			connection = DriverManager.getConnection(URL,userName,pwd);
			System.out.println("连接成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	//查询
	public ResultSet query(String sql){
		try {
			connection = getConnection();
			stat = connection.createStatement();
			rs1 = stat.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs1;
	}
	
	//更新
	public int update(String sql){
		try {
			connection = getConnection();
			stat = connection.createStatement();
			rs2 = stat.executeUpdate(sql);	
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs2;
	}
	
	//替换
	public void update(String sql, String[] args){
		try {
			connection = getConnection();
			pstat = connection.prepareStatement(sql);
			System.out.println(sql);
			System.out.println(args.length);
			for (int i = 0; i < args.length; i++) {
				pstat.setString(i+1, args[i]);
				System.out.println(pstat);
			}
			
			pstat.executeUpdate();
			connection.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//删除
		public int delete(String sql){
			try {
				connection = getConnection();
				stat = connection.createStatement();
				rs2 = stat.executeUpdate(sql);
				return rs2;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 0;
		}
	
	//关闭查询
	public void close(){
		
		try {
			if(rs1!=null) {
				rs1.close();
			}
			if(stat!=null) {
				rs1.close();
			}
			if(pstat!=null) {
				rs1.close();
			}
			if(connection!=null) {
				rs1.close();
			}

		} catch (SQLException e) {
			// TODO: handle exception
		}
	}
	
	
	
}
