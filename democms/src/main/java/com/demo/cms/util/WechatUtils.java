package com.demo.cms.util;


import org.apache.commons.httpclient.HttpException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.demo.cms.exception.PassportException;

import weibo4j.http.HttpClient;
import weibo4j.http.Response;
import weibo4j.org.json.JSONException;
import weibo4j.org.json.JSONObject;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class WechatUtils {
    private static Logger logger = LoggerFactory.getLogger(WechatUtils.class);

    public static String buildAuthorizeUrl(String appId, String redirectUrl) {
        return buildAuthorizeUrl(appId, redirectUrl, true);
    }
    
    public static Map<String, String> putWeixinKey(){
    	// 微信分享授权开始
		String appId = PropertyUtils.getValue("demo.APPID");// 取项目中配置的公众号id
		String secret = PropertyUtils.getValue("demo.SECRET");// 取项目中配置的公众号密钥
		Map<String, String> map = new HashMap<String, String>();
		map.put("appid", appId);
		map.put("secret", secret);
		return map;
    }
    public static String getAccessToken(Map<String, String> map) throws HttpException, IOException {
    	StringBuffer buffer = new StringBuffer();
		buffer.append("https://api.weixin.qq.com/cgi-bin/token?");
		buffer.append("appid=" + map.get("appid"));
		buffer.append("&secret=" + map.get("secret"));
		buffer.append("&grant_type=client_credential");
		String resultMsg = SendUtils.sendGet(buffer.toString(), "UTF-8");
		return resultMsg;
    }
    // 公众号使用scope=snsapi_base和snsapi_userinfo
    // 开放平台的则使用scope=snsapi_login
    public static String buildAuthorizeUrl(String appId, String redirectUrl, boolean onlyOpenId){
        String scope = "snsapi_base";
        if (!onlyOpenId) {
            scope = "snsapi_userinfo";
        }
        try {
            return "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
                    + appId.trim() + "&redirect_uri=" + URLEncoder.encode(redirectUrl.trim(),"UTF-8") +
                    "&response_type=code&scope=" + scope + "&state=STATE#wechat_redirect";
        } catch (UnsupportedEncodingException e) {
            throw new PassportException(e);
        }
    }
	/**
	 * 
	 * @param appKey （公众号唯一标识）
	 * @param secretKey （公众号的appsecret）
	 * @param code 获取用户授权的code
	 * @return
	 */
    public static Token getToken(String appKey, String secretKey, String code){
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="
                + appKey + "&secret=" + secretKey + "&code=" + code + "&grant_type=authorization_code";
        HttpClient httpClient = new HttpClient();
        try {
            Response response = httpClient.get(url, "code");
            logger.debug(response.asString());
            Token token = new Token();
            Object openid = response.asJSONObject().get("openid");
            Object accessToken = response.asJSONObject().get("access_token");
            if (null != openid && null != accessToken) {
                token.setOpendid(openid.toString());
                token.setAccessToken(accessToken.toString());
                return token;
            } else {
                return null;
            }
        } catch (Exception e) {
            throw new PassportException(e);
        }
    }

    public static UserInfo getUserInfo(String accessToken, String openId) {
        String url = "https://api.weixin.qq.com/sns/userinfo?access_token=" +
                accessToken + "&openid=" + openId + "&lang=zh_CN";
        HttpClient httpClient = new HttpClient();
        try {
            Response response = httpClient.get(url, "code");
            logger.debug(response.asString());
            return parseUserInfo(response.asJSONObject());
        } catch (Exception e) {
            throw new PassportException(e);
        }

    }
 

    private static UserInfo parseUserInfo(JSONObject obj) {
        try {
            String errcode = obj.getString("errcode");
            if (null != errcode && errcode.length() > 0) return null;


            String openId = obj.getString("openid");
            String nickName = parseStrValue(obj.getString("nickname"));
            int sex = obj.getInt("sex");
            String language = changeEncoding(obj.getString("language"));
            String city = changeEncoding(obj.getString("city"));
            String province = changeEncoding(obj.getString("province"));
            String country = changeEncoding(obj.getString("country"));
            String headImgUrl = obj.getString("headimgurl");
            UserInfo info = new UserInfo(openId, nickName, sex, language, city, province, country, headImgUrl);
            return info;
        } catch (JSONException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    private static String changeEncoding(String str) {
        try {
            return new String(str.getBytes("iso-8859-1"), "utf-8");
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
            return str;
        }
    }

    private static String parseStrValue(String str) {
        if (null == str || str.length() == 0) return "";
        try {
            str = new String(str.getBytes("iso-8859-1"), "utf-8");
            byte[] b_text = str.getBytes();
            for (int i = 0; i < b_text.length; i++) {
                if ((b_text[i] & 0xF8) == 0xF0) {
                    for (int j = 0; j < 4; j++) {
                        b_text[i + j] = 0x30;
                    }
                    i += 3;
                }
            }
            str = new String(b_text);
            str = str.replaceAll("0", "");
        } catch (UnsupportedEncodingException ex) {
            ex.printStackTrace();
        }
        return str;
    }

    public static class Token {
        private String opendid;//用户唯一标识，请注意，在未关注公众号时，用户访问公众号的网页，也会产生一个用户和公众号唯一的OpenID
        private String accessToken;//	网页授权接口调用凭证,注意：此access_token与基础支持的access_token不同

        public boolean check() {
            return (null != opendid && opendid.length() > 0) && (null != accessToken && accessToken.length() > 0);
        }

        public String getOpendid() {
            return opendid;
        }

        public void setOpendid(String opendid) {
            this.opendid = opendid;
        }

        public String getAccessToken() {
            return accessToken;
        }

        public void setAccessToken(String accessToken) {
            this.accessToken = accessToken;
        }
    }

    public static class UserInfo {
        private String openId;
        private String nickName;
        private int sex;
        private String language;
        private String city;
        private String province;
        private String country;
        private String headImgUrl;

        public UserInfo() {}

        public UserInfo(String openId, String nickName, int sex, String language, String city, String province, String country, String headImgUrl) {
            this.openId = openId;
            this.nickName = nickName;
            this.sex = sex;
            this.language = language;
            this.city = city;
            this.province = province;
            this.country = country;
            this.headImgUrl = headImgUrl;
        }

        @Override
        public String toString() {
            return "UserInfo{" +
                    "openId='" + openId + '\'' +
                    ", nickName='" + nickName + '\'' +
                    ", sex=" + sex +
                    ", language='" + language + '\'' +
                    ", city='" + city + '\'' +
                    ", province='" + province + '\'' +
                    ", country='" + country + '\'' +
                    ", headImgUrl='" + headImgUrl + '\'' +
                    '}';
        }

        public String getOpenId() {
            return openId;
        }

        public void setOpenId(String openId) {
            this.openId = openId;
        }

        public String getNickName() {
            return nickName;
        }

        public void setNickName(String nickName) {
            this.nickName = nickName;
        }

        public int getSex() {
            return sex;
        }

        public void setSex(int sex) {
            this.sex = sex;
        }

        public String getLanguage() {
            return language;
        }

        public void setLanguage(String language) {
            this.language = language;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getProvince() {
            return province;
        }

        public void setProvince(String province) {
            this.province = province;
        }

        public String getCountry() {
            return country;
        }

        public void setCountry(String country) {
            this.country = country;
        }

        public String getHeadImgUrl() {
            return headImgUrl;
        }

        public void setHeadImgUrl(String headImgUrl) {
            this.headImgUrl = headImgUrl;
        }
    }
}
