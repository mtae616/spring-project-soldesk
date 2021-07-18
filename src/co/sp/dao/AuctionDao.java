package co.sp.dao;

import java.util.List;

import javax.swing.ActionMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import co.sp.beans.*;
import co.sp.mapper.AuctionMapper;

@Repository
public class AuctionDao {

	@Autowired
	private AuctionMapper auctionMapper;

	public void addAuctionContent(Goods auctionContentBean) {
		auctionMapper.addAuctionContent(auctionContentBean);
	}

	public List<Goods> getGoodsBean() {
		return auctionMapper.getGoodsBean();
	}

	public Goods getGoodsBean2(int g_no) {
		return auctionMapper.getGoodsBean2(g_no);
	}

	public void updateGoodsPnB(int g_price, int g_no, String g_buyer) {
		auctionMapper.updateGoodsPnB(g_price, g_no, g_buyer);
	}

	public String getGoodsPrice(int g_no) {
		return auctionMapper.getGoodsPrice(g_no);
	}

	public String getGoodsBuyer(int g_no) {
		return auctionMapper.getGoodsBuyer(g_no);
	}

	public void addTradeList(Trade trade) {
		auctionMapper.addTradeList(trade);
	}

	public String getGoodsTime(int g_no) {
		return auctionMapper.getGoodsTime(g_no);
	}

	public void addAuctionReply(Auction_reply reply) {
		auctionMapper.addAuctionReply(reply);
	}

	public List<Auction_reply> getAuctionReply(int g_no) {
		return auctionMapper.getAuctionReply(g_no);
	}

	public String getGoodsSeller(int g_writer) {
		return auctionMapper.getGoodsSeller(g_writer);
	}

	public List<Trade> getTradeList(String u_id) {
		return auctionMapper.getTradeList(u_id);
	}

	public Goods NoPaygoods(int t_subno) {
		return auctionMapper.NoPaygoods(t_subno);
	}

	public void paidContent(int g_no) {
		auctionMapper.paidContent(g_no);
	}
	
	public void removeAllGoods(int u_no) {
		auctionMapper.removeAllGoods(u_no);
	}
	
	public void removeAuctionReply(String u_id) {
		auctionMapper.removeAuctionReply(u_id);
	}
}