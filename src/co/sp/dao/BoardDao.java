package co.sp.dao;

import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import co.sp.beans.*;
import co.sp.mapper.BoardMapper;

@Repository
public class BoardDao {

	@Autowired
	private BoardMapper boardMapper;

	public void addOfferBoard(Offer offerBean) {
		boardMapper.addOfferBoard(offerBean);
	}

	public void addCommunityBoard(Community communityBean) {
		boardMapper.addCommunityBoard(communityBean);
	}

	public List<Offer> offerBoardList(RowBounds rowBounds) {
		return boardMapper.offerBoardList(rowBounds);
	}

	public List<Community> communityBoardList(RowBounds rowBounds) {
		return boardMapper.communityBoardList(rowBounds);
	}

	public List<UserId> getWriterId() {
		return boardMapper.getWriterId();
	}

	public void removeAlloffer(int u_no) {
		boardMapper.removeAlloffer(u_no);
	}

	public void removeAllcommunity(int u_no) {
		boardMapper.removeAllcommunity(u_no);
	}

	public int getOfferBoardCnt() {
		return boardMapper.getOfferBoardCnt();
	}

	public int getCommunityBoardCnt() {
		return boardMapper.getCommunityBoardCnt();
	}

	public Offer getOfferContents(int o_no) {
		return boardMapper.getOfferContents(o_no);
	}

	public void updateOfferContents(EditOfferBean editOfferBean) {
		boardMapper.updateOfferContents(editOfferBean);
	}

	public Community getCommunityContents(int c_no) {
		return boardMapper.getCommunityContents(c_no);
	}

	public void updateCommunityContents(EditCommunityBean editCommunityBean) {
		boardMapper.updateCommunityContents(editCommunityBean);
	}

	public void deleteOfferContent(int o_no) {
		boardMapper.deleteOfferContent(o_no);
	}

	public void deleteCommunityContent(int c_no) {
		boardMapper.deleteCommunityContent(c_no);
	}

	public void addOfferreadCnt(int o_no) {
		boardMapper.addOfferreadCnt(o_no);
	}

	public void addCommunityreadCnt(int c_no) {
		boardMapper.addCommunityreadCnt(c_no);
	}

	public String getofferContentId(int o_writer) {
		return boardMapper.getofferContentId(o_writer);
	}

	public String getcommunityContentId(int c_writer) {
		return boardMapper.getcommunityContentId(c_writer);
	}

	public List<String> mainOffersub() {
		return boardMapper.mainOffersub();
	}

	public List<Integer> mainOfferno() {
		return boardMapper.mainOfferno();
	}

	public List<String> mainCommunitysub() {
		return boardMapper.mainCommunitysub();
	}

	public List<Integer> mainCommunityno() {
		return boardMapper.mainCommunityno();
	}

	public void addOfferReply(offer_reply offerreplyBean) {
		boardMapper.addOfferReply(offerreplyBean);
	}

	public void addCommunityReply(community_reply communityreplyBean) {
		boardMapper.addCommunityReply(communityreplyBean);
	}

	public List<offer_reply> getOfferReply(int o_no_re) {
		return boardMapper.getOfferReply(o_no_re);
	}

	public List<community_reply> getCommunityReply(int c_no_re) {
		return boardMapper.getCommunityReply(c_no_re);
	}

	public void addOfferreplyCnt(int o_no) {
		boardMapper.addOfferreplyCnt(o_no);
	}

	public void addCommunityreplyCnt(int c_no) {
		boardMapper.addCommunityreplyCnt(c_no);
	}
	
	public void removeAlloreply(int u_no) {
		boardMapper.removeAlloreply(u_no);
	}
	
	public void removeAllcreply(int u_no) {
		boardMapper.removeAllcreply(u_no);
	}
	
	public void removeOreply(int o_no) {
		boardMapper.removeOreply(o_no);
	}
	
	public void removeCreply(int c_no) {
		boardMapper.removeCreply(c_no);
	}
}