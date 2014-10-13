package com.bjsxt.crm.util;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @author Administrator--jiangyu--2014-9-13 下午8:12:06
 * 转为json格式向后台发送时数据
 */
public class JsonUtil {
	private static Gson gson=null;
	static{
		GsonBuilder builder = new GsonBuilder();
		builder.setPrettyPrinting();
		gson = builder.create();
	}
	
	public static void write2response(Object obj,HttpServletResponse response) throws IOException{
		String json = gson.toJson(obj);
		System.out.println(json);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		
		response.getWriter().write(json);
		response.getWriter().close();
	}
}
