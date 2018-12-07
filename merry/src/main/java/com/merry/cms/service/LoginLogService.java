package com.merry.cms.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.merry.cms.dao.LoginLogDao;
import com.merry.cms.entity.LoginLog;
import com.merry.cms.vo.PageVo;

@Service("loginLogService")
@Transactional
public class LoginLogService {
	@Autowired
	private LoginLogDao loginLogDao;
	
	/**
	 * 增加访问记录
	 * @param name
	 * @param password
	 * @return
	 */
	public LoginLog addLoginLog(LoginLog loginLog) throws Exception{
		loginLog.setCreateTime(new Date());
		loginLogDao.addLoginLog(loginLog);
		return loginLog;
	}
	/**
	 * 获得所有访问记录的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<User>
	 */
	@Transactional(readOnly=true)
	public List<LoginLog> getAllList(long offset, long rows,String mobilePhone,String time ,String type) {
		return loginLogDao.getAllList(offset, rows,mobilePhone, time,type);
	}

	/**
	 * 获得所有访问记录的数量
	 * 
	 * @return Integer
	 */
	@Transactional(readOnly=true)
	public int getAllListCount(String mobilePhone,String time ,String type) {
		return loginLogDao.getAllListCount(mobilePhone, time,type);
	}
	
	/**
	 * 获得所有访问记录的分页
	 * 
	 * @param Integer
	 * @return PageVo<User>
	 */
	@Transactional(readOnly=true)
	public PageVo<LoginLog> getAllListPage(int pageNum,String mobilePhone,String time,String type) {
		PageVo<LoginLog> pageVo = new PageVo<LoginLog>(pageNum);
		pageVo.setRows(10);
		List<LoginLog> list = this.getAllList(pageVo.getOffset(),
				pageVo.getRows(), mobilePhone,time,type);
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount( mobilePhone,time,type));
		return pageVo;
	}
	
}
