package com.kaishengit.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.kaishengit.pojo.Deal;
import com.kaishengit.pojo.User;
import com.kaishengit.service.DealService;
import com.kaishengit.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class DealAction extends ActionSupport implements SessionAware{

	
	private static final long serialVersionUID = 1L;
	private Deal deal;
	private DealService dealService;
	private Map<String,Object> session;
	
	public String list(){
		return SUCCESS;
	}
	public String adddeal(){
		return SUCCESS;
	}
	
	public String save(){
		User u = (User) session.get("user");
		deal.setUser(u);
		deal.setCreatetime(DateUtil.getNow());
		dealService.save(deal);
		return SUCCESS;
	}
	
	
	//get set
	public Deal getDeal() {
		return deal;
	}
	public void setDeal(Deal deal) {
		this.deal = deal;
	}
	public void setDealService(DealService dealService) {
		this.dealService = dealService;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
	
	
}
