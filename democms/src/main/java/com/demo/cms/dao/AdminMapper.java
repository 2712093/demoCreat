package com.demo.cms.dao;

import org.springframework.stereotype.Repository;

import com.demo.cms.entity.Admin;

@Repository("adminMapper")
public interface AdminMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table admin
	 * @mbggenerated  Mon Aug 29 21:59:00 CST 2016
	 */
	int deleteByPrimaryKey(Long adminId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table admin
	 * @mbggenerated  Mon Aug 29 21:59:00 CST 2016
	 */
	int insert(Admin record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table admin
	 * @mbggenerated  Mon Aug 29 21:59:00 CST 2016
	 */
	int insertSelective(Admin record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table admin
	 * @mbggenerated  Mon Aug 29 21:59:00 CST 2016
	 */
	Admin selectByPrimaryKey(Long adminId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table admin
	 * @mbggenerated  Mon Aug 29 21:59:00 CST 2016
	 */
	int updateByPrimaryKeySelective(Admin record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table admin
	 * @mbggenerated  Mon Aug 29 21:59:00 CST 2016
	 */
	int updateByPrimaryKey(Admin record);
}