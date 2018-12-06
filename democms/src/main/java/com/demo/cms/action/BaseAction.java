package com.demo.cms.action;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.demo.cms.service.ConfigService;

public class BaseAction {
	protected final Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	protected ConfigService configService;
}
