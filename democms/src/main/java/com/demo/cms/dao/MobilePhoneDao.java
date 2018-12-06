package com.demo.cms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.demo.cms.entity.MobilePhone;
@Repository("mobilePhoneDao")
public interface MobilePhoneDao {
	/**
	 * 通过手机号查询手机号列表
	 * @param adminId
	 * @return
	 */
	public List<MobilePhone> getPhoneByPhone(String phone);
}
