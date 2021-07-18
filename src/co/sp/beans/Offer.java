package co.sp.beans;

import java.util.Date;

public class Offer {

	private int o_no;
	private int o_writer;
	private String o_sub;
	private String o_text;
	private String o_regdate;
	private int o_readcnt;
	private int o_replycnt;

	@SuppressWarnings("deprecation")
	public Offer() {

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
		this.o_regdate = year + month + date + hours + min + sec;
		this.o_readcnt = 1;
		this.o_replycnt = 0;
	}

	public String getO_regdate() {
		return o_regdate;
	}

	public void setO_regdate(String o_regdate) {
		this.o_regdate = o_regdate;
	}

	public int getO_readcnt() {
		return o_readcnt;
	}

	public void setO_readcnt(int o_readcnt) {
		this.o_readcnt = o_readcnt;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public int getO_writer() {
		return o_writer;
	}

	public void setO_writer(int o_writer) {
		this.o_writer = o_writer;
	}

	public String getO_sub() {
		return o_sub;
	}

	public void setO_sub(String o_sub) {
		this.o_sub = o_sub;
	}

	public String getO_text() {
		return o_text;
	}

	public void setO_text(String o_text) {
		this.o_text = o_text;
	}

	public int getO_replycnt() {
		return o_replycnt;
	}

	public void setO_replycnt(int o_replycnt) {
		this.o_replycnt = o_replycnt;
	}
}