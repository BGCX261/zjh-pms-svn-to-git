package com.kaishengit.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.dao.ContactDao;
import com.kaishengit.pojo.Contact;
@Transactional
public class ContactService {
	private ContactDao contactDao;
	
	
	public List<Contact> findAll(){
		return contactDao.findAll();
	}
	
	public void save(Contact contact){
		contactDao.save(contact);
	}
	
	public List<Contact> findByName(Contact contact){
		return contactDao.findBy("name",contact.getName());
	}
 	

	public void setContactDao(ContactDao contactDao) {
		this.contactDao = contactDao;
	}
	
	

}
