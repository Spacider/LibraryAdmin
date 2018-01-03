package bean;

public class Return_book {
	private String return_book_time;
	private String return_book_num;
	private String get_book_number;
	private String ISBN;
	private String Scard_no;
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getScard_no() {
		return Scard_no;
	}
	public void setScard_no(String scard_no) {
		Scard_no = scard_no;
	}
	public String getGet_book_number() {
		return get_book_number;
	}
	public void setGet_book_number(String get_book_number) {
		this.get_book_number = get_book_number;
	}
	public String getReturn_book_time() {
		return return_book_time;
	}
	public void setReturn_book_time(String return_book_time) {
		this.return_book_time = return_book_time;
	}
	public String getReturn_book_num() {
		return return_book_num;
	}
	public void setReturn_book_num(String return_book_num) {
		this.return_book_num = return_book_num;
	}
	
}
