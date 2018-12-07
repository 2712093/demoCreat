package com.merry.cms.vo;

import com.merry.cms.entity.Admin;

public class AdminVo extends Admin{
	private boolean isAdmin;
	public boolean getIsAdmin(){
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin){
		this.isAdmin = isAdmin;
	}
}
