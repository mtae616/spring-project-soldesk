package co.sp.beans;

import java.util.Date;

public class EditOfferBean {

	private int o_no;
	private int o_writer;
	private String o_sub;
	private String o_text;
	private String o_regdate;
	private int o_readcnt;

	@SuppressWarnings("deprecation")
	public EditOfferBean() {
		Date today = new Date();
		this.o_regdate = today.getYear() + 1900 + "년" + (today.getMonth() + 1) + "월" + today.getDate() + "일";

		this.o_readcnt = 1;
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
}
