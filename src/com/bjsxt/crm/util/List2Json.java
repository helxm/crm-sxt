package com.bjsxt.crm.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.google.gson.Gson;

public class List2Json {
	public static InputStream json2Stream(Object list) throws UnsupportedEncodingException{
		Gson gson = new Gson();
		
		String str = gson.toJson(list);
		//在将数据传输到前台之前就把数据转为utf-8的编码格式
		System.out.println(str);
		return new ByteArrayInputStream(str.getBytes("utf-8"));
	}
}
