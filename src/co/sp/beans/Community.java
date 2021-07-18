package co.sp.beans;

import java.util.Date;

public class Community {

	private int c_no;
	private int c_writer;
	private String c_sub;
	private String c_text;
	private String c_regdate;
	private int c_readcnt;
	private int c_replycnt;

	@SuppressWarnings("deprecation")
	public Community() {
		
		Date today = new Date();
		String year = today.getYear() + 1900 + "-";
		String month = today.getMonth() + 1 + "-";
		String date = today.getDate() + " ";
		String hours = today.getHours() + ":";
		String min = today.getMinutes() + ":";
		String sec = today.getSeconds() + "";

		if (today.getMonth() + 1 < 10) {
			month = "0" + month;
		}
		if (today.getDate() < 10) {
			date = "0" + date;
		}
		if (today.getHours() < 10) {
			hours = "0" + hours;
		}
		if (today.getMinutes() < 10) {
			min = "0" + min;
		}
		if (today.getSeconds() < 10) {
			sec = "0" + sec;
		}
		this.c_regdate = year + month + date + hours + min + sec;
		this.c_readcnt = 1;
		this.c_replycnt = 0;
	}

	public int getC_replycnt() {
		return c_replycnt;
	}

	public void setC_replycnt(int c_replycnt) {
		this.c_replycnt = c_replycnt;
	}

	public String getC_regdate() {
		return c_regdate;
	}

	public void setC_regdate(String c_regdate) {
		this.c_regdate = c_regdate;
	}

	public int getC_readcnt() {
		return c_readcnt;
	}

	public void setC_readcnt(int c_readcnt) {
		this.c_readcnt = c_readcnt;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getC_writer() {
		return c_writer;
	}

	public void setC_writer(int c_writer) {
		this.c_writer = c_writer;
	}

	public String getC_sub() {
		return c_sub;
	}

	public void setC_sub(String c_sub) {
		this.c_sub = c_sub;
	}

	public String getC_text() {
		return c_text;
	}

	public void setC_text(String c_text) {
		this.c_text = c_text;
	}
}