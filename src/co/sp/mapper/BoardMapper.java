package co.sp.mapper;

import java.util.List;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.session.RowBounds;
import co.sp.beans.*;

public interface BoardMapper {
	@SelectKey(statement = "SELECT offer_seq.nextval FROM dual", keyProperty = "o_no", before = true, resultType = int.class)
	@Insert("INSERT INTO offer_table VALUES(#{o_no}, #{o_writer}, #{o_sub}, #{o_text}, #{o_regdate}, #{o_readcnt}, #{o_replycnt})")
	void addOfferBoard(Offer offerBean);

	@SelectKey(statement = "SELECT community_seq.nextval FROM dual", keyProperty = "c_no", before = true, resultType = int.class)
	@Insert("INSERT INTO community_table VALUES(#{c_no}, #{c_writer}, #{c_sub}, #{c_text}, #{c_regdate}, #{c_readcnt}, #{c_replycnt})")
	void addCommunityBoard(Community communityBean);

	@Select("SELECT * FROM offer_table order by o_no desc")
	List<Offer> offerBoardList(RowBounds rowBounds);

	@Select("SELECT * FROM community_table order by c_no desc")
	List<Community> communityBoardList(RowBounds rowBounds);

	@Select("SELECT u_id, u_no FROM user_table")
	List<UserId> getWriterId();

	@Select("select count(*) from offer_table")
	int getOfferBoardCnt();

	@Select("select count(*) from community_table")
	int getCommunityBoardCnt();

	@Select("select * from offer_table where o_no = #{o_no}")
	Offer getOfferContents(int o_no);

	@Update("update offer_table set o_sub = #{o_sub}, o_text=#{o_text} where o_no = #{o_no}")
	void updateOfferContents(EditOfferBean editOfferBean);

	@Select("select * from community_table where c_no = #{c_no}")
	Community getCommunityContents(int c_no);

	@Update("update Community_table set c_sub = #{c_sub}, c_text=#{c_text} where c_no = #{c_no}")
	void updateCommunityContents(EditCommunityBean editCommunityBean);

	@Delete("DELETE FROM offer_table WHERE o_writer = #{u_no}")
	void removeAlloffer(int u_no);

	@Delete("DELETE FROM community_table WHERE c_writer = #{u_no}")
	void removeAllcommunity(int u_no);

	@Delete("DELETE FROM offer_table WHERE o_no = #{o_no}")
	void deleteOfferContent(int o_no);

	@Delete("DELETE FROM community_table WHERE c_no = #{c_no}")
	void deleteCommunityContent(int c_no);

	@Update("update offer_table set o_readcnt=o_readcnt+1 where o_no=#{o_no}")
	void addOfferreadCnt(int o_no);

	@Update("update community_table set c_readcnt=c_readcnt+1 where c_no=#{c_no}")
	void addCommunityreadCnt(int c_no);

	@Select("select u_id from user_table where u_no=#{o_writer}")
	String getofferContentId(int o_writer);

	@Select("select u_id from user_table where u_no=#{c_writer}")
	String getcommunityContentId(int c_writer);

	@Select("SELECT o_sub FROM (select o_sub from offer_table order by o_no desc) WHERE rownum <= 6")
	List<String> mainOffersub();

	@Select("SELECT o_no FROM (select o_no from offer_table order by o_no desc) WHERE rownum <= 6")
	List<Integer> mainOfferno();

	@Select("SELECT c_sub FROM (select c_sub from community_table order by c_no desc) WHERE rownum <= 6")
	List<String> mainCommunitysub();

	@Select("SELECT c_no FROM (select c_no from community_table order by c_no desc) WHERE rownum <= 6")
	List<Integer> mainCommunityno();

	@SelectKey(statement = "SELECT offer_reply_seq.nextval FROM dual", keyProperty = "or_no", before = true, resultType = int.class)
	@Insert("insert into offer_reply values(#{or_no}, #{or_writer}, #{o_no_re}, #{or_text})")
	void addOfferReply(offer_reply offerreplyBean);

	@SelectKey(statement = "SELECT community_reply_seq.nextval FROM dual", keyProperty = "cr_no", before = true, resultType = int.class)
	@Insert("insert into community_reply values(#{cr_no}, #{cr_writer}, #{c_no_re}, #{cr_text})")
	void addCommunityReply(community_reply communityreplyBean);

	@Select("select * from offer_reply where o_no_re =#{o_no_re} order by or_no desc")
	List<offer_reply> getOfferReply(int o_no_re);

	@Select("select * from community_reply where c_no_re =#{c_no_re} order by cr_no desc")
	List<community_reply> getCommunityReply(int c_no_re);
	
	@Update("update offer_table set o_replycnt=o_replycnt+1 where o_no=#{o_no}")
	void addOfferreplyCnt(int o_no);

	@Update("update community_table set c_replycnt=c_replycnt+1 where c_no=#{c_no}")
	void addCommunityreplyCnt(int c_no);
	
	@Delete("DELETE FROM offer_reply WHERE o_no_re in (SELECT o_no FROM offer_table WHERE o_writer = #{u_no})")
	void removeAlloreply(int u_no);

	@Delete("DELETE FROM community_reply WHERE c_no_re in (SELECT c_no FROM community_table WHERE c_writer = #{u_no})")
	void removeAllcreply(int u_no);
	
	@Delete("DELETE FROM offer_reply WHERE o_no_re in #{o_no}")
	void removeOreply(int o_no);
	
	@Delete("DELETE FROM community_reply WHERE c_no_re in #{c_no}")
	void removeCreply(int c_no);
}