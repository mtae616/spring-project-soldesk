package co.sp.service;

import java.util.List;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.sp.beans.*;
import co.sp.dao.BoardDao;

@Service
public class BoardService {

	@Autowired
	private BoardDao boardDao;
	int page_listcount = 10;

	public void addOfferBoard(Offer offerBean) {
		boardDao.addOfferBoard(offerBean);
	}

	public void addCommunityBoard(Community communityBean) {
		boardDao.addCommunityBoard(communityBean);
	}

	public List<Offer> offerBoardList(int page) {
		int start = (page - 1) * page_listcount;
		RowBounds rowBounds = new RowBounds(start, page_listcount);

		return boardDao.offerBoardList(rowBounds);
	}

	public List<Community> communityBoardList(int page) {
		int start = (page - 1) * page_listcount;
		RowBounds rowBounds = new RowBounds(start, page_listcount);
		return boardDao.communityBoardList(rowBounds);
	}

	public List<UserId> getWriterId() {
		return boardDao.getWriterId();
	}

	public void removeAlloffer(int u_no) {
		boardDao.removeAlloffer(u_no);
	}

	public void removeAllcommunity(int u_no) {
		boardDao.removeAllcommunity(u_no);
	}

	public BoardPage getOfferBoardCnt(int currentPage) {
		int content_cnt = boardDao.getOfferBoardCnt();
		BoardPage pageBean = new BoardPage(content_cnt, currentPage, 10, 10);
		return pageBean;
	}

	public BoardPage getCommunityBoardCnt(int currentPage) {
		int content_cnt = boardDao.getCommunityBoardCnt();
		BoardPage pageBean = new BoardPage(content_cnt, currentPage, 10, 10);
		return pageBean;
	}

	public Offer getOfferContents(int o_no) {
		return boardDao.getOfferContents(o_no);
	}

	public void updateOfferContents(EditOfferBean editOfferBean) {
		boardDao.updateOfferContents(editOfferBean);
	}

	public Community getCommunityContents(int c_no) {
		return boardDao.getCommunityContents(c_no);
	}

	public void updateCommunityContents(EditCommunityBean editCommunityBean) {
		boardDao.updateCommunityContents(editCommunityBean);
	}

	public void deleteOfferContent(int o_no) {
		boardDao.deleteOfferContent(o_no);
	}

	public void deleteCommunityContent(int c_no) {
		boardDao.deleteCommunityContent(c_no);
	}

	public void addOfferreadCnt(int o_no) {
		boardDao.addOfferreadCnt(o_no);
	}

	public void addCommunityreadCnt(int c_no) {
		boardDao.addCommunityreadCnt(c_no);
	}

	public String getofferContentId(int o_writer) {
		return boardDao.getofferContentId(o_writer);
	}

	public String getcommunityContentId(int c_writer) {
		return boardDao.getcommunityContentId(c_writer);
	}

	public List<String> mainOffersub() {
		return boardDao.mainOffersub();
	}

	public List<Integer> mainOfferno() {
		return boardDao.mainOfferno();
	}

	public List<String> mainCommunitysub() {
		return boardDao.mainCommunitysub();
	}

	public List<Integer> mainCommunityno() {
		return boardDao.mainCommunityno();
	}

	public void addOfferReply(offer_reply offerreplyBean) {
		boardDao.addOfferReply(offerreplyBean);
	}

	public void addCommunityReply(community_reply communityreplyBean) {
		boardDao.addCommunityReply(communityreplyBean);
	}

	public List<offer_reply> getOfferReply(int o_no_re) {
		return boardDao.getOfferReply(o_no_re);
	}

	public List<community_reply> getCommunityReply(int c_no_re) {
		return boardDao.getCommunityReply(c_no_re);
	}

	public void addOfferreplyCnt(int o_no) {
		boardDao.addOfferreplyCnt(o_no);
	}

	public void addCommunityreplyCnt(int c_no) {
		boardDao.addCommunityreplyCnt(c_no);
	}
	
	public void removeAlloreply(int u_no) {
		boardDao.removeAlloreply(u_no);
	}
	
	public void removeAllcreply(int u_no) {
		boardDao.removeAllcreply(u_no);
	}
	
	public void removeOreply(int o_no) {
		boardDao.removeOreply(o_no);
	}
	
	public void removeCreply(int c_no) {
		boardDao.removeCreply(c_no);
	}
}