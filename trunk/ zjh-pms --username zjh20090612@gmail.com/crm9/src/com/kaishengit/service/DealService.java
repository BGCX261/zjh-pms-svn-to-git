package com.kaishengit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.dao.DealDao;
import com.kaishengit.pojo.Deal;

@Transactional
public class DealService {
	private DealDao dealDao;
	
	public List<Deal> findAll(){
		return dealDao.findAll();
	}
	
	public void save(Deal deal){
		dealDao.save(deal);
	}

	public void setDealDao(DealDao dealDao) {
		this.dealDao = dealDao;
	}
	
	

}
