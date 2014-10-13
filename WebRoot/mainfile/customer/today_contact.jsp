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
    <title>今天需要联系的客户</title>
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
    
    <script type="text/javascript">
    	function deal(t_id){
    		$.ajax({
    			url:'customerAction!deal?id='+t_id,
    			success:function(){
    				window.location.href = window.location.href;		
    			}
    		});
    	}
    	function back(){
    		window.parent.location.href = window.parent.location.href;
    	}
    </script>
  </head>
  
  <body>
  	<div class="border">
    <table border="1" align="center" cellspacing="0" cellpadding="0"  id="PowerTable" class="PowerTable" >
    	<a href="javascript:void(0);" onclick="back()">&lt;&lt;返回</a>
    	<tr>
    		<td width="20%"  class="listViewThS1">客户编号</td>
    		<td width="20%"  class="listViewThS1">客户名称</td>
    		<td width="20%"  class="listViewThS1">客户电话</td>
    		<td width="20%"  class="listViewThS1">处理状态</td>
    	</tr>
    	<s:iterator value="today_cont" var="today">
    		<tr>
    			<td><s:property value="#today.cust_num"/></td>
    			<td><s:property value="#today.name"/></td>
    			<td><s:property value="#today.phone"/></td>
    			<td>
    				<a href="javascript:void(0);" onclick="deal('<s:property value="#today.id"/>');">未处理</a>
    			</td>
    		</tr>
    	</s:iterator>
    </table>
    </div>
  </body>
</html>
