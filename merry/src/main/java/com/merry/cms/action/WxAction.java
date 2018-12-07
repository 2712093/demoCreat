package com.merry.cms.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.merry.cms.entity.MobilePhone;
import com.merry.cms.service.MobilePhoneService;
import com.merry.cms.service.WxService;
import com.merry.cms.util.PropertyUtils;
import com.merry.cms.util.WechatUtils;
import com.merry.cms.util.WechatUtils.Token;
import com.merry.cms.util.WechatUtils.UserInfo;

@Controller
@RequestMapping("/wx")
public class WxAction {
	protected final Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private WxService wxService;
	@Autowired
	private MobilePhoneService mobilePhoneService;
	
	
	/**
	 * 用户授权并获取code
	 * @return
	 */
	@RequestMapping("/authorize")
	@ResponseBody
	public String authorize(String appId) {
		//完整域名地址
		String url  = PropertyUtils.getValue("merry.HTTP")+"/wx/getUserCode.htm";
		return WechatUtils.buildAuthorizeUrl(PropertyUtils.getValue("merry.APPID"),url,true);
	}
	@RequestMapping("getOpenid")
    public String getOpenId(@RequestParam("rurl") String rurl) {
        String url = WechatUtils.buildAuthorizeUrl(PropertyUtils.getValue("merry.APPID"), PropertyUtils.getValue("merry.HTTP")+"/wx/getUserCode.htm?rurl="+rurl);
        logger.info("redirect url-> {}");
        return "redirect:"+url;
    }
	//微信用户授权回调函数 
	@RequestMapping("/getUserCode.htm")
	public String userCode(String code, String rurl,HttpServletRequest request, HttpServletResponse response) {
		
		logger.debug(JSON.toJSONString(request.getParameterMap()));
		//用code换取access_token   
		//APPID   公众号id
		//SECRET  公众号秘钥
		Token token = WechatUtils.getToken(PropertyUtils.getValue("merry.APPID"),PropertyUtils.getValue("merry.SECRET"),code);
		//获取用户信息   暂时没有手机号 ，需要打印微信返回用户对象看看有没有手机号，以及手机号对应的字段
		UserInfo userInfo = WechatUtils.getUserInfo(token.getAccessToken(),token.getOpendid());
		//确定手机号码后，这里赋值
		String mobilePhone = "11111"; //userInfo.getxxxx();
		
		//验证是否北京号码
		List<MobilePhone> listPhone = mobilePhoneService.getPhoneByPhone(mobilePhone);
		if(listPhone==null || listPhone.size()<=0) {
			mobilePhone = "00";
		}
		
		//用户信息获取完成后转向到抽奖页面
		return "redirect:/draw/come.htm?mobilePhone="+mobilePhone;
	}

	//微信分享代码  
	@RequestMapping("/cover.json")
	@ResponseBody
	public Map<String, String> identifyCover(String url,HttpServletRequest request, HttpServletResponse response) {
		
		
		// 例如我们有一个分享的链接为：http://test.weixinfwenx.cn/project/fenxiang.do?id=1&name=2;
		// 那么domainAddr = http://test.weixinfwenx.cn,这个可以动态的配置在项目里，方便测试环境和生产
		// 域名的切换
		String domainAddr = PropertyUtils.getValue("merry.HTTP");// 项目中配置的网站的域名
		// 这个取的是链接上的参数，例如在上面的这个链接中，id=1&name=2就是我们要动态去的参数，可能有人
		// 会想到，这个两个参数直接写在地址中不是挺简单的为啥还要动态去获取这个参数呢；在这里我们引出了一
		// 个微信二次分享的问题，就是别人转发的链接给你，然后你再转发给别人，在你转发给别人后这个链接的签
		// 名就会失败，为啥呢，因为经过再次转发的链接，微信会自动加上一些自己的参数，这样会导致页面上微信
		// 分享的链接和签名的链接不一致。直接导致自定义的标题和链接描述，显示失败，失败原因是微信默认的在
		// 我们的分享链接上加上了&from=singlemessage。
		String str = request.getQueryString();
		Map<String, String> map = WechatUtils.putWeixinKey();
//		String url = domainAddr + "/draw/come.htm?" + str;
		map.put("url", url);
		// 这个地址是传给页面使用
//		request.setAttribute("fenxurl", url);
		try {
			// 开始微信分享链接签名
			Map<String, String> params = wxService.weixinjsIntefaceSign(map);
			return params;
//			request.setAttribute("params", params);
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
