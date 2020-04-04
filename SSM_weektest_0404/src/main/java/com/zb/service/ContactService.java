package com.zb.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zb.entity.Contact;
import com.zb.util.PageUtil;

public interface ContactService {
	
	public PageUtil<Contact>findContactPage(String cname,Integer index,Integer size);
	
	public int insertContact(Contact contact);
		
	public int updateContact(Contact contact);
	
	public Contact findContactByid(Integer id);
	
}
