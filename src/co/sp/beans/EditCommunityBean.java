package co.sp.beans;

import java.util.Date;

public class EditCommunityBean {
	private int c_no;
	private int c_writer;
	private String c_sub;
	private String c_text;
	private String c_regdate;
	private int c_readcnt;

	@SuppressWarnings("deprecation")
	public EditCommunityBean() {
		Date today = new Date();
		this.c_regdate = today.getYear() + 1900 + "년 " + (today.getMonth() + 1) + "월" + today.getDate() + "일";

		this.c_readcnt = 1;
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
