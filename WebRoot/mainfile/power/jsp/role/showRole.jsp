<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>showRole.jsp</title>
    
  <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
 </head>
  
  <body>
  	<div class="mtitle-row">&nbsp;</div>
			<h3><img src="mainfile/customer/images/menu/h6.png" border="0"><font size="3">系统权限管理</font></h3>
		</div>
		<div>
			<br/>
		</div>
		<hr color="green"/>
		<div class="border">
			<div class="border">
				<h3><img src="mainfile/customer/images/menu/zxyh.png" border="0"><font size="3">选择操作</font></h3>
			</div>
			<div class="border">
				&nbsp;&nbsp;&nbsp;&nbsp;<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
				<a href="userAction!homePage?admin=admin"><font color="blue">返回主页</font></a>
			</div>
	<table width="80%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 80px;margin-top: 80px;margin-bottom: 40px" >
		<tr>
			<td width="8%" class="listViewThS1" >角色名称</td>
			<td width="8%" class="listViewThS1" >角色描述</td>
			<td width="8%" class="listViewThS1" >角色优先级</td>
			<td width="8%" class="listViewThS1" >角色状态</td>
			<td width="8%" class="listViewThS1" >操&nbsp;&nbsp;&nbsp;&nbsp;作</td>
		</tr>
		<s:iterator value="findAllList"  var="item" >
			<tr>
				<td><s:property value="#item.name" /></td>
				<td><s:property value="#item.des" /></td>
				<td><s:property value="#item.priority" /></td>
				<td><s:property value="#item.state" /></td>
				<td>
					<a href="menuAction!findMenu?roleId=<s:property value="#item.id" />" ><font color="green">菜单授权</font></a>
				</td>
			</tr>
		</s:iterator>
	</table>
	</div>
  </body>
</html>
