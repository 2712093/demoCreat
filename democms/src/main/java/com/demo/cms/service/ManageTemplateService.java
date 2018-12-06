package com.demo.cms.service;

import java.io.File;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.demo.cms.constant.SystemConstant;
import com.demo.cms.exception.TemplateNotFoundException;

@Service("manageTemplateService")
public class ManageTemplateService{
	protected final Logger logger = Logger.getLogger(this.getClass());
	public String get404(){
		return "template/manage/404";
	}
	public String get500(){
		return "template/manage/500";
	}
	/**
	 * 后台文章列表
	 * @param template
	 * @return
	 * @throws Exception
	 */
	public String getArticleTemplate(String template) throws Exception{
			if(this.isExist("article",template)){
				return this.getTemplatePath("article",template);
			}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("article",template)+" 【不存在】");
	}
	/**
	 * 后台目录模板
	 * @param template
	 * @return
	 * @throws Exception
	 */
	public String getFolderTemplate(String template) throws Exception{
		if(this.isExist("folder",template)){
			return this.getTemplatePath("folder",template);
		}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("folder",template)+" 【不存在】");
	}
	
	public String getConfigTemplate(String template) throws Exception{
		if(this.isExist("config",template)){
			return this.getTemplatePath("config",template);
		}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("config",template)+" 【不存在】");
	}
	
	/**
	 * 后台管理员模板
	 * @param template
	 * @return
	 * @throws Exception
	 */
	public String getAdminTemplate(String template) throws Exception{
		if(this.isExist("Admin", template)){
			return this.getTemplatePath("Admin", template);
		}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("Admin",template)+" 【不存在】");
	}
	/**
	 * 后台用户模板
	 * @param template
	 * @return
	 * @throws Exception
	 */
	public String getUserTemplate(String template) throws Exception{
		if(this.isExist("user", template)){
			return this.getTemplatePath("user", template);
		}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("user",template)+" 【不存在】");
	}
	/**
	 * 中奖历史模板
	 * @param template
	 * @return
	 * @throws Exception
	 */
	public String getPrizeTemplate(String template) throws Exception{
		if(this.isExist("prize", template)){
			return this.getTemplatePath("prize", template);
		}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("prize",template)+" 【不存在】");
	}
	/**
	 * 中奖历史模板
	 * @param template
	 * @return
	 * @throws Exception
	 */
	public String getPrizeHistoryTemplate(String template) throws Exception{
		if(this.isExist("prizeHistory", template)){
			return this.getTemplatePath("prizeHistory", template);
		}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("prizeHistory",template)+" 【不存在】");
	}
	/**
	 * 访问记录模板
	 * @param template
	 * @return
	 * @throws Exception
	 */
	public String getLoginLogTemplate(String template) throws Exception{
		if(this.isExist("loginLog", template)){
			return this.getTemplatePath("loginLog", template);
		}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("loginLog",template)+" 【不存在】");
	}
	/**
	 * 访问记录模板
	 * @param template
	 * @return
	 * @throws Exception
	 */
	public String getHeadlineTemplate(String template) throws Exception{
		if(this.isExist("headline", template)){
			return this.getTemplatePath("headline", template);
		}
		throw new TemplateNotFoundException("模板文件:"+this.getTemplatePath("headline",template)+" 【不存在】");
	}
	/**
	 * 模板物理地址是否存在
	 * @param theme
	 * @return
	 */
	private boolean isExist(String theme,String template) {
		String themePath = "/WEB-INF/static/template/manage/"+theme+"/"+template+".ftl";
		File file = new File(SystemConstant.DEMO_CMS_ROOT+themePath);
		if(file.exists()){
			logger.info("尝试使用模板"+themePath+"【存在】");
			return true;
		}else{
			logger.info("尝试使用模板"+themePath+"【不存在】");
			return false;
		}
		
	}
	/**
	 * 得到当前请求需要渲染的模板相对路径
	 * @param template
	 * @return
	 */
	private String getTemplatePath(String theme,String template) {
		
		return "/template/manage/"+theme+"/"+template;
	}
}
