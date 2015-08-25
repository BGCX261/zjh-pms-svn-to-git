package com.kaishengit.action;

import com.kaishengit.pojo.DealType;
import com.kaishengit.service.DealTypeService;
import com.opensymphony.xwork2.ActionSupport;

public class DealTypeAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;

	private DealTypeService dealTypeService;
	private DealType dealType;
	
	
	
	//get set
	public DealType getDealType() {
		return dealType;
	}
	public void setDealType(DealType dealType) {
		this.dealType = dealType;
	}
	public void setDealTypeService(DealTypeService dealTypeService) {
		this.dealTypeService = dealTypeService;
	}
	
	

	
}
