package co.sp.beans;

public class Trade {

   private int t_no; // �ŷ���ȣ
   private int t_subno; // �۹�ȣ - goods_table���ܿ���
   private String t_buyer; // ������
   private int t_pay;

   public int getT_no() {
      return t_no;
   }

   public void setT_no(int t_no) {
      this.t_no = t_no;
   }

   public int getT_subno() {
      return t_subno;
   }

   public void setT_subno(int t_subno) {
      this.t_subno = t_subno;
   }

   public String getT_buyer() {
      return t_buyer;
   }

   public void setT_buyer(String t_buyer) {
      this.t_buyer = t_buyer;
   }

   public int getT_pay() {
      return t_pay;
   }

   public void setT_pay(int t_pay) {
      this.t_pay = t_pay;
   }
}