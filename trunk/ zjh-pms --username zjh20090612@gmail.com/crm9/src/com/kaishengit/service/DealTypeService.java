package com.kaishengit.service;

import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.dao.DealTypeDao;

@Transactional
public class DealTypeService {

	private DealTypeDao dealTypeDao;

	
	
	
	
	//get set
	public void setDealTypeDao(DealTypeDao dealTypeDao) {
		this.dealTypeDao = dealTypeDao;
	}
	
	
}
