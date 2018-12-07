package com.merry.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.merry.cms.entity.PrizeHistory;
import com.merry.cms.vo.PrizeHistoryVo;

@Repository("prizeHistoryDao")
public interface PrizeHistoryDao {

	/**
	 * 添加中奖历史
	 * 
	 * @param admin
	 * @return int
	 */
	public int addPrizeHistory(PrizeHistory history);

	/**
	 * 获取所有对象
	 * 
	 * @param offset
	 * @param rows
	 * @return
	 */
	public List<PrizeHistoryVo> getAllList(@Param("offset") long offset, @Param("rows") long rows,
			@Param("userId") long userId, @Param("prizeId") long prizeId, @Param("userName")String userName, @Param("prizeName")String prizeName,@Param("time") String time,@Param("prizeNumber") int prizeNumber);

	/**
	 * 获取所有记录的数量
	 * 
	 * @return
	 */
	public int getAllListCount(@Param("userId") long userId, @Param("prizeId") long prizeId, @Param("userName")String userName, @Param("prizeName")String prizeName,@Param("time") String time,@Param("prizeNumber") int prizeNumber);
	
	/**
	 * 根据时间段分组查询
	 * 
	 * @param offset
	 * @param rows
	 * @return
	 */
	public List<PrizeHistoryVo> getGroupByPrizeId(@Param("startTime")String startTime, @Param("endTime")String endTime);
	/**
	 * 根据时间段查询
	 * 
	 * @param offset
	 * @param rows
	 * @return
	 */
	public List<PrizeHistoryVo> getListByTime(@Param("startTime")String startTime, @Param("endTime")String endTime);

}
