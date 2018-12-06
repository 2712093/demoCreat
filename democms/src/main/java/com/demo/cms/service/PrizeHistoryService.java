package com.demo.cms.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.cms.dao.PrizeHistoryDao;
import com.demo.cms.entity.PrizeHistory;
import com.demo.cms.vo.PageVo;
import com.demo.cms.vo.PrizeHistoryVo;

@Service("prizeHistoryService")
@Transactional(rollbackFor = Exception.class)
public class PrizeHistoryService {
	@Autowired
	private PrizeHistoryDao prizeHistoryDao;
	/**
	 * 添加抽奖历史记录
	 * @param name
	 * @param password
	 * @return
	 */
	public PrizeHistory addPrizeHistory(PrizeHistory prizeHistory) throws Exception{
		prizeHistory.setCreateTime(new Date());
		prizeHistoryDao.addPrizeHistory(prizeHistory);
		return prizeHistory;
	}


	/**
	 * 获得所有抽奖历史的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<User>
	 */
	@Transactional(readOnly=true)
	public List<PrizeHistoryVo> getAllList(long offset, long rows,long userId,long prizeId,String userName,String prizeName,String time,int prizeNumber) {
		return prizeHistoryDao.getAllList(offset, rows,userId,prizeId,userName,prizeName, time,prizeNumber);
	}

	/**
	 * 获得所有抽奖历史的数量
	 * 
	 * @return Integer
	 */
	@Transactional(readOnly=true)
	public int getAllListCount(long userId,long prizeId,String userName,String prizeName,String time,int prizeNumber) {
		return prizeHistoryDao.getAllListCount(userId,prizeId,userName,prizeName, time,prizeNumber);
	}
	
	/**
	 * 获得所有抽奖历史的分页
	 * 
	 * @param Integer
	 * @return PageVo<User>
	 */
	@Transactional(readOnly=true)
	public PageVo<PrizeHistoryVo> getAllListPage(int pageNum,long userId,long prizeId,String userName,String prizeName,String time,int prizeNumber) {
		PageVo<PrizeHistoryVo> pageVo = new PageVo<PrizeHistoryVo>(pageNum);
		pageVo.setRows(10);
		List<PrizeHistoryVo> list = this.getAllList(pageVo.getOffset(),
				pageVo.getRows(),userId,prizeId, userName, prizeName,time,prizeNumber);
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount(userId,prizeId, userName, prizeName,time,prizeNumber));
		return pageVo;
	}
	/**
	 * 按时间段分组查询中奖数量
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<PrizeHistoryVo> getGroupByPrizeId(@Param("startTime")String startTime, @Param("endTime")String endTime){
		return prizeHistoryDao.getGroupByPrizeId( startTime,endTime);
	}
	/**
	 * 按时间段查询中奖记录
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	@Transactional(readOnly=true)
	public List<PrizeHistoryVo> getListByTime(@Param("startTime")String startTime, @Param("endTime")String endTime){
		return prizeHistoryDao.getListByTime( startTime,endTime);
	}
}
