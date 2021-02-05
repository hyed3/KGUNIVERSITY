package com.kgu.www.vo;

import java.util.Date;

public class CommVO {

private int bno;
private String cid;
private int cno;
private String ctext;
private Date cdate;

public int getBno() {
	return bno;
}
public void setBno(int bno) {
	this.bno = bno;
}
public String getCid() {
	return cid;
}
public void setCid(String cid) {
	this.cid = cid;
}
public int getCno() {
	return cno;
}
public void setCno(int cno) {
	this.cno = cno;
}
public String getCtext() {
	return ctext;
}
public void setCtext(String ctext) {
	this.ctext = ctext;
}
public Date getCdate() {
	return cdate;
}
public void setCdate(Date cdate) {
	this.cdate = cdate;
}

public String toString() {
	return ctext+"     "+cid;
}


}
