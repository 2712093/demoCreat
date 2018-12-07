package com.merry.cms.manage.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.merry.cms.constant.SystemConstant;
import com.merry.cms.entity.Admin;
import com.merry.cms.vo.JsonVo;

/**
 * 
 * @author gunnyzeng
 *
 */
@Controller
@RequestMapping("/manage/admin")
public class AdminManageAction extends BaseManageAction{
	
	@RequestMapping(value="/manage.htm",method=RequestMethod.GET)
	public String manage(@RequestParam(value="page",defaultValue="1")int page,ModelMap modelMap) throws Exception{
		modelMap.put("pageVo", adminService.getAllListPage(page));
		return manageTemplateService.getAdminTemplate("manage");
	}
	
	@ResponseBody
	@RequestMapping(value="/addNew.json",method=RequestMethod.POST)
	public JsonVo<String> add(@RequestParam(value="adminName")String name,
			@RequestParam(value="password")String password){
		JsonVo<String> json = new JsonVo<String>();
		Admin admin = adminService.getAdminByName(name);
		if(admin!=null){
			json.getErrors().put("adminName", "该管理员已存在");
		}
		if(password.length()<6||password.length()>30){
			json.getErrors().put("password", "密码长度应为6-30之间");
		}
		try {
			validate(json);
			adminService.addAdmin(name, password);
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value="delete.json",method=RequestMethod.POST)
	public JsonVo<String> delete(@RequestParam(value="adminId")long adminId){
		JsonVo<String> json = new JsonVo<String>();
		try {
			adminService.deleteAdmin(adminId);
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
	
	

	
	@RequestMapping(value="/update.htm",method=RequestMethod.GET)
	public String update(@RequestParam(value="adminId")long adminId,@RequestParam(value="page",defaultValue="1")int page,ModelMap modelMap) throws Exception{
		Admin admin = adminService.getAdminById(adminId);
		modelMap.put("admin", admin);
		modelMap.put("pageVo", adminService.getAllListPage(page));
		return manageTemplateService.getAdminTemplate("update");
	}
	
	@ResponseBody
	@RequestMapping(value="update.json",method=RequestMethod.POST)
	public JsonVo<String> update(@RequestParam(value="adminId")long adminId,
			@RequestParam(value="password")String password,HttpServletRequest request){
		JsonVo<String> json = new JsonVo<String>();
		if(password.length()<6||password.length()>30){
			json.getErrors().put("password", "密码长度6-30");
		}
		try {
			validate(json);
			adminService.updateAdminByAmdinId(adminId, password);
			Admin admin = adminService.getAdminById(adminId);
			//如果修改的用户为当前用户，则清除session重新登陆
			if(admin.getName().equals(getAdmin(request).getName())){
				request.getSession().removeAttribute(SystemConstant.SESSION_ADMIN);
			}
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
}
