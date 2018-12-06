package com.demo.cms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.cms.dao.PrizeDao;
import com.demo.cms.entity.Prize;
import com.demo.cms.vo.PageVo;

@Service("prizeService")
public class PrizeService {

	@Autowired
	private PrizeDao prizeDao;
	
	/**
	 * 增加奖品
	 * @param Prize
	 * @return
	 */
	public Prize addPrize(Prize prize) throws Exception{
		prizeDao.addPrize(prize);
		return prize;
	}
	/**
	 * 增加奖品
	 * @param Prize
	 * @return
	 */
	public Prize updatePrize(Prize prize) throws Exception{
		prizeDao.updatePrizeByprizeId(prize);
		return prize;
	}
	
	/**
	 * 删除奖品
	 * 
	 * @param PrizeId
	 * @return Integer
	 */
	public int deletePrize(long prizeId) {
		return prizeDao.deletePrize(prizeId);
	}


	/**
	 * 通过Id获得指定奖品资料
	 */
	public Prize getPrizeById(long prizeId) {
		return prizeDao.getPrizeById(prizeId);
	}
	
	/**
	 * 通过type获得奖品列表
	 */
	public List<Prize> getPrizeByType(String type) {
		return prizeDao.getPrizeByType(type);
	}

	/**
	 * 获得所有奖品的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<Prize>
	 */
	public List<Prize> getAllList(long offset, long rows) {
		return prizeDao.getAllList(offset, rows);
	}

	/**
	 * 获得所有奖品的数量
	 * 
	 * @return Integer
	 */
	public int getAllListCount() {
		return prizeDao.getAllListCount();
	}

	/**
	 * 获得所有用户的分页
	 * 
	 * @param Integer
	 * @return PageVo<Prize>
	 */
	public PageVo<Prize> getAllListPage(int pageNum) {
		PageVo<Prize> pageVo = new PageVo<Prize>(pageNum);
		pageVo.setRows(10);
		List<Prize> list = this.getAllList(pageVo.getOffset(),
				pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}
	
}
