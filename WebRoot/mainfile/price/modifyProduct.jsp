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
    <title>修改商品信息</title>
	<link rel="stylesheet" href="js/wbox/wbox/wbox.css" type="text/css"></link>
	<script type="text/javascript" src="js/wbox/jquery1.4.2.js"></script>
	<script type="text/javascript" src="js/wbox/wbox.js"></script>
	<script type="text/javascript" src="mainfile/power/js/jquery-1.4.4.min.js"></script>
	<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  </head>
  
  <body>
  	<div class="border">
  	<form action="productAction!modifyProduct" method="post">
  		<div class="mtitle">
			<div class="mtitle-row">&nbsp;</div>
			<h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;修改产品信息</h3>
		</div>
		<br>
		<div>
    		<div class="border">
    			&nbsp;&nbsp;
    			<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
    			<a href="javascript:history.go(-1);"><font color="blue" size="3">返回</font></a>
    		</div>
		</div>
		<div class="control">
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';" onClick="document.forms[0].submit()">
			<img src="mainfile/customer/images/button/baocun.png" border='0' align='absmiddle'>&nbsp;保存</button>
		</div>
		<br/>
  		<hr color="green"/>
		<div id="menu1">
		<table width="60%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 200px;margin-top: 40px;margin-bottom: 80px">
	  		<input type="hidden" name="pid" value="${param.pid }">
	  		<tr>
	  			<td width="8%" >
		  			商&nbsp;品&nbsp;编&nbsp;号
	  			</td>
	  			<td width="34%">
		  			<input type="text" name="serialnumber" value="${param.serialnumber }"/>
	  			</td>
	  			
		  		<td width="8%">
		  			商&nbsp;品&nbsp;名&nbsp;称
		  		</td>
		  		<td width="34%">
		  			<input type="text" name="pname" value="${param.name }"/>
		  		</td>
	  		</tr>
	  		<tr>
		  		<td width="8%">
		  			商&nbsp;品&nbsp;价&nbsp;格
		  		</td>
		  		<td width="34%">	
		  			<input type="text" name="pprice" value="${param.price }"/>
	  			</td>
	  			
		  		<td width="8%">
		  			对小客户打折
		  		</td>
		  		<td width="34%">
		  			<input type="text" name="p3" value="${param.p3 }"/>
		  		</td>
	  		</tr>
	  		
	  		<tr>
	  			<td width="8%">
		  			对中客户打折
		  		</td>
		  		<td width="34%">
		  			<input type="text" name="p2" value="${param.p2 }"/>
		  		</td>
		  		<td width="8%">
		  			对大客户打折
		  		</td>
		  		<td width="34%">
		  			<input type="text" name="p1" value="${param.p1 }"/>
		  		</td>
	  		</tr>
	   </table>
  	 </div>		
  	</form>
  	</div>
  </body>
</html>