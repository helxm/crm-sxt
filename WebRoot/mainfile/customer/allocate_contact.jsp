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
    
    <title>allocate_contact.jsp</title>
    <link href="mainfile/customer/css/style_cn.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		console.info(${param.cid });
		function getContact(lid){
			window.parent.location.href="customerAction!allocate?lid="+lid+"&id="+${param.cid };
		}
	</script>
  </head>
  	
  <body>
  	<table>
  		<tr height="30px">
  			<img height="20%"  src="mainfile/customer/images/contact.jpg" style="margin-left: 30px" />
  			<img height="20%"  src="mainfile/customer/images/contact.jpg"  />
  			<img height="20%"  src="mainfile/customer/images/contact.jpg"  />
  		</tr>
  	</table>
  	<div class="border">
    	<table border="1" align="center" cellspacing="0" cellpadding="0"  id="PowerTable" class="PowerTable">
    		<tr>
    			<td width="20%" class="listViewThS1">姓名</td>
    			<td width="20%" class="listViewThS1">电话</td>
    			<td width="20%" class="listViewThS1">状态</td>
    		</tr>
    		<s:iterator value="links" var="item">
    			<tr>
    			<td>
    				<s:property value="#item.name"/>
    			</td>
    			<td>
    				<s:property value="#item.phone"/>
    			</td>
    			<td>
    				<s:if test="#item.customers.size()>=4">
    					<font color="red">不可选</font>
    				</s:if>
    				<s:else>
    					<a href="javascript:void(0);" onclick="getContact('<s:property value="#item.id"/>');"><font color="blue">选择分配</font></a>
    				</s:else>
    			</td>
    			</tr>
    		</s:iterator>
    	</table>
    </div>
  </body>
</html>
