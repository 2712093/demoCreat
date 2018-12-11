package com.merry.cms.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.helper.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.merry.cms.constant.ConfigConstant;
import com.merry.cms.constant.LoginLogConstant;
import com.merry.cms.constant.PrizeHistoryConstant;
import com.merry.cms.constant.UserConstant;
import com.merry.cms.entity.LoginLog;
import com.merry.cms.entity.MobilePhone;
import com.merry.cms.entity.Prize;
import com.merry.cms.entity.User;
import com.merry.cms.service.ConfigService;
import com.merry.cms.service.LoginLogService;
import com.merry.cms.service.MobilePhoneService;
import com.merry.cms.service.PrizeHistoryService;
import com.merry.cms.service.UserService;
import com.merry.cms.service.WxService;
import com.merry.cms.util.DateUtil;
import com.merry.cms.util.HttpUtils;
import com.merry.cms.util.PropertyUtils;
import com.merry.cms.vo.JsonVo;
import com.merry.cms.vo.PrizeHistoryVo;

@Controller
@RequestMapping("/draw")
public class DrawAction {

	@Autowired
	private UserService userService;
	@Autowired
	private PrizeHistoryService prizeHistoryService;
	@Autowired
	private LoginLogService loginLogService;
	@Autowired
	private ConfigService configService;
	@Autowired
	private MobilePhoneService mobilePhoneService;
	@Autowired
	private WxService wxService;
	
	
	/**
	 * 用户访问页面
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/come.htm",method=RequestMethod.GET)
	public String come(HttpServletRequest request,ModelMap modelMap,HttpServletResponse response) throws UnsupportedEncodingException{
		String mobilePhone = request.getParameter("mobilePhone");
		String nickname = request.getParameter("nickname");
		if(!StringUtils.isBlank(nickname)) {
			nickname = URLDecoder.decode(nickname,"UTF-8");
		}
		String status = request.getParameter("status");
		try{
			//与微信接口对接  与微信对接接口代码暂没有测试
			if(StringUtil.isBlank(status)) {
				response.sendRedirect(PropertyUtils.getValue("merry.HTTP")+"/wx/getCode");
				return null;
			}
			//关注，往下执行
			
			if(!StringUtils.isBlank(mobilePhone)){
				//验证是否北京号码
				List<MobilePhone> listPhone = mobilePhoneService.getPhoneByPhone(mobilePhone);
				if(listPhone==null || listPhone.size()<=0) {
					mobilePhone = "00";
				}else {
					User user = userService.getUserByMobilePhone(mobilePhone);
					//判断是否有当前用户， 没有则创建
					if(user==null){
						user = new User();
						user.setMobilePhone(mobilePhone);
						user.setType(UserConstant.Type.wx.toString());
						user.setName(nickname);
						userService.addUser(user);
					}
					//添加访问记录
					LoginLog log = new LoginLog();
					log.setMobilePhone(mobilePhone);
					log.setUserId(user.getUserId());
					log.setIp(HttpUtils.getIpAddr(request));
					log.setType(LoginLogConstant.Type.come.toString());
					log.setDescString("本地访问");
					loginLogService.addLoginLog(log);
				}
			}
			modelMap.put("mobilePhone", mobilePhone);
			modelMap.put("nickname", nickname);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "template/user/draw/drawjs";
	}
	@RequestMapping(value="/ewm.htm",method=RequestMethod.GET)
	public String ewm(HttpServletRequest request,ModelMap modelMap){
		return "template/user/draw/ewm";
	}
	@RequestMapping("/draw.json")
	@ResponseBody
	public JsonVo<Prize> draw(@RequestParam(value="mobilePhone") String mobilePhone,HttpServletRequest request,ModelMap modelMap){
		JsonVo<Prize> json = new JsonVo<Prize>();
		try {
			//验证是否北京号码
			List<MobilePhone> listPhone = mobilePhoneService.getPhoneByPhone(mobilePhone);
			if(listPhone==null || listPhone.size()<=0) {
				json.setResult(false);
				json.getErrors().put("drawMsg", "非北京号码不能参加该活动！");
			}else {
				User user = userService.getUserByMobilePhone(mobilePhone);
				int count = prizeHistoryService.getAllListCount(user.getUserId().longValue(), 0, null, null, DateUtil.date_to_string(new Date(), DateUtil.FORMAT_YYYYMMDD),PrizeHistoryConstant.PRIZENUMBER_ALL);
				if(count<configService.getIntKey(ConfigConstant.MERRY_USER_DRAWCOUNT)){
					System.out.println("------------------"+mobilePhone+"-----------------------");
					Prize prize = userService.draw(user);
					if(prize!=null) {
						json.setResult(true);
						json.setT(prize);
					}else {
						json.setResult(false);
						json.getErrors().put("drawMsg", "奖品不存在");
					}
				}else{
					json.setResult(true);
				}
			}
		} catch (Exception e) {
			json.setResult(false);
			json.getErrors().put("drawMsg", "抽奖异常，请与客服联系");
		}
		return json;
	}
	@RequestMapping("/myPrize.json")
	@ResponseBody
	public JsonVo<List<PrizeHistoryVo>> myPrize(@RequestParam(value="mobilePhone") String mobilePhone,HttpServletRequest request,ModelMap modelMap){
		JsonVo<List<PrizeHistoryVo>> json = new JsonVo<List<PrizeHistoryVo>>();
		try {
			User user = userService.getUserByMobilePhone(mobilePhone);
			List<PrizeHistoryVo> list = prizeHistoryService.getAllList(0,Integer.MAX_VALUE,user.getUserId().longValue(), 0, null, null, null,PrizeHistoryConstant.PRIZENUMBER_YES);
			json.setResult(true);
			json.setT(list);
		} catch (Exception e) {
			json.setResult(false);
			json.getErrors().put("drawMsg", "请求异常，请与客服联系");
		}
		return json;
	}
	@RequestMapping("/receiveLog.json")
	@ResponseBody
	public JsonVo<String> receiveLog(HttpServletRequest request,ModelMap modelMap) throws UnsupportedEncodingException{
		String mobilePhone = request.getParameter("mobilePhone");
		String nickname = request.getParameter("nickname");
		if(!StringUtils.isBlank(nickname)) {
			nickname = URLDecoder.decode(nickname,"UTF-8");
		}
		JsonVo<String> json = new JsonVo<String>();
		try {
			if(!StringUtils.isBlank(mobilePhone)){
				User user = userService.getUserByMobilePhone(mobilePhone);
				//判断是否有当前用户， 没有则创建
				if(user==null){
					user = new User();
					user.setMobilePhone(mobilePhone);
					user.setType(UserConstant.Type.wx.toString());
					user.setName(nickname);
					userService.addUser(user);
				}
				//添加访问记录
				LoginLog log = new LoginLog();
				log.setMobilePhone(mobilePhone);
				log.setUserId(user.getUserId());
				log.setIp(HttpUtils.getIpAddr(request));
				log.setType(LoginLogConstant.Type.wx10086.toString());
				log.setDescString("领取流量");
				loginLogService.addLoginLog(log);
			}
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.getErrors().put("drawMsg", "请求异常，请与客服联系");
		}
		return json;
	}
	@RequestMapping("/getPrizeTop.json")
	@ResponseBody
	public JsonVo<List<PrizeHistoryVo>> prizeTop(HttpServletRequest request,ModelMap modelMap){
		JsonVo<List<PrizeHistoryVo>> json = new JsonVo<List<PrizeHistoryVo>>();
		try {
			List<PrizeHistoryVo> list = prizeHistoryService.getAllList(0,3,0, 0, null, null, null,PrizeHistoryConstant.PRIZENUMBER_YES);
			json.setResult(true);
			json.setT(list);
		} catch (Exception e) {
			json.setResult(false);
			json.getErrors().put("drawMsg", "请求异常，请与客服联系");
		}
		return json;
	}
}
