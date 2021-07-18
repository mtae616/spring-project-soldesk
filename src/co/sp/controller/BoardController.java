package co.sp.controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import co.sp.beans.*;
import co.sp.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("/boardform1")
	public String boardform1(@RequestParam(value = "page", defaultValue = "1") int page, Model m) {
		List<Offer> offerbean = boardService.offerBoardList(page);
		List<UserId> useridlist = boardService.getWriterId();
		BoardPage pageBean = boardService.getOfferBoardCnt(page);
		m.addAttribute("pageBean", pageBean);
		m.addAttribute("page", page);

		List<String> idlist = new ArrayList<String>();
		for (int i = 0; i < offerbean.size(); i++) {
			for (int j = 0; j < useridlist.size(); j++) {
				if (offerbean.get(i).getO_writer() == useridlist.get(j).getU_no()) {
					idlist.add(useridlist.get(j).getU_id());
				}
			}
		}
		m.addAttribute("boardbean", offerbean);
		m.addAttribute("name", "offer");
		m.addAttribute("idlist", idlist);

		return "boardform";
	}

	@RequestMapping("/contents_info1")
	public String contents_info_offer(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "command") String offer, @RequestParam(value = "contents") int contents,
			@ModelAttribute("offerreplyBean") offer_reply offerreplyBean, Model m) {

		Offer offerContentsBean = boardService.getOfferContents(contents);
		BoardPage pageBean = boardService.getOfferBoardCnt(page);
		String u_id = boardService.getofferContentId(offerContentsBean.getO_writer());
		List<offer_reply> offerli = boardService.getOfferReply(contents);
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		m.addAttribute("command", offer);
		m.addAttribute("pageBean", pageBean);
		m.addAttribute("offerContentsBean", offerContentsBean);
		m.addAttribute("u_id", u_id);
		m.addAttribute("offerli", offerli);
		boardService.addOfferreadCnt(contents);
		return ("/contents_info1");
	}

	@RequestMapping("/contents_info1_edit")
	public String contents_info_offer_edit(Model m, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "command") String offer, @RequestParam(value = "contents") int contents,
			@ModelAttribute("editOfferBean") EditOfferBean editOfferBean) {

		Offer offerContentsBean = boardService.getOfferContents(contents);
		BoardPage pageBean = boardService.getOfferBoardCnt(page);
		String u_id = boardService.getofferContentId(offerContentsBean.getO_writer());
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		m.addAttribute("command", offer);
		m.addAttribute("pageBean", pageBean);
		m.addAttribute("offerContentsBean", offerContentsBean);
		m.addAttribute("u_id", u_id);
		return ("/contents_info1_edit");
	}

	@RequestMapping("/contents_info1_edit_proc")
	public String contents_info_offer_edit_proc(Model m, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "contents") int contents,
			@ModelAttribute("editOfferBean") EditOfferBean editOfferBean) {
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		boardService.updateOfferContents(editOfferBean);
		return ("/contents_info1_edit_proc");
	}

	@RequestMapping("/contents_info1_delete")
	public String contents_info_offer_delete(Model m, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "contents") int contents) {
		
		boardService.removeOreply(contents);
		boardService.deleteOfferContent(contents);
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		return ("/contents_info1_delete");
	}

	@RequestMapping("/boardform2")
	public String boardform2(@RequestParam(value = "page", defaultValue = "1") int page, Model m) {

		List<Community> communitybean = boardService.communityBoardList(page);
		List<UserId> useridlist = boardService.getWriterId();
		BoardPage pageBean = boardService.getCommunityBoardCnt(page);
		m.addAttribute("pageBean", pageBean);
		m.addAttribute("page", page);
		List<String> idlist = new ArrayList<String>();
		for (int i = 0; i < communitybean.size(); i++) {
			for (int j = 0; j < useridlist.size(); j++) {
				if (communitybean.get(i).getC_writer() == useridlist.get(j).getU_no()) {
					idlist.add(useridlist.get(j).getU_id());
				}
			}
		}
		m.addAttribute("boardbean", communitybean);
		m.addAttribute("name", "community");
		m.addAttribute("idlist", idlist);
		return "boardform";
	}

	@RequestMapping("/contents_info2")
	public String contents_info_community(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "command") String community, @RequestParam(value = "contents") int contents,
			@ModelAttribute("communityreplyBean") community_reply communityreplyBean, Model m) {

		Community communityContentsBean = boardService.getCommunityContents(contents);
		BoardPage pageBean = boardService.getCommunityBoardCnt(page);
		String u_id = boardService.getcommunityContentId(communityContentsBean.getC_writer());
		List<community_reply> communityli = boardService.getCommunityReply(contents);
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		m.addAttribute("command", community);
		m.addAttribute("pageBean", pageBean);
		m.addAttribute("communityContentsBean", communityContentsBean);
		m.addAttribute("u_id", u_id);
		m.addAttribute("communityli", communityli);
		boardService.addCommunityreadCnt(contents);
		return ("/contents_info2");
	}

	@RequestMapping("/contents_info2_edit")
	public String contents_info_community_edit(Model m, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "command") String community, @RequestParam(value = "contents") int contents,
			@ModelAttribute("editCommunityBean") EditCommunityBean editCommunityBean) {

		Community communityContentsBean = boardService.getCommunityContents(contents);
		BoardPage pageBean = boardService.getCommunityBoardCnt(page);
		String u_id = boardService.getcommunityContentId(communityContentsBean.getC_writer());
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		m.addAttribute("command", community);
		m.addAttribute("pageBean", pageBean);
		m.addAttribute("communityContentsBean", communityContentsBean);
		m.addAttribute("u_id", u_id);
		return ("/contents_info2_edit");
	}

	@RequestMapping("/contents_info2_edit_proc")
	public String contents_info_community_edit_proc(Model m, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "contents") int contents,
			@ModelAttribute("editCommunityBean") EditCommunityBean editCommunityBean) {

		m.addAttribute("page", page);
		boardService.updateCommunityContents(editCommunityBean);
		return ("/contents_info2_edit_proc");
	}

	@RequestMapping("/contents_info2_delete")
	public String contents_info_community_delete(Model m, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "contents") int contents) {

		boardService.removeCreply(contents);
		boardService.deleteCommunityContent(contents);
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		return ("/contents_info2_delete");
	}

	@RequestMapping("/board_registry1")
	public String boardadd(@ModelAttribute("offerbean") Offer offerbean, HttpServletRequest request) {
		request.setAttribute("name", "offer");
		return "board_registry";
	}

	@RequestMapping("/board_registry_proc1")
	public String registryproc(@ModelAttribute("offerbean") Offer offerbean, HttpServletRequest request) {
		boardService.addOfferBoard(offerbean);
		request.setAttribute("num", 1);
		return "board_registry_proc";
	}

	@RequestMapping("/board_registry2")
	public String boardadd(@ModelAttribute("communitybean") Community communitybean, HttpServletRequest request) {
		request.setAttribute("name", "community");
		return "board_registry";
	}

	@RequestMapping("/board_registry_proc2")
	public String registryproc(@ModelAttribute("communitybean") Community communitybean, HttpServletRequest request) {
		boardService.addCommunityBoard(communitybean);
		request.setAttribute("num", 2);
		return "board_registry_proc";
	}

	@RequestMapping("offer_reply_proc")
	public String offer_reply_proc(@ModelAttribute("offerreplyBean") offer_reply offerreplyBean,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "command", defaultValue = "offer") String offer,
			@RequestParam(value = "contents") int contents, Model m) {

		boardService.addOfferReply(offerreplyBean);
		boardService.addOfferreplyCnt(contents);
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		m.addAttribute("command", offer);

		return "/offer_reply_proc";
	}

	@RequestMapping("community_reply_proc")
	public String community_reply_proc(@ModelAttribute("communityreplyBean") community_reply communityreplyBean,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "command", defaultValue = "community") String community,
			@RequestParam(value = "contents") int contents, Model m) {

		boardService.addCommunityReply(communityreplyBean);
		boardService.addCommunityreplyCnt(contents);
		m.addAttribute("page", page);
		m.addAttribute("contents", contents);
		m.addAttribute("command", community);
		return "/community_reply_proc";
	}
}