package com.kgu.www.Book.vo;

public class BookVO {
	private int book_num;
	private String book_picture;
	private String book_name;
	private String book_writer;
	private int book_price;
	private String book_info;
	private String book_mokcha;
	private int book_inventory;
	
	public BookVO() {
		
	}
	public BookVO(int book_num, String book_picture, String book_name, String book_writer, int book_price, String book_info,
			String book_mokcha, int book_inventory) {
		super();
		this.book_num = book_num;
		this.book_picture = book_picture;
		this.book_name = book_name;
		this.book_writer = book_writer;
		this.book_price = book_price;
		this.book_info = book_info;
		this.book_mokcha = book_mokcha;
		this.book_inventory = book_inventory;
	}
	
	public BookVO(int book_num, int book_inventory) {
			this.book_num = book_num;
			this.book_inventory = book_inventory;
	}
	
	public void InsertVO(String book_picture, String book_name, String book_writer, int book_price, String book_info,
			String book_mokcha, int book_inventory) {
		this.book_picture = book_picture;
		this.book_name = book_name;
		this.book_writer = book_writer;
		this.book_price = book_price;
		this.book_info = book_info;
		this.book_mokcha = book_mokcha;
		this.book_inventory = book_inventory;
	}
	
	public void UpdateVO(int book_num, String book_picture, String book_name, String book_writer, int book_price, String book_info,
			String book_mokcha, int book_inventory) {
		this.book_num = book_num;
		this.book_picture = book_picture;
		this.book_name = book_name;
		this.book_writer = book_writer;
		this.book_price = book_price;
		this.book_info = book_info;
		this.book_mokcha = book_mokcha;
		this.book_inventory = book_inventory;
	}
	
	public int getBook_num() {
		return book_num;
	}
	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}
	public String getBook_picture() {
		return book_picture;
	}
	public void setBook_picture(String book_picture) {
		this.book_picture = book_picture;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public String getBook_info() {
		return book_info;
	}
	public void setBook_info(String book_info) {
		this.book_info = book_info;
	}
	public String getBook_mokcha() {
		return book_mokcha;
	}
	public void setBook_mokcha(String book_mokcha) {
		this.book_mokcha = book_mokcha;
	}
	public int getBook_inventory() {
		return book_inventory;
	}
	public void setBook_inventory(int book_inventory) {
		this.book_inventory = book_inventory;
	}
	
	public String toString() {
		return book_name;
	}
}
