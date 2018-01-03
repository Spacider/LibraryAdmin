package bean;

public class StudentsBean {
	private String Scard_no;
	private String Spwd;
	private String Sname;
	private String Ssex;
	private String grade;
	private String book_max;
	private boolean logined = false;
	public String getScard_no() {
		return Scard_no;
	}
	public String getBook_max() {
		return book_max;
	}
	public void setBook_max(String book_max) {
		this.book_max = book_max;
	}
	public void setScard_no(String scard_no) {
		Scard_no = scard_no;
	}
	public String getSpwd() {
		return Spwd;
	}
	public void setSpwd(String spwd) {
		Spwd = spwd;
	}
	public String getSname() {
		return Sname;
	}
	public void setSname(String sname) {
		Sname = sname;
	}
	public String getSsex() {
		return Ssex;
	}
	public void setSsex(String ssex) {
		Ssex = ssex;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public boolean isLogined() {
		return logined;
	}
	public void setLogined(boolean logined) {
		this.logined = logined;
	}  
	
}
