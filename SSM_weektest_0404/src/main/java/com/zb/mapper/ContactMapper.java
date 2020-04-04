package com.zb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zb.entity.Contact;

public interface ContactMapper {
	//分页显示+条件查询
	public List<Contact>findContactPage(@Param("cname")String cname,@Param("index")Integer index,@Param("size")Integer size);
	
	//查总记录数
	public int findCount(@Param("cname")String cname);
	
	//增加
	public int insertContact(Contact contact);
	
	//修改
	public int updateContact(Contact contact);
	
	//通过id查询唯一返回结果
	public Contact findContactByid(@Param("id")Integer id);

}
