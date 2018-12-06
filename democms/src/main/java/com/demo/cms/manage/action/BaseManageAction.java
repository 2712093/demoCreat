package com.demo.cms.manage.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.demo.cms.constant.SystemConstant;
import com.demo.cms.exception.ValidateException;
import com.demo.cms.service.AdminService;
import com.demo.cms.service.ConfigService;
import com.demo.cms.service.HeadlineService;
import com.demo.cms.service.ManageTemplateService;
import com.demo.cms.vo.AdminVo;
import com.demo.cms.vo.JsonVo;

public class BaseManageAction {
	protected final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected AdminService adminService;
	@Autowired
	protected HeadlineService headline;
	@Autowired
	protected ConfigService configService;

	@Autowired
	protected ManageTemplateService manageTemplateService;
	/**
	 * 参数校验
	 * @param json
	 * @throws ValidateException
	 */
	protected <T> void validate(JsonVo<T> json) throws ValidateException {
		if(json.getErrors().size()>0){
			json.setResult(false);
			throw new ValidateException("系统发生错误");
		}else{
			json.setResult(true);
		}
	}
	/**
	 * 从sessio获取管理员信息
	 * @param request
	 * @return
	 */
	protected AdminVo getAdmin(HttpServletRequest request){
		AdminVo admin = (AdminVo) request.getSession().getAttribute(SystemConstant.SESSION_ADMIN);
		return admin;
	}
}
