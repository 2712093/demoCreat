package com.demo.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.demo.cms.entity.LoginLog;

@Repository
public interface LoginLogDao {
	/**
	 * 添加访问记录
	 * @param loginLog
	 * @return int
	 */
	public int addLoginLog(LoginLog loginLog);
	
	
	/**
	 * 获取所有对象
	 * 
	 * @param offset
	 * @param rows
	 * @return
	 */
	public List<LoginLog> getAllList(@Param("offset") long offset, @Param("rows") long rows,
			  @Param("mobilePhone")String mobilePhone,@Param("time") String time ,@Param("type") String type);

	/**
	 * 获取所有记录的数量
	 * 
	 * @return
	 */
	public int getAllListCount( @Param("mobilePhone")String mobilePhone,@Param("time") String time ,@Param("type") String type);
}
