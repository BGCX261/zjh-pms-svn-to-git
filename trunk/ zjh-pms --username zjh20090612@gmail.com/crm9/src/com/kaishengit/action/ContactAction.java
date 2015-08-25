package com.kaishengit.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.kaishengit.pojo.Contact;
import com.kaishengit.pojo.User;
import com.kaishengit.service.ContactService;
import com.kaishengit.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class ContactAction extends ActionSupport implements SessionAware{
	
	private static final long serialVersionUID = 1L;
	private Contact contact;
	private ContactService contactService;
	private Map<String,Object> session;
	private List<Contact> contactList;
	private List<Contact> nameList;
	
	public String list(){
		contactList = contactService.findAll();
		return SUCCESS;
	}
	
	public String add(){
		return SUCCESS;
	}
	
	public String addcompany(){
		return SUCCESS;
	}
	
	public String save(){
		User u = (User) session.get("user");
		contact.setUser(u);
		contact.setCreatetime(DateUtil.getNow());
		contactService.save(contact);
		return SUCCESS;
	}
	
	public String findByName(){
		nameList = contactService.findByName(contact);
		return SUCCESS;
	}
	
	
	//get set
	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public void setContactService(ContactService contactService) {
		this.contactService = contactService;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<Contact> getContactList() {
		return contactList;
	}

	public void setContactList(List<Contact> contactList) {
		this.contactList = contactList;
	}

	public List<Contact> getNameList() {
		return nameList;
	}

	public void setNameList(List<Contact> nameList) {
		this.nameList = nameList;
	}
	
	

}
