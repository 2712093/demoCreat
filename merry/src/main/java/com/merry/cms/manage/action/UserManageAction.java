package com.merry.cms.manage.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 个人用户
 * @author liujie
 *
 */
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.merry.cms.service.ManageTemplateService;
import com.merry.cms.service.UserService;
@Controller
@RequestMapping("/manage/user")
public class UserManageAction {
	@Autowired
	private UserService userService;
	@Autowired
	protected ManageTemplateService manageTemplateService;
	
	@RequestMapping(value="/list.htm",method=RequestMethod.GET)
	public String manage(@RequestParam(value="page",defaultValue="1")int page,ModelMap modelMap) throws Exception{
		modelMap.put("pageVo", userService.getAllListPage(page));
		return manageTemplateService.getUserTemplate("list");
	}
}
