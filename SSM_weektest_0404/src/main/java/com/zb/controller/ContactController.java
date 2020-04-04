package com.zb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.zb.entity.Contact;
import com.zb.service.ContactService;
import com.zb.util.PageUtil;

@Controller
public class ContactController {
	@Autowired
	private ContactService contactService;
	
	//��ҳ+������ѯ
	@RequestMapping(value="findpage")
	@ResponseBody
	public String findContactPage(String cname,Integer index){
		Integer size=4;
		PageUtil<Contact>page=contactService.findContactPage(cname, index, size);
		return JSON.toJSONString(page);
	}
	
	//��ѯָ����Ϣ
	@RequestMapping(value="findByid")
	@ResponseBody
	public String findContactByid(Integer id){
		return JSON.toJSONString(contactService.findContactByid(id));
	}
	
	//����
	@RequestMapping(value="addContact")
	@ResponseBody
	public String insertContact(Contact contact){
		int num=contactService.insertContact(contact);
		if(num>0){
			return JSON.toJSONString("success");
		}else{
			return JSON.toJSONString("input");
		}
	}
	
	//�޸�
	@RequestMapping(value="updateContact")
	@ResponseBody
	public String updateContact(Contact contact){
		int num=contactService.updateContact(contact);
		if(num>0){
			return JSON.toJSONString("success");
		}else{
			return JSON.toJSONString("input");
		}
	}

}
