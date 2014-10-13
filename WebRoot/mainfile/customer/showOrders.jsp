<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>showOrders.jsp</title>
	<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  </head>
  
  <body>
  	<div class="border">
  		<img alt="" src="mainfile/customer/images/order.jpg" height="30%" style="margin-left: 50px">
  		<img alt="" src="mainfile/customer/images/order.jpg" height="30%">
  		<img alt="" src="mainfile/customer/images/order.jpg" height="30%">
  		<img alt="" src="mainfile/customer/images/order.jpg" height="30%">
  	</div>
    <div class="border">
    <table border="1" align="center" cellspacing="0" cellpadding="0"  id="PowerTable" class="PowerTable" >
    	<tr>
    		<td td width="20%" class="listViewThS1">订单编号</td>
    		<td td width="20%" class="listViewThS1">交易额度</td>
    		<td td width="20%" class="listViewThS1">未付金额</td>
    		<td td width="20%" class="listViewThS1">交易日期</td>
    		<td td width="20%" class="listViewThS1">订单状态</td>
    	</tr>
    	<s:iterator value="customer.orders" var="item">
    		<tr>
    			<td><s:property value="#item.num"/></td>
    			<td><s:property value="#item.order_money"/></td>
    			<td><s:property value="#item.unpay_money"/></td>
    			<td><s:property value="#item.time"/></td>
    			<td><s:property value="#item.status"/></td>
    		</tr>
    	</s:iterator>
    </table>
    </div>
  </body>
</html>
