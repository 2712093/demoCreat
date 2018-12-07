package com.merry.cms.manage.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.merry.cms.constant.SystemConstant;
import com.merry.cms.exception.ValidateException;
import com.merry.cms.service.AdminService;
import com.merry.cms.service.ConfigService;
import com.merry.cms.service.ManageTemplateService;
import com.merry.cms.vo.AdminVo;
import com.merry.cms.vo.JsonVo;

public class BaseManageAction {
	protected final Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected AdminService adminService;
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
