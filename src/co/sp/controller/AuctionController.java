package co.sp.controller;

import java.util.*;
import javax.servlet.http.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import co.sp.beans.*;
import co.sp.service.AuctionService;

@Controller
public class AuctionController {

	@Autowired
	AuctionService auctionService;

	@RequestMapping("/auction")
	public String auction(Model m) {
		List<Goods> auctionlist = auctionService.getGoodsBean();
		m.addAttribute("goodslist", auctionlist);
		return "auction";
	}

	@RequestMapping("/auction_contents/{g_no}")
	public String auction_contents(@PathVariable(name = "g_no") int g_no, Model m) {
		
		Goods goodsbean = auctionService.getGoodsBean2(g_no);
		List<Auction_reply> reply = auctionService.getAuctionReply(g_no);

		String text = Integer.toString(goodsbean.getG_price());
		StringBuffer textbuffer = new StringBuffer(text);
		String[] reverse = textbuffer.reverse().toString().split("");

		String text2 = "";
		for (int i = 0; i < reverse.length; i++) {
			if (i % 3 == 0 && i != 0) {
				text2 = text2 + ",";
			}
			text2 = text2 + reverse[i];
		}
		StringBuffer text2buffer = new StringBuffer(text2);
		String text3 = text2buffer.reverse().toString();
		m.addAttribute("goodsbean", goodsbean);
		m.addAttribute("g_price", text3);
		m.addAttribute("reply", reply);
		m.addAttribute("g_writer", auctionService.getGoodsSeller(goodsbean.getG_writer()));
		m.addAttribute("u_id", auctionService.getGoodsBuyer(g_no));
		return "auction_contents";
	}

	@RequestMapping("/auction_contents_registry")
	public String auction_contents_registry(@ModelAttribute("auctionContentBean") Goods auctionContentBean,
			@RequestParam(value = "imglink") String imglink, Model m) {
		
		String link = "";
		if (imglink != "") {
			link = imglink.replaceAll(" ", "+");
		}
		m.addAttribute("img", link);
		return "auction_contents_registry";
	}

	@RequestMapping("/auction_contents_registry_proc")
	public String auction_contents_registry_proc(@ModelAttribute("auctionContentBean") Goods auctionContentBean,
			Model m) {
		
		String stime = auctionContentBean.getG_stime().toString();
		auctionContentBean.setG_stime(stime);
		auctionService.addAuctionContent(auctionContentBean);
		List<Goods> auctionlist = auctionService.getGoodsBean();
		m.addAttribute("goodslist", auctionlist);
		return "auction";
	}

	@RequestMapping("/updateprice")
	@ResponseBody
	public String go_price(@RequestParam(value = "g_no", required = true) int g_no,
			@RequestParam(value = "g_price", required = true) String g_price,
			@RequestParam(value = "g_buyer", required = true) String g_buyer, HttpServletRequest request) {

		auctionService.updateGoodsPnB(Integer.parseInt(g_price), g_no, g_buyer);
		return auctionService.getGoodsPrice(g_no) + "," + auctionService.getGoodsBuyer(g_no);
	}

	@RequestMapping("/payment")
	public String end_auction(@RequestParam(value = "g_no") int g_no) {
		Trade trade = new Trade();
		trade.setT_subno(g_no);
		trade.setT_buyer(auctionService.getGoodsBuyer(g_no));
		trade.setT_pay(0);
		auctionService.addTradeList(trade);
		return "";
	}

	@RequestMapping("/paymentwait")
	public String paymentwait(HttpSession session, Model m) {
		User loginUser = (User) session.getAttribute("loginUserBean");
		List<Trade> tradelist = auctionService.getTradeList(loginUser.getU_id());
		List<Goods> goodslist = new ArrayList<>();

		for (int i = 0; i < tradelist.size(); i++) {
			Goods goods = auctionService.NoPaygoods(tradelist.get(i).getT_subno());
			goodslist.add(goods);
		}
		m.addAttribute("goodslist", goodslist);
		return "paymentwait";
	}

	@RequestMapping("/paymentwait_success")
	public String paymentwait_succee(@RequestParam(value = "content") int g_no) {
		auctionService.paidContent(g_no);

		return "MyPage";
	}

	@RequestMapping("/auction_reply")
	@ResponseBody
	public String auction_reply(@RequestParam(value = "r_no") int r_no,
			@RequestParam(value = "r_writer") String r_writer, @RequestParam(value = "r_text") String r_text) {

		Auction_reply reply = new Auction_reply();
		reply.setR_no(r_no);
		reply.setR_text(r_text);
		reply.setR_writer(r_writer);
		auctionService.addAuctionReply(reply);
		return r_text;
	}
}