package com.merry.cms.vo.http;

import java.util.List;

public class ResponseVo {
	private int code;
	private String msg;
	private List<ResponseDataVo> data;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public List<ResponseDataVo> getData() {
		return data;
	}
	public void setData(List<ResponseDataVo> data) {
		this.data = data;
	}
	
}
