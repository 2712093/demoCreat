package com.demo.cms.service;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.demo.cms.constant.PrizeConstant;
import com.demo.cms.dao.UserDao;
import com.demo.cms.entity.Prize;
import com.demo.cms.entity.PrizeHistory;
import com.demo.cms.entity.User;
import com.demo.cms.exception.AuthException;
import com.demo.cms.vo.PageVo;

@Service("userService")
@Transactional(rollbackFor = Exception.class)
public class UserService {
	protected final Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private UserDao userDao;
	@Autowired
	private PrizeHistoryService prizeHistoryService;
	@Autowired
	private PrizeService prizeService;
	/**
	 * 抽奖
	 * @throws AuthException 
	 */
	public Prize draw(User user) throws Exception{
		//获取当前抽奖的所有奖品列表
		List<Prize> pl = prizeService.getPrizeByType(PrizeConstant.DEFAULT_DRAW_TYPE);
		if(pl!=null && pl.size()>0){
			//奖池包含未中奖+奖品1+奖品2+...
			//设置奖池，每个奖品概率占据奖池一定区间，取奖池长度以内随机数， 随机到哪个区间，获得该区间奖品
			int count = 0;
			for(Prize  p : pl){
				count += p.getProbability();
			}
			logger.info("奖池大小count:"+count);
			//抽奖
			Random r = new Random();
			int key = r.nextInt(count)+1;
			logger.info("抽奖key:"+key);
			int num = 0;
			Prize  prize = null;
			for( Prize  p : pl ){
				if(key <= num+p.getProbability()){
					prize = p;
					logger.info("抽奖对象:"+JSON.toJSONString(p));
					break;
				}else{
					num += p.getProbability();
				}
			}
			if(prize!=null && prize.getPrizeNumber()>0) {
				//给用户添加抽奖奖品代码
//				http 接口  prize
				//添加抽奖记录
				PrizeHistory prizeHistory = new PrizeHistory();
				prizeHistory.setUserId(user.getUserId());
				prizeHistory.setPrizeId(prize.getPrizeId());
				prizeHistoryService.addPrizeHistory(prizeHistory);
			}
			return prize;
		}
		return null;
	}
	/**
	 * 增加用户
	 * @param name
	 * @param password
	 * @return
	 */
	public User addUser(User user) throws AuthException{
		user.setCreateTime(new Date());
		userDao.addUser(user);
		return user;
	}
	
	/**
	 * 删除用户
	 * 
	 * @param UserId
	 * @return Integer
	 */
	public int deleteUser(long userId) {
		return userDao.deleteUser(userId);
	}


	/**
	 * 通过Id获得指定用戶资料
	 */
	@Transactional(readOnly=true)
	public User getUserById(long userId) {
		return userDao.getUserById(userId);
	}
	
	/**
	 * 通过手机号获得指定用戶资料
	 */
	@Transactional(readOnly=true)
	public User getUserByMobilePhone(String mobilePhone) {
		return userDao.getUserByMobilePhone(mobilePhone);
	}

	/**
	 * 获得所有用户的分页数据
	 * 
	 * @param offset
	 * @param rows
	 * @return List<User>
	 */
	@Transactional(readOnly=true)
	public List<User> getAllList(long offset, long rows) {
		return userDao.getAllList(offset, rows);
	}

	/**
	 * 获得一段时间新用户的数量
	 * 
	 * @return Integer
	 */
	@Transactional(readOnly=true)
	public int getCountByTime(String startTime, String endTime) {
		return userDao.getCountByTime(startTime, endTime);
	}
	/**
	 * 获得所有用户的数量
	 * 
	 * @return Integer
	 */
	@Transactional(readOnly=true)
	public int getAllListCount() {
		return userDao.getAllListCount();
	}

	/**
	 * 获得所有用户的分页
	 * 
	 * @param Integer
	 * @return PageVo<User>
	 */
	@Transactional(readOnly=true)
	public PageVo<User> getAllListPage(int pageNum) {
		PageVo<User> pageVo = new PageVo<User>(pageNum);
		pageVo.setRows(10);
		List<User> list = this.getAllList(pageVo.getOffset(),
				pageVo.getRows());
		pageVo.setList(list);
		pageVo.setCount(this.getAllListCount());
		return pageVo;
	}
	
	
}
