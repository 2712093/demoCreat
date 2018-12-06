package com.demo.cms.vo;

import com.demo.cms.entity.Admin;

public class AdminVo extends Admin{
	private boolean isAdmin;
	public boolean getIsAdmin(){
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin){
		this.isAdmin = isAdmin;
	}
}
