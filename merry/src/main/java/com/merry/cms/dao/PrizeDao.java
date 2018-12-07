package com.merry.cms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.merry.cms.entity.Prize;

@Repository("prizeDao")
public interface PrizeDao {

	/**
	 * 添加新奖品
	 * @param prize
	 * @return int
	 */
	public int addPrize(Prize prize);
	/**
	 * 修改奖品
	 * @param prize
	 * @return int
	 */
	public void updatePrizeByprizeId(Prize prize);
	
	/**
	 * 删除奖品
	 * @param prizeId
	 * @return
	 */
	public int deletePrize(long prizeId);
	
	/**
	 * 获取所有对象
	 * @param offset
	 * @param rows
	 * @return
	 */
	public List<Prize> getAllList(@Param("offset")long offset,@Param("rows")long rows);
	/**
	 * 获取所有奖品的数量
	 * @return
	 */
	public int getAllListCount();
	/**
	 * 通过Id获取指定奖品资料
	 * @param prizeId
	 * @return
	 */
	public Prize getPrizeById(long prizeId);
	/**
	 * 通过奖品类型获取奖品列表
	 * @param type
	 * @return
	 */
	public List<Prize> getPrizeByType(String type);
	
}
