<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>联系人资料新建</title>
	<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  	<link rel="stylesheet" href="mainfile/customer/js/date_input/jquery.datepick.css" type="text/css"></link>
  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick.js"></script>
  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick-zh-CN.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
		$('.biuuu').datepick({dateFormat: 'yy-mm-dd'}); 
	});
  </script>
  </head>
  
  <body>
    <form name="ff" method="post" action="linkManAction!save">
	<div class="mtitle">
		<div class="mtitle-row">&nbsp;</div><%--
		客户-新建
		--%><h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;新建联系人</h3>
	</div>
	
	<br>
	
	<div class="control">
		<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';" onClick="document.forms[0].submit()">
		<img src="mainfile/customer/images/button/baocun.png" border='0' align='absmiddle'>&nbsp;保存</button>
		<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="">
		<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>&nbsp;<A href="javascript:history.go(-1);">返回</A></button>
	    <span class="remarkText"></span>
	</div>
	
	<table width="100%" border="0" cellspacing="0" class="tabForm">
	  <tr>
	    <th colspan="4" class="th_head">
			<div id="menuArrow1" style="background:url(mainfile/customer/images/down.gif) no-repeat center;float:left;">&nbsp;</div>
			<div  id="menuTitle1">&nbsp;</div>
			<h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;录入信息</h3>
		</th>
	  </tr>
	  
	  <tr>
	  	<td>
			<div id="menu1">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td width="8%" class="red">联系人名称：</td>
				<td width="34%"> 
					<input  id="name" name="linkMan.name"  style="width:50%" />
				</td>
			  </tr>
			  <tr>
				<td width="8%" class="red">联系人电话：</td>
				<td width="34%"> 
					<input  id="name" name="linkMan.phone"  style="width:50%" />
				</td>
			  </tr>
			  
 			  <tr>
				<td valign="top">备注：</td>
				<td colspan="3">
				  <s:textarea name="customer.remark" rows="4" id="remark" cssStyle="width:96%"></s:textarea>
				</td>
			  </tr>
			  </table>
			</div>
			<br>
		</div>
		</td>
	  </tr>
	</table>
	</form>
	<script src="mainfile/customer/js/menu.js" type="text/javascript"></script>
  </body>
</html>
