package co.sp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.sp.beans.*;
import co.sp.dao.AuctionDao;

@Service
public class AuctionService {

	@Autowired
	private AuctionDao auctionDao;

	public void addAuctionContent(Goods auctionContentBean) {
		auctionDao.addAuctionContent(auctionContentBean);
	}

	public List<Goods> getGoodsBean() {
		return auctionDao.getGoodsBean();
	}

	public Goods getGoodsBean2(int g_no) {
		return auctionDao.getGoodsBean2(g_no);
	}

	public void updateGoodsPnB(int g_price, int g_no, String g_buyer) {
		auctionDao.updateGoodsPnB(g_price, g_no, g_buyer);
	}

	public String getGoodsPrice(int g_no) {
		return auctionDao.getGoodsPrice(g_no);
	}

	public String getGoodsBuyer(int g_no) {
		if (auctionDao.getGoodsBuyer(g_no) == null) {
			return "";
		} else {
			return auctionDao.getGoodsBuyer(g_no);
		}
	}

	public void addTradeList(Trade trade) {
		auctionDao.addTradeList(trade);
	}

	public String getGoodsTime(int g_no) {
		return auctionDao.getGoodsTime(g_no);
	}

	public void addAuctionReply(Auction_reply reply) {
		auctionDao.addAuctionReply(reply);
	}

	public List<Auction_reply> getAuctionReply(int g_no) {
		return auctionDao.getAuctionReply(g_no);
	}

	public String getGoodsSeller(int g_writer) {
		return auctionDao.getGoodsSeller(g_writer);
	}

	public List<Trade> getTradeList(String u_id) {
		return auctionDao.getTradeList(u_id);
	}

	public Goods NoPaygoods(int t_subno) {
		return auctionDao.NoPaygoods(t_subno);
	}

	public void paidContent(int g_no) {
		auctionDao.paidContent(g_no);
	}
	
	public void removeAllGoods(int u_no) {
		auctionDao.removeAllGoods(u_no);
	}
	
	public void removeAuctionReply(String u_id) {
		auctionDao.removeAuctionReply(u_id);
	}
}