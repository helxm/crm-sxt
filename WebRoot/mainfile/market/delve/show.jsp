<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>show.jsp</title>
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  </head>
  
  <body>
    <div class="border">
    	<h3><img src="mainfile/customer/images/menu/zxyh.png" border="0">计划内容</h3>
    </div>
    <br/>
    <div class="border" style="height: 100px;width: 400px">
    	<font color="#1E90FF">
    		&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="development.content"/>
    	</font>
    </div>
  </body>
</html>
