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
    <title>detached.jsp</title>
  </head>
  
  <body>
  	<div class="border">
  		<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;流失客户</h3>
  	</div>
  	<br/>
  	<div class="border">
     <table width="80%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 50px;margin-top: 50px" >
    	<tr>
    		<td class="listViewThS1"  >客户名称</td>
    		<td class="listViewThS1"  >客户电话</td>
    		<td class="listViewThS1"  >客户满意度</td>
    	</tr>
    	<s:iterator value="detach_cont" var="item">
    		<tr>
    			<td><s:property value="#item.name"/></td>
    			<td><s:property value="#item.status"/></td>
    			
    			<td>
    				<s:if test="#item.satisfy!=null">
    					<s:property value="#item.satisfy"/>
    				</s:if>
    				<s:else>
    					<font color="red">无记录</font>
    				</s:else>
    			</td>
    		</tr>
    	</s:iterator>
    </table>
  	</div>
  </body>
</html>
