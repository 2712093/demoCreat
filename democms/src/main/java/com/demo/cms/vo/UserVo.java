package com.demo.cms.vo;

import com.demo.cms.entity.User;

public class UserVo extends User{
	private boolean isUser;

	public boolean getIsUser() {
		return isUser;
	}

	public void setIsUser(boolean isUser) {
		this.isUser = isUser;
	}
	
}
