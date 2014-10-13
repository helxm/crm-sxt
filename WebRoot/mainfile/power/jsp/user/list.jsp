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
    
    <title>list.jsp</title>
	<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script><%--
    
		<style type="text/css">
		.red{
		color: red;
		}
		.gre{
		color: #00ff00;
		}
	table.imagetable {
	font-family: verdana,arial,sans-serif;
	font-size:20px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.imagetable th {
	background:#b5cfd2 url('mainfile/power/user/image/cell-blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable td {
	background:#dcddc0 url('mainfile/power/user/image/cell-grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
	</style>
	--%><script type="text/javascript">
			function uptdateRole(userId){
			document.ff.action='roleAction!findAddDelList?userId='+userId;
			document.ff.submit();
			return true;
			}
			function uptdatePwd(Id,pwd){
			document.ff.action='mainfile/power/jsp/user/update.jsp?id='+Id+"&pwd="+pwd;
			document.ff.submit();
			return true;
			}
			function adduser(){
			document.ff.action='mainfile/power/jsp/user/add.jsp';
			document.ff.submit();
			return true;
			}
	
	</script>

  </head>
  
  <body>
  	<div>
  	
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
			<br/>
    		<div class="border">
    			&nbsp;&nbsp;
    			<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
    			<a href="userAction!homePage?admin=admin"><font color="blue" size="3">返回主页</font></a>
    		</div>
    		<form name="ff" method="post" action="" >
    		<table width="70%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 100px;margin-top: 40px;margin-bottom: 40px" >
    			<tr>
    				<td class="listViewThS1">用户ID</td>
    				<td class="listViewThS1">用户名</td>
    				<td class="listViewThS1">修改权限</td>
    				<td class="listViewThS1">修改密码</td>
    				<td class="listViewThS1">添加用户</td>
    			</tr>
    			<s:iterator value="list" var="userItem" >
    			<tr>
    				<td><s:property value="#userItem.id"/></td>
    				<td><s:property value="#userItem.name"/></td>
    				<td>
    					<img src="mainfile/customer/images/menu/khbf.png" border="0">
    					<input type="button" value="修改权限" onclick="uptdateRole('<s:property value="#userItem.id"/>');">
    				</td>
    				<td>
    					<img src="mainfile/customer/images/button/dongjie.png" border="0">
    					<input type="button" value="修改密码" onclick="uptdatePwd('<s:property value="#userItem.id"/>','<s:property value="#userItem.pwd"/>');">
    				</td>
    				<td>
    					<img src="mainfile/customer/images/button/shengqingfenpei.png" border="0">
    					<input type="button" value="添加用户" onclick="adduser();">
    				</td>
    			</tr>
    			</s:iterator>
    		</table>
    		</form>
		</div>
	
  </body>
</html>
