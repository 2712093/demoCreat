package com.merry.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.merry.cms.entity.User;

@Repository("userDao")
public interface UserDao {
	/**
	 * 添加新用户
	 * @param user
	 * @return int
	 */
	public int addUser(User user);
	
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	public int deleteUser(long userId);
	
	/**
	 * 获取所有对象
	 * @param offset
	 * @param rows
	 * @return
	 */
	public List<User> getAllList(@Param("offset")long offset,@Param("rows")long rows);
	/**
	 * 获取所有用户的数量
	 * @return
	 */
	public int getAllListCount();
	/**
	 * 根据日期查询用户数量
	 * @return
	 */
	public int getCountByTime(@Param("startTime")String startTime,@Param("endTime")String endTime );
	/**
	 * 通过Id获取指定用户资料
	 * @param userId
	 * @return
	 */
	public User getUserById(long userId);
	/**
	 * 通过手机号获取指定用户资料
	 * @param mobilePhone
	 * @return
	 */
	public User getUserByMobilePhone(String mobilePhone) ;
}
