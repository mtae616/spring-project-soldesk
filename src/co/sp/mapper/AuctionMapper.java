package co.sp.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import co.sp.beans.*;

public interface AuctionMapper {

	@SelectKey(statement = "select goods_seq.nextval from dual", keyProperty = "g_no", before = true, resultType = int.class)
	@Insert("insert into goods_table (g_no, g_writer, g_sub, g_img, g_stime, g_text, g_regdate, g_price) values(#{g_no}, #{g_writer}, #{g_sub}, #{g_img}, #{g_stime}, #{g_text}, sysdate, #{g_price})")
	void addAuctionContent(Goods auctionContentBean);

	@Select("SELECT g_no, g_sub, g_img, g_stime FROM goods_table ORDER BY g_stime DESC")
	List<Goods> getGoodsBean();

	@Select("SELECT g_no, g_writer, g_sub, g_img, g_stime, g_text, g_price FROM goods_table WHERE g_no = #{g_no}")
	Goods getGoodsBean2(int g_no);

	@Update("UPDATE goods_table SET g_price = #{g_price}, g_buyer = #{g_buyer} WHERE g_no = #{g_no}")
	void updateGoodsPnB(@Param("g_price") int g_price, @Param("g_no") int g_no, @Param("g_buyer") String g_buyer);

	@Select("SELECT g_price FROM goods_table WHERE g_no = #{g_no}")
	String getGoodsPrice(int g_no);

	@Select("SELECT g_buyer FROM goods_table WHERE g_no = #{g_no}")
	String getGoodsBuyer(int g_no);

	@SelectKey(statement = "SELECT tradelist_seq.nextval FROM dual", keyProperty = "t_no", before = true, resultType = int.class)
	@Insert("INSERT INTO tradelist_table VALUES(#{t_no}, #{t_subno}, #{t_buyer}, #{t_pay})")
	void addTradeList(Trade trade);

	@Select("SELECT g_time FROM goods_table WHERE g_no = #{g_no}")
	String getGoodsTime(int g_no);

	@Insert("INSERT INTO auction_reply VALUES(#{r_text}, #{r_writer}, #{r_no})")
	void addAuctionReply(Auction_reply reply);

	@Select("SELECT * FROM auction_reply WHERE r_no = #{g_no}")
	List<Auction_reply> getAuctionReply(int g_no);

	@Select("SELECT u_id FROM user_table WHERE u_no = #{g_writer}")
	String getGoodsSeller(int g_writer);

	@Select("SELECT * FROM tradelist_table WHERE t_buyer = #{u_id} AND t_pay = 0")
	List<Trade> getTradeList(String u_id);

	@Select("SELECT * FROM goods_table WHERE g_no = #{t_subno}")
	Goods NoPaygoods(int t_subno);

	@Update("update tradelist_table set t_pay=1 where t_subno = #{g_no}")
	void paidContent(int g_no);
	
	@Delete("DELETE FROM goods_table WHERE g_writer = #{u_no}")
	void removeAllGoods(int u_no);
	
	@Delete("DELETE FROM auction_reply WHERE r_writer = #{u_id}")
	void removeAuctionReply(String u_id);
}