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

<title>My JSP 'userlist.jsp' starting page</title>
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url:'employeeAction!findAll',
		dataType:'json',
		success:function(list){
			console.info(list);
			$.each(list, function(i,n){
				console.info(n[0]);
				console.info(n[1]);
				$("#eid").append(new Option(n[1],n[0]));
			});
		}
	});
});
$(document).ready(function(){
	var search=document.getElementById("xs").value;
	
});
</script>
<style type="text/css">
</style>
</head>

<body>
	<div class="border">
 		<h1><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;创建服务</h1>
 	</div>
	<form action="serviceAction!addMyService" method="post"
		onsubmit="return checkForm();" style="">
		服务标题： <input name="myService.title" /><br>
		服务类型： <input name="myService.type" /> <br>
		<input type="hidden" name="myService.status" value="1"><br>

		姓名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="eid" id="eid">
				<option>----请选择----</option>
			</select><br>
		<br>
		<input type="submit" value="提交创建">
	</form>
	<hr>
	<div class="border">
 		<h1><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;已创建服务列表</h1>
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
