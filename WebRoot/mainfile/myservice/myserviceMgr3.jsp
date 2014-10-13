<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'myserviceMgr.jsp' starting page</title>
<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
</head>

<body>
<div class="mtitle">
	<div class="border">
 		<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;服务列表</h3>
 	</div>
 	<br/>
 	<div>
 	
 	</div>
<div class="border">
	<table width="80%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 100px">
		<TR>
			<Td class="listViewThS1">服务编号</Td>
			<Td class="listViewThS1">服务标题</Td>
			<Td class="listViewThS1">服务类型</Td>
			<Td class="listViewThS1">服务详情</Td>
		</TR>

		<s:iterator value="myServices" var="item">
			<TR>
				<TD><s:property value="#item.id"></s:property></TD>
				<TD><s:property value="#item.title"></s:property></TD>
				<TD><s:property value="#item.type"></s:property></TD>
				<TD><a href="serviceAction!findById?id=<s:property value="#item.id"></s:property>">
					<font color="blue">查看服务详情</font></a>
				</TD>
			</TR>
		</s:iterator>
	</table>

	</div>
</body>
</html>
