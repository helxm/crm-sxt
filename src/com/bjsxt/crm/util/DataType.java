package com.bjsxt.crm.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class DataType {
	/**
	 * 该方法完成的功能是转化字符串类型的数组为整形数组
	 * 
	 * @param sids
	 * @return
	 */
	public static Integer[] converterStringArray2IntegerArray(String[] sids) {
		if (sids != null && sids.length > 0) {
			Integer[] ids = new Integer[sids.length];
			for (int i = 0; i < sids.length; i++) {
				if (StringUtils.isNotBlank(sids[i])) {
					ids[i] = Integer.parseInt(sids[i]);
				}
			}
			return ids;
		}
		return null;
	}
	
	/**
	 * 时间处理为字符串
	 */
	
	public static String getCurrentTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(new Date());
	}
}
