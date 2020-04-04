package com.zb.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zb.entity.Contact;
import com.zb.mapper.ContactMapper;
import com.zb.service.ContactService;
import com.zb.util.PageUtil;

@Service
public class ContactServiceImpl implements ContactService{
	@Autowired
	private ContactMapper contactMapper;
	
	public PageUtil<Contact> findContactPage(String cname, Integer index, Integer size) {
		PageUtil<Contact>page=new PageUtil<Contact>();
		List<Contact>data=contactMapper.findContactPage(cname, (index-1)*size, size);
		int count=contactMapper.findCount(cname);
		page.setData(data);
		page.setPageindex(index);
		page.setPagesize(size);
		page.setTotalNewscount(count);		
		return page;
	}

	public int insertContact(Contact contact) {
		// TODO Auto-generated method stub
		return contactMapper.insertContact(contact);
	}

	public int updateContact(Contact contact) {
		// TODO Auto-generated method stub
		return contactMapper.updateContact(contact);
	}

	public Contact findContactByid(Integer id) {
		// TODO Auto-generated method stub
		return contactMapper.findContactByid(id);
	}

}
