package com.zb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zb.entity.Contact;

public interface ContactMapper {
	//��ҳ��ʾ+������ѯ
	public List<Contact>findContactPage(@Param("cname")String cname,@Param("index")Integer index,@Param("size")Integer size);
	
	//���ܼ�¼��
	public int findCount(@Param("cname")String cname);
	
	//����
	public int insertContact(Contact contact);
	
	//�޸�
	public int updateContact(Contact contact);
	
	//ͨ��id��ѯΨһ���ؽ��
	public Contact findContactByid(@Param("id")Integer id);

}
