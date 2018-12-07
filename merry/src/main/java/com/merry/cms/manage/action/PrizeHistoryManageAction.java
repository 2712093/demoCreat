package com.merry.cms.manage.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.merry.cms.constant.PrizeHistoryConstant;
import com.merry.cms.service.PrizeHistoryService;
import com.merry.cms.service.UserService;

@Controller
@RequestMapping("/manage/prizeHistory")
public class PrizeHistoryManageAction extends BaseManageAction {
	@Autowired
	private PrizeHistoryService prizeHistoryService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/list.htm")
	public String manage(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "userId", defaultValue = "0") long userId,
			@RequestParam(value = "prizeId", defaultValue = "0") long prizeId,
			@RequestParam(value = "prizeNumber", defaultValue = ""+PrizeHistoryConstant.PRIZENUMBER_ALL) int prizeNumber,
			HttpServletRequest request,ModelMap modelMap) throws Exception {
		String userName = request.getParameter("userName");
		String prizeName = request.getParameter("prizeName");
		String time = request.getParameter("time");
		
		modelMap.put("pageVo", prizeHistoryService.getAllListPage(page, userId, prizeId,userName,prizeName,time,prizeNumber));
		
		modelMap.put("user", userService.getUserById(userId));
		modelMap.put("userName", userName);
		modelMap.put("prizeName", prizeName);
		return manageTemplateService.getPrizeHistoryTemplate("list");
	}
	
	@RequestMapping(value = "/statistics.htm")
	public String statistics(@RequestParam(value = "startTime",  defaultValue = "") String startTime,
			@RequestParam(value = "endTime", defaultValue = "") String endTime,
			HttpServletRequest request,ModelMap modelMap) throws Exception {
		
		modelMap.put("pageVo", prizeHistoryService.getGroupByPrizeId(startTime, endTime));
		modelMap.put("startTime", startTime);
		modelMap.put("endTime", endTime);
		return manageTemplateService.getPrizeHistoryTemplate("statistics");
	}
}
