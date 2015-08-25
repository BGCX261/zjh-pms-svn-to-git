package com.kaishengit.pojo;

import java.util.Set;

public class DealType {
	private String id;
	private String type;
	private String createtime;
	private String color;
	private Set<Deal> dealSet;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Set<Deal> getDealSet() {
		return dealSet;
	}
	public void setDealSet(Set<Deal> dealSet) {
		this.dealSet = dealSet;
	}
	

}
