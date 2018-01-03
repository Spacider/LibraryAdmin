package bean;

public class Borrowed_book {
	private String ISBN;
	private String Scard_no;
	private String borrowed_book_time;
	private String borrowed_book_num;
	private String get_book_number;
	
	
	
	public String getGet_book_number() {
		return get_book_number;
	}
	public void setGet_book_number(String get_book_number) {
		this.get_book_number = get_book_number;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getScard_no() {
		return Scard_no;
	}
	public void setScard_no(String sCARD_NO) {
		Scard_no = sCARD_NO;
	}
	public String getBorrowed_book_time() {
		return borrowed_book_time;
	}
	public void setBorrowed_book_time(String borrowed_book_time) {
		this.borrowed_book_time = borrowed_book_time;
	}
	public String getBorrowed_book_num() {
		return borrowed_book_num;
	}
	public void setBorrowed_book_num(String borrowed_book_num) {
		this.borrowed_book_num = borrowed_book_num;
	}
	
}
