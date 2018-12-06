package com.demo.cms.vo.http.wechat;

public class AlipayResultVo<T> {
	private AlipayUserInfoVo alipayUserInfo;
	private AlipayFanInfoVo fanInfo;
	public AlipayUserInfoVo getAlipayUserInfo() {
		return alipayUserInfo;
	}
	public void setAlipayUserInfo(AlipayUserInfoVo alipayUserInfo) {
		this.alipayUserInfo = alipayUserInfo;
	}
	public AlipayFanInfoVo getFanInfo() {
		return fanInfo;
	}
	public void setFanInfo(AlipayFanInfoVo fanInfo) {
		this.fanInfo = fanInfo;
	}
	
	
}
