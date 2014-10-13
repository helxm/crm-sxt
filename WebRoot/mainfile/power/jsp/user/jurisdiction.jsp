<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>jurisdiction.jsp</title>
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
    <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    <%--

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
	  --%>
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
	    	<table width="30%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 300px;margin-top: 80px;margin-bottom: 40px">
	    		<div class="border">
	    		<tr>
	    			<td width="8%" class="listViewThS1" ><font size="3" color="#4B0082">&nbsp;&nbsp;用&nbsp;&nbsp;户&nbsp;&nbsp;管&nbsp;&nbsp;理</font></td>
	    			<td width="10%">
	    			<img src="mainfile/customer/images/menu/khglcl.png" border="0">
	    			<a href="userAction!findAll" style="text-decoration: none" ><font size="3" color="#0000CD" >&nbsp;[用&nbsp;户&nbsp;管&nbsp;理]</font></a>
	    			</td>
	    		</tr>
	    		</div>
	    		<div class="border">
		    		<tr>
		    			<td width="8%" class="listViewThS1"><font size="3" color="#4B0082">&nbsp;&nbsp;角色管理及授权</font></td>
		    			<td width="10%">
		    			<img src="mainfile/customer/images/menu/khbf.png" border="0">
		    			<a href="roleAction!findAll" style="text-decoration: none"><font size="3" color="#0000CD">&nbsp;[用&nbsp;户&nbsp;授&nbsp;权]</font></a></td>
		    		</tr>
	    		</div>
	    	</table>
		</div>
  </body>
</html>
