package com.kaishengit.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	
	public static String getTime(String createtime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date time = new Date();
		Date now = new Date(); 
		try {
			time = sdf.parse(createtime);
			now = sdf.parse(DateUtil.getNow());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long minute = (now.getTime() - time.getTime())/(1000*60);
		String str = null;
		if(minute < 1) {
			str = "刚刚";
		} else if(minute >=1 && minute < 60) {
			str = minute + "分钟";
		} else if(minute >=60 && minute < 60*24) {
			str = minute/60 + "小时";
		} else if(minute >=60*24 && minute < 60*24*30) {
			str = minute/(60*24) + "天 ";
		}
		return str;
	}

	
}
