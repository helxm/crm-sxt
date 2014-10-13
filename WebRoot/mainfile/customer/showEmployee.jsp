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
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <title>showEmployee.jsp</title>

  </head>
  
  <body>
    <script type="text/javascript">
  			//单击"选择输入"按钮后，会将对应的值显示在父窗口文本框中
  			function selectInput(inputElement){
  				//取得用户名
  				var username = inputElement.parentNode.nextSibling.nextSibling.firstChild.nodeValue;
  				//取得传过来的父窗口
  				var fatherWindow = window.dialogArguments;
  				//将用户名显示在父窗口中
  				fatherWindow.document.getElementById("employee").value=username;
  			}
  	</script>
  	<div>
  		<table width="100%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable">
  			<tr>
				<td class="listViewThS1">操作</td>
				<td class="listViewThS1">id</td>
				<td class="listViewThS1">用户名</td>
			</tr>
			<s:iterator value="emps" var="emp">
				<tr>
					<td><input type="button" value="选择输入" onclick="selectInput(this);" /></td>
					<td><s:property value="#emp.id"/></td>
					<td><s:property value="#emp.name"/></td>
				</tr>
			</s:iterator>
  		</table>
  	</div>
  	
  </body>
</html>
