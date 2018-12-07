package com.merry.cms.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String FORMAT_YYYYMMDD = "yyyy-MM-dd";
	
	public static String FORMAT_ALL = "yyyy-MM-dd HH:mm:ss";
	
	public static String date_to_string(Date date,String format){
		SimpleDateFormat df=new SimpleDateFormat(format);
		return df.format(date);
	}
	
	public static String stampToDateToString(String s){
        String res;
        long lt = new Long(s);
        Date date = new Date(lt);
        res = date_to_string(date,FORMAT_ALL);
        return res;
    }
}