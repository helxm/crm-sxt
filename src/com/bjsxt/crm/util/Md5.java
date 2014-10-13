package com.bjsxt.crm.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5 {
	public static String getMD5(String str) {
        String reStr = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");//创建具有指定算法名称的信息摘要
            md.update(str.getBytes());//使用指定的字节更新摘要。
            byte ss[] = md.digest();//通过执行诸如填充之类的最终操作完成哈希计算
            reStr = bytes2String(ss);
        } catch (NoSuchAlgorithmException e) {
        	System.out.println("没有这样的算法!!!");
        }
        return reStr;

	}
	  private static String bytes2String(byte[] aa) {//将字节数组转换为字符串
	        String hash = "";
	        for (int i = 0; i < aa.length; i++) {//循环数组
	            int temp;
	            if (aa[i] < 0)		//如果小于零，将其变为正数
	                temp = 256 + aa[i];
	            else
	                temp = aa[i];
	            if (temp < 16)
	                hash += "0";
	            hash += Integer.toString(temp, 16);//转换为16进制
	        }
	        hash = hash.toUpperCase();//全部转换为大写
	        return hash;
	    }
	  public static void main(String[] args) {
		  String md5 = getMD5("nihaohaoo");
		  System.out.println(md5);
	}
}
