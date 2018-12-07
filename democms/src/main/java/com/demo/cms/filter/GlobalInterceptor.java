package com.demo.cms.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.demo.cms.constant.ConfigConstant;
import com.demo.cms.constant.SystemConstant;
import com.demo.cms.service.ConfigService;
import com.demo.cms.util.HttpUtils;

@Component("globalInterceptor")
public class GlobalInterceptor implements HandlerInterceptor{
	@Autowired
	private ConfigService configService;
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
		if(null == modelAndView){
			return;
		}
		String basePath = HttpUtils.getHttpBasePath(request);
		modelAndView.addObject("BASE_PATH",basePath);
		modelAndView.addObject("UPLOAD_BASE_PATH",basePath+"/upload");
		modelAndView.addObject("BOOTSTRAP_PATH",basePath+"/static/"+SystemConstant.BOOTSTRAP_PATH);
		modelAndView.addObject("TEMPLATE_BASE_PATH",basePath+"/static/template/"+configService.getStringByKey(ConfigConstant.SHAMROCK_TEMPLATE));
		modelAndView.addObject("TEMPLATE_DRAW_PATH",basePath+"/static/template/"+configService.getStringByKey(ConfigConstant.SHAMROCK_TEMPLATE)+"/draw");
		modelAndView.addObject("TEMPLATE_MANAGE_PATH",basePath+"/static/template/manage");
		modelAndView.addObject("WEBID",configService.getIntKey("shamrock_webId"));
		modelAndView.addObject("shamrock_seo_title","抽奖");
//		modelAndView.addObject("LOGO",folderfigService.getFolderById(configService.getIntKey("shamrock_webId")).getLogo());
		modelAndView.addObject("shamrock_seo_description","描述");
		//獎品規則描述
		MDC.put("ip", HttpUtils.getIp(request));
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		return true;
	}

}
