package com.demo.cms.manage.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.cms.constant.LoginLogConstant;
import com.demo.cms.constant.PrizeHistoryConstant;
import com.demo.cms.service.LoginLogService;
import com.demo.cms.service.PrizeHistoryService;
import com.demo.cms.service.UserService;
import com.demo.cms.util.DateUtil;

@Controller
@RequestMapping("/manage/headline")
public class HeadlineManageAction extends BaseManageAction{
	@Autowired
	private PrizeHistoryService prizeHistoryService;
	@Autowired
	private UserService userService;
	@Autowired
	private LoginLogService loginLogService;
	@RequestMapping(value = "/view.htm")
	public String view(HttpServletRequest request,ModelMap modelMap) throws Exception {
		String dateString = DateUtil.date_to_string(new Date(), DateUtil.FORMAT_YYYYMMDD);
		modelMap.put("prizeVo", prizeHistoryService.getGroupByPrizeId(dateString, dateString));
		modelMap.put("userCount", userService.getCountByTime(dateString, dateString));
		modelMap.put("comeCount", loginLogService.getAllListCount(null, dateString,LoginLogConstant.Type.come.toString()));
		modelMap.put("wx10086Count", loginLogService.getAllListCount(null, dateString,LoginLogConstant.Type.wx10086.toString()));
		modelMap.put("prizeCount", prizeHistoryService.getAllListCount(0, 0, null, null, dateString,PrizeHistoryConstant.PRIZENUMBER_YES));
		return manageTemplateService.getHeadlineTemplate("view");
	}
}
