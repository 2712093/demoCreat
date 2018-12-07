package com.merry.cms.manage.action;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.merry.cms.constant.ConfigConstant;
import com.merry.cms.vo.JsonVo;

@Controller
@RequestMapping("/manage/config")
public class ConfigManageAction extends BaseManageAction{
	@RequestMapping("/index.htm")
	public String index(HttpServletRequest request,ModelMap modelMap){
		try {
			modelMap.addAttribute(ConfigConstant.MERRY_USER_DRAWCOUNT, configService.getConfigByKey(ConfigConstant.MERRY_USER_DRAWCOUNT));
			return manageTemplateService.getConfigTemplate("index");
		} catch (Exception e) {
			logger.fatal(e.getMessage());
			return manageTemplateService.get404();
		}
	}
	
	@ResponseBody
	@RequestMapping("/update.json")
	public JsonVo<String> update(@RequestParam(value="key") String key,
			@RequestParam(value="value")String value){
		JsonVo<String> json = new JsonVo<String>();
			try {
				configService.updateConfigByKey(key, value);
				json.setResult(true);
			} catch (Exception e) {
				json.setResult(false);
				json.setMsg(e.getMessage());
			}
			return json;
	}
	
	@RequestMapping("/edit.htm")
	public String update(HttpServletRequest request,ModelMap modelMap){
		String key = request.getParameter("key");
		try {
			if(!StringUtils.isBlank(key)) {
				modelMap.addAttribute("config", configService.getConfigByKey(key));
			}
			return manageTemplateService.getConfigTemplate("edit");
		} catch (Exception e) {
			logger.fatal(e.getMessage());
			return manageTemplateService.get404();
		}
	}
}
