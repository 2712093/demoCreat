package com.merry.cms.service;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

import org.apache.commons.httpclient.HttpException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.merry.cms.util.SendUtils;
import com.merry.cms.util.Sha1;
import com.merry.cms.util.WechatUtils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Service("wxService")
public class WxService {
	@Autowired
    private JedisPool jedisPool;//注入JedisPool
	
	public String wxAccessToken(Map<String, String> map) throws HttpException, IOException {
		Jedis jedis = jedisPool.getResource();
		String cacheAccess_token = jedis.get("access_token");
		if (null == cacheAccess_token) {
			// 获取cacheAccess_token
						// 这段代码实际开发过程中要写成一个方法，我这里为了演示方便写在了一起。
			String resultMsg = WechatUtils.getAccessToken(map);
			JSONObject json = JSON.parseObject(resultMsg);
			cacheAccess_token = json.getString("access_token");
			jedis.set("access_token", cacheAccess_token, "NX", "EX", 7200);// 单位是秒
		}
		return cacheAccess_token;
	}
	
	
	public Map<String, String> weixinjsIntefaceSign(Map<String, String> map) throws HttpException, IOException {
		Jedis jedis = jedisPool.getResource();
		// 查看缓存数据是否存在
		String cacheAccess_token = jedis.get("access_token");
		String cacheTicket = jedis.get("ticket");
		// 取出来为空的话则说明cacheAccess_token缓存过期，重新获取
		if (null == cacheAccess_token) {
			cacheAccess_token = wxAccessToken(map);
		}
		// 取出来为空的话则说明cacheTicket缓存过期，重新获取
		if (null == cacheTicket) {
			////////////////////////// start
			//// 获得jsapi_ticket
			StringBuffer buffer = new StringBuffer();
			buffer.append("https://api.weixin.qq.com/cgi-bin/ticket/getticket?");
			buffer.append("access_token=" + cacheAccess_token);
			buffer.append("&type=jsapi");
			String ticket = SendUtils.sendGet(buffer.toString(), "UTF-8");
			///////////////////// end
			JSONObject json = JSON.parseObject(ticket);
			cacheTicket = json.getString("ticket");
			jedis.set("ticket", cacheTicket, "NX", "EX", 7200);// 单位是秒
		}
		// 生成签名
		SortedMap<Object, Object> params = new TreeMap<Object, Object>();
		params.put("timestamp", Long.toString(new Date().getTime() / 1000));
		params.put("noncestr", this.CreateNoncestr());
		params.put("jsapi_ticket", cacheTicket);
		params.put("url", map.get("url"));// url地址
		StringBuffer sb = new StringBuffer();
		Set es = params.entrySet();
		Iterator it = es.iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			String k = (String) entry.getKey();
			Object v = entry.getValue();
			sb.append(k + "=" + v + "&");
		}
		String signStr = sb.toString().substring(0, sb.toString().length() - 1);
		String sign = Sha1.getSha1Sign(signStr);// 签名
		Map<String, String> result = new HashMap<String, String>();
		result.put("timestamp", (String) params.get("timestamp"));
		result.put("noncestr", (String) params.get("noncestr"));
		result.put("signature", sign);
		result.put("appId", map.get("appid"));
		return result;

	}

	private String CreateNoncestr() {
		String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String res = "";
		for (int i = 0; i < 16; i++) {
			Random rd = new Random();
			res += chars.charAt(rd.nextInt(chars.length() - 1));
		}
		return res;
	}
}
