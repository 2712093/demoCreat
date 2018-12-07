package com.merry.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.merry.cms.dao.MobilePhoneDao;
import com.merry.cms.entity.MobilePhone;

@Service("mobilePhoneService")
public class MobilePhoneService {
	@Autowired
	private MobilePhoneDao mobilePhoneDao;
	

	/**
	 * 通过手机号查询手机号列表
	 * 
	 */
	public List<MobilePhone> getPhoneByPhone(String phone){
		return mobilePhoneDao.getPhoneByPhone(phone);
	}

}
