package com.kgu.www.vo;

import java.util.Date;

public class SangpumVO {
	
	private int bno;
	private String title;
	private String content;
	private String id;
	private String sb;
	private int viewcnt;
	private Date wrdate;
	private String IMGNAME;
	private String x;
	private String y;
	
	public String toString(){
		return x+" "+y;
	}
	
	public String getIMGNAME() {
		return IMGNAME;
	}
	public String getX() {
		return x;
	}
	public void setX(String x) {
		this.x = x;
	}
	public String getY() {
		return y;
	}
	public void setY(String y) {
		this.y = y;
	}
	public void setIMGNAME(String iMGNAME) {
		IMGNAME = iMGNAME;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSb() {
		return sb;
	}
	public void setSb(String sb) {
		this.sb = sb;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public Date getWrdate() {
		return wrdate;
	}
	public void setWrdate(Date wrdate) {
		this.wrdate = wrdate;
	}

}
