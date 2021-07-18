package co.sp.beans;

public class Goods {

	private int g_no;
	private int g_writer;
	private String g_sub;
	private String g_img;
	private String g_stime;
	private String g_text;
	private String g_regdate;
	private int g_price;

	public Goods() {
		this.g_price = 10000;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public int getG_writer() {
		return g_writer;
	}

	public void setG_writer(int g_writer) {
		this.g_writer = g_writer;
	}

	public String getG_sub() {
		return g_sub;
	}

	public void setG_sub(String g_sub) {
		this.g_sub = g_sub;
	}

	public String getG_text() {
		return g_text;
	}

	public void setG_text(String g_text) {
		this.g_text = g_text;
	}

	public String getG_img() {
		return g_img;
	}

	public void setG_img(String g_img) {
		this.g_img = g_img;
	}

	public String getG_stime() {
		return g_stime;
	}

	public void setG_stime(String g_stime) {
		this.g_stime = g_stime;
	}

	public String getG_regdate() {
		return g_regdate;
	}

	public void setG_regdate(String g_regdate) {
		this.g_regdate = g_regdate;
	}

	public int getG_price() {
		return g_price;
	}

	public void setG_price(int g_price) {
		this.g_price = g_price;
	}
}