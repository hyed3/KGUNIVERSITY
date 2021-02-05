package com.kgu.www.Book.vo;

import java.sql.Date;

public class PurchaseVO {
	private int purchase_num;
	private String user_id;
	private String book_picture;
	private String book_name;
	private int book_amount;
	private Date purchase_date;
	
	public PurchaseVO() {}
	
	public PurchaseVO(int purchase_num, String user_id, String book_picture, String book_name, int book_amount, Date purchase_date) {
		super();
		this.purchase_num = purchase_num;
		this.user_id = user_id;
		this.book_picture = book_picture;
		this.book_name = book_name;
		this.book_amount = book_amount;
		this.purchase_date = purchase_date;
	}
	
	public PurchaseVO(String user_id, String book_picture, String book_name, int book_amount) {
		this.user_id = user_id;
		this.book_picture = book_picture;
		this.book_name = book_name;
		this.book_amount = book_amount;
	}

	public int getPurchase_num() {
		return purchase_num;
	}
	public void setPurchase_num(int purchase_num) {
		this.purchase_num = purchase_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getBook_amount() {
		return book_amount;
	}
	public void setBook_amount(int book_amount) {
		this.book_amount = book_amount;
	}
	public Date getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}
	
	
}
