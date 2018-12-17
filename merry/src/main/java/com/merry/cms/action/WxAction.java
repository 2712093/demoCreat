package com.merry.cms.action;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.merry.cms.entity.MobilePhone;
import com.merry.cms.service.MobilePhoneService;
import com.merry.cms.util.PropertyUtils;
import com.merry.cms.util.WechatUtils;
import com.merry.cms.vo.JsSignature;

@Controller
@RequestMapping("/wx")
public class WxAction {
	protected final Logger logger = Logger.getLogger(this.getClass());
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
	@RequestMapping("getCode")
    public void getOpenId(HttpServletResponse response) throws IOException {
        String url = WechatUtils.buildAuthorizeUrl(PropertyUtils.getValue("merry.APPID"), PropertyUtils.getValue("merry.HTTP")+"/wx/getUserCode.htm");
        logger.info("redirect url-> "+url);
        response.sendRedirect(url.toString());
    }
	//微信用户授权回调函数 
	@RequestMapping("/getUserCode.htm")
	public String userCode(String code,HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		logger.debug("微信用户授权回调函数<wx/getUserCode.htm>");
		logger.debug(JSON.toJSONString(request.getParameterMap()));
		
		String mobilePhone = null;
		String nickname = null;
		//获取用户信息
		String info = WechatUtils.getFwUserInfo(PropertyUtils.getValue("merry.accountid"),code);
		JSONObject demoJson =  JSON.parseObject(info);
		String status =demoJson.getString("status");
		logger.debug("status="+status);
		//未关注
        if("3001".equals(status)) {
        	response.sendRedirect(PropertyUtils.getValue("merry.HTTP")+"/draw/ewm.htm");
        	return null;
        }else if("0000".equals(status)){
        	//确定手机号码后，这里赋值
			mobilePhone = demoJson.getString("telNum");
			nickname = demoJson.getString("nickName");
			//验证是否北京号码
			List<MobilePhone> listPhone = mobilePhoneService.getPhoneByPhone(mobilePhone);
			if(listPhone==null || listPhone.size()<=0) {
				mobilePhone = "00";
			}
        }
		//用户信息获取完成后转向到抽奖页面
        response.sendRedirect(PropertyUtils.getValue("merry.HTTP")+"/draw/come.htm?mobilePhone="+mobilePhone + "&status="+status+"&nickname="+URLEncoder.encode(nickname,"UTF-8"));
        return null;
	}

	//微信分享代码  
	@RequestMapping("/cover.json")
	@ResponseBody
	public JsSignature identifyCover(HttpServletRequest request, HttpServletResponse response) {
		RestTemplate restTemplate = new RestTemplate();
		//分享
        String appIp = PropertyUtils.getValue("merry.APPID");
        String jsSignatureUrl = PropertyUtils.getValue("merry.jsSignatureUrl");
       
        String str = request.getQueryString();
        String shareurl = PropertyUtils.getValue("merry.HTTP") + "/draw/come.htm?"+ str;;
        
        String shareResult = restTemplate.getForObject(String.format("%s?url=%s&accountId=%s", jsSignatureUrl, shareurl, PropertyUtils.getValue("merry.accountid")), String.class);
        JsSignature jsSignature = JSON.parseObject(shareResult, new TypeReference<JsSignature>() {
        });
        jsSignature.setAppId(appIp);
        jsSignature.setLink(shareurl);
		/*
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
		*/
		return jsSignature;
	}
	
}
