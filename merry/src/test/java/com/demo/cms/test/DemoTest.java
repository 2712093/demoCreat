package com.demo.cms.test;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import com.demo.cms.constant.WxConstant;
import com.demo.cms.exception.PassportException;
import com.demo.cms.util.WechatUtils;

import weibo4j.http.HttpClient;
import weibo4j.http.Response;

public class DemoTest {
	public static void main1(String[] args){
		String a = WechatUtils.buildAuthorizeUrl("wx2e7288fdd5f458b7", "http%3A%2F%2Fwx.10085.cn%2Fmessage-alipay%2F");
		 HttpClient httpClient = new HttpClient();
	        try {
	            Response response = httpClient.get(a, "code");
	            
	            System.out.println(response.asJSONObject());
	        } catch (Exception e) {
	            throw new PassportException(e);
	        }
		
	}
	public static void main(String[] args) throws UnsupportedEncodingException{
		String url  = "http%3A%2F%2Fwx.10086.cn%2Fbeijing%2Fglobal%2Fluckywechatv22%2Fapi%2Fremote%2Fcode%3Frurl%3D%2F%3Fflag%3D1543977231635";
		String httpUrl = WechatUtils.buildAuthorizeUrl(WxConstant.APPID,URLDecoder.decode(url.trim(),"UTF-8"),true);
		System.out.println(URLDecoder.decode(url.trim()));
	}
}
