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
    <title>deal_success.jsp</title>
    <script type="text/javascript">
    	function backCustomers(){
    		window.location.href="customerAction!findAll";
    	}
    </script>
  </head>
  
  <body>
	  <fieldset>
	  	<legend>
		  	<div>
		  		&nbsp;&nbsp;&nbsp;&nbsp;<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
		  		<font color="blue" size="4">
		  			<a href="javascript:void(0);" onclick="backCustomers()" style="text-decoration: none">返回查看用户记录</a>
		  		</font>
		  	</div>
	  	</legend>
	  </fieldset>
  	<div>
   		<img alt="服务通知处理成功。。" src="mainfile/customer/images/dealsuccess.jpg">
   		<font color="green" size="4">${msg }</font>
  	</div>
  	<div style="margin-left:20% ">
  		<img alt="背景图片" src="mainfile/customer/images/success.jpg" align="center">
  	</div>
  </body>
</html>
