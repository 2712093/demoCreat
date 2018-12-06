package com.demo.cms.manage.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.cms.entity.Prize;
import com.demo.cms.service.PrizeService;
import com.demo.cms.vo.JsonVo;

@Controller
@RequestMapping("/manage/prize")
public class PrizeManageAction extends BaseManageAction{
	@Autowired
	private PrizeService prizeService;
	@RequestMapping(value = "/list.htm")
	public String manage(@RequestParam(value = "page", defaultValue = "1") int page,
			HttpServletRequest request,ModelMap modelMap) throws Exception {
		
		modelMap.put("pageVo", prizeService.getAllListPage(page));
		return manageTemplateService.getPrizeTemplate("list");
	}
	@ResponseBody
	@RequestMapping(value="/addPrize.json",method=RequestMethod.POST)
	public JsonVo<String> addPrize(Prize prize){
		JsonVo<String> json = new JsonVo<String>();
		try {
			prizeService.addPrize(prize);
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
	@RequestMapping(value = "/update.htm")
	public String update(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "prizeId") Long prizeId,
			HttpServletRequest request,ModelMap modelMap) throws Exception {
		
		modelMap.put("prize", prizeService.getPrizeById(prizeId));
		modelMap.put("pageVo", prizeService.getAllListPage(page));
		return manageTemplateService.getPrizeTemplate("update");
	}
	@ResponseBody
	@RequestMapping(value="/updatePrize.json",method=RequestMethod.POST)
	public JsonVo<String> updatePrize(Prize prize){
		JsonVo<String> json = new JsonVo<String>();
		try {
			prizeService.updatePrize(prize);
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
	@ResponseBody
	@RequestMapping(value="/delete.json",method=RequestMethod.POST)
	public JsonVo<String> delete(@RequestParam(value="prizeId")long prizeId){
		JsonVo<String> json = new JsonVo<String>();
		try {
			prizeService.deletePrize(prizeId);
			json.setResult(true);
		} catch (Exception e) {
			json.setResult(false);
			json.setMsg(e.getMessage());
		}
		return json;
	}
}
