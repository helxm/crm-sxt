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
    <title>拟定计划</title>
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
    <form name="ff" method="post"  action="developmentAction!save" >
	<div class="mtitle">
		<div class="mtitle-row">&nbsp;</div><h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;新建计划</h3>
	</div>
	
	<br>
	
	<div class="control">
		<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';" onClick="document.forms[0].submit()">
		<img src="mainfile/customer/images/button/baocun.png" border='0' align='absmiddle'>&nbsp;保存</button>
		<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="">
		<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>&nbsp;<A href="javascript:history.go(-1);">返回</A></button>
	    <span class="remarkText"></span>
	</div>
	<div class="border">
	<table width="100%" border="0" cellspacing="0" class="tabForm">
	  <tr>
	    <th colspan="4" class="th_head">
			<div id="menuArrow1" style="background:url(mainfile/customer/images/down.gif) no-repeat center;float:left;">&nbsp;</div>
			<div  id="menuTitle1">&nbsp;</div>
			<%--<div id="menuTitle1" style="font-weight:bold;font-size: 16px;background-color: pink;">[基本信息]</div>
			--%><h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;录入计划</h3>
		</th>
	  </tr>
	  
	  <tr>
	  	<td>
			<div id="menu1">
			<table width="70%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 60px">
				<input type="hidden" name="mid" value="${param.mid }">
			    <tr>
					<td width="1%" class="red">计划编号：</td>
					<td width="5%">
						<input id="code" name="development.num"  style="width:30%" />
					</td>
				</tr>
				<tr>
					<td width="1%" class="red">客户id：</td>
					<td width="5%"> 
						<input  id="name" name="development.marketChance.id"  style="width:30%" value='${param.cid }' disabled="disabled"/>
					</td>
				</tr>
				<tr>
			  		<td width="1%" class="red">创建日期：</td>
					<td width="5%"> 
						<input  name="development.time"  style="width:30%" class="biuuu" value=""/>
					</td>
			  	</tr>
				<tr>
			  		<td width="1%" class="red">实施日期：</td>
					<td width="5%"> 
						<input  name="development.planTime"  style="width:30%" class="biuuu" value=""/>
					</td>
			  	</tr>
			  
			  <tr>
				<td valign="top">计划内容：</td>
				<td colspan="3">
				  <s:textarea name="development.content" rows="4" id="remark" cssStyle="width:96%"></s:textarea>
				</td>
			  </tr>
			  </table>
			</div>
		<br/>
		</div>
		</td>
	  </tr>
	</table>
	</div>
	</form>
	<script src="mainfile/customer/js/menu.js" type="text/javascript"></script>
  </body>
</html>
