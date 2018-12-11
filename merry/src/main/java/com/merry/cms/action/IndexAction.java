package com.merry.cms.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.merry.cms.service.PrizeHistoryService;

@Controller
public class IndexAction extends BaseAction{
	@Autowired
	private PrizeHistoryService prizeHistoryService;
	/**
	 * 默认首页
	 * @param pages
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String defaultRequest(
			@RequestParam(value="pages",defaultValue="1")int pages,
			ModelMap modelMap
			){
//		return home(pages,modelMap);
		return "template/user/draw/draw";
	}
	/**
	 * 首页
	 * @param pages
	 * @param modelMap
	 * @return
	 * @throws FolderNotFoundException 
	 */
	@RequestMapping(value="/index.htm",method=RequestMethod.GET)
	public String home(@RequestParam(value="pages",defaultValue="1")int pages,ModelMap modelMap){
		try {
				
			return "template/user/draw/draw";
		} catch (Exception e) {
			logger.fatal(e.getMessage());
			return "template/manage/404";
//			return "template/user/draw/draw";
		}
	}
	
	
	
	/**
	 * 404页面
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/404.htm",method=RequestMethod.GET)
	public String pageNotFound(@RequestParam(value="pages",defaultValue="1")int pages,ModelMap modelMap){
		modelMap.addAttribute("pages",pages);
		modelMap.addAttribute("g_folderId",0);
		return "template/manage/404";
//		return "template/user/draw/draw";
	}
	/**
	 * 500页面
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value="/500.htm",method=RequestMethod.GET)
	public String serverError(@RequestParam(value="pages",defaultValue="1")int pages,ModelMap modelMap){
		modelMap.addAttribute("pages",pages);
		modelMap.addAttribute("g_folderId",0);
		return "template/manage/500";
//		return "template/user/draw/draw";
	}
//	@ResponseBody
//	@RequestMapping(value="/getUserInfo.json",method=RequestMethod.POST)
//	public ResponseVo getUserDrawInfo(@RequestParam(value = "begintime",  defaultValue = "") String begintime,
//			@RequestParam(value = "endtime", defaultValue = "") String endtime){
//		ResponseVo vo = new ResponseVo();
//		try {
//			vo.setCode(0);
//			String startTime = null;
//			String et = null;
//			if(!StringUtils.isBlank(begintime)) {
//				startTime = DateUtil.stampToDateToString(begintime);
//			}
//			if(!StringUtils.isBlank(endtime)) {
//				et = DateUtil.stampToDateToString(endtime);
//			}
//			List<PrizeHistoryVo> voList = prizeHistoryService.getListByTime(startTime, et);
//			if(voList!=null && voList.size()>0) {
//				List<ResponseDataVo> list = new ArrayList<ResponseDataVo>();
//				for(PrizeHistoryVo v : voList) {
//					ResponseDataVo data = new ResponseDataVo();
//					data.setAreaid(v.getId());
//					data.setPhone(v.getMobilePhone());
//					data.setTime(DateUtil.date_to_string(v.getHistoryTime(), DateUtil.FORMAT_ALL));
//					data.setType(v.getType());
//					list.add(data);
//				}
//				vo.setData(list);
//			}
//			
//		}catch(Exception e) {
//			vo.setCode(1);
//			vo.setMsg("接口异常，请与管理员联系！");
//		}
//		return vo;
//	}
}
