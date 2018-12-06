package com.demo.cms.manage.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.cms.service.LoginLogService;

@Controller
@RequestMapping("/manage/loginLog")
public class LoginLogManageAction extends BaseManageAction{
	@Autowired
	private LoginLogService loginLogService;
	@RequestMapping(value = "/list.htm")
	public String manage(@RequestParam(value = "page", defaultValue = "1") int page,
			HttpServletRequest request,ModelMap modelMap) throws Exception {
		String mobilePhone = request.getParameter("mobilePhone");
		String time = request.getParameter("time");
		String type = request.getParameter("type");
		
		modelMap.put("pageVo", loginLogService.getAllListPage(page, mobilePhone,time,type));
		modelMap.put("mobilePhone", mobilePhone);
		modelMap.put("time", time);
		return manageTemplateService.getLoginLogTemplate("list");
	}
}
