package com.demo.cms.util;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class SendUtils {
	public static String sendGet(String url,String charset) throws HttpException, IOException{
		//新建客户端
		HttpClient httpclient = new HttpClient();
		GetMethod getMethod = new GetMethod(url);
		httpclient.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET, charset);
		httpclient.executeMethod(getMethod);
		String responseMsg = getMethod.getResponseBodyAsString();
		return responseMsg;	
  }
}
