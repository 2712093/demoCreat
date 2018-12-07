package com.merry.cms.constant;

import com.merry.cms.util.PropertyUtils;

/**
 * 系统常量
 * 
 * @author GunnyZeng
 * 
 */
public class SystemConstant {
	//自定义标签头部
	public static String TAGHEAD1 = "merry";
	//bootstrap文件夹名称
	public static String BOOTSTRAP_PATH = "bootstrap-3.3.7";
	/**
	 * 应用部署路径的KEY
	 */
	public static String MERRY_CMS_ROOT = PropertyUtils.getRoot();

	/**
	 * Session中的管理员Key
	 */
	public static final String SESSION_ADMIN = "SESSION_ADMIN";

	/**
	 * 头像URL 180x180
	 */
	public static final String FACE_URL = "http://faceurl.shishuo.com/face";

	/**
	 * 
	 */
	public static final String LANGUAGE = "language";

}
