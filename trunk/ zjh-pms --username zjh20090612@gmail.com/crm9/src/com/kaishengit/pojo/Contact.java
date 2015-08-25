package com.kaishengit.pojo;

import java.util.Set;

public class Contact {
	private String id;
	private String name;
	private String companyname;
	private String weibo;
	private String weibotype;
	private String content;
	private String view;
	private String companyid;
	private String address;
	private String createtime;
	private User user;
	private Set<Deal> dealSet;
	private Set<Task> taskSet;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getWeibo() {
		return weibo;
	}
	public void setWeibo(String weibo) {
		this.weibo = weibo;
	}
	public String getWeibotype() {
		return weibotype;
	}
	public void setWeibotype(String weibotype) {
		this.weibotype = weibotype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public String getCompanyid() {
		return companyid;
	}
	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Deal> getDealSet() {
		return dealSet;
	}
	public void setDealSet(Set<Deal> dealSet) {
		this.dealSet = dealSet;
	}
	public Set<Task> getTaskSet() {
		return taskSet;
	}
	public void setTaskSet(Set<Task> taskSet) {
		this.taskSet = taskSet;
	}
	
	
	

}
