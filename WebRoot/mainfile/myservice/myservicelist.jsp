<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlist.jsp' starting page</title>
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<style type="text/css">
	
</style>
  </head>
  
 <body>
 	<div class="border">
 		<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;服务详情列表</h3>
 	</div>
 	<br/>
		<div class="border">
		<table width="40%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 200px">
			
			<tr>
				<td class="listViewThS1" width="40%">客户编号</td>
				<td>
					<s:property value=""></s:property>
				</td>
			</tr>
			<tr>
				<td  class="listViewThS1" width="40%">服务标题</td>
				<td>
					<s:property value="myService.title"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1" width="14%">服务类型</td>
				<td>
					<s:property value="myService.type"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1" width="14%">服务状态</td>
				<td>
					<s:property value="myService.status"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1" >创建人编号（客户经理）</td>
				<td>
					<s:property value="myService.s_Create.employee.id"/>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1" >创建人姓名</td>
				<td>
					<s:property value="myService.s_Create.employee.name"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1">创建任务时间</td>
				<td>
					<s:property value="myService.s_Create.create_date"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1">分配任务人编号（销售主管）</td>
				<td>
					<s:property value="myService.s_Allocate.employee.id"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1">分配任务人姓名</td>
				<td>
					<s:property value="myService.s_Allocate.employee.name"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1">接受任务人编号</td>
				<td>
					<s:property value="myService.s_Deal.employee.id"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1">接受任务人姓名</td>
				<td>
					<s:property value="myService.s_Deal.employee.name"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1">分配任务时间</td>
				<td>
					<s:property value="myService.s_Allocate.allcateTime"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1">处理任务时间</td>
				<td>
					<s:property value="myService.s_Deal.dealTime"></s:property>
				</td>
			</tr>
			
			<tr>
				<td class="listViewThS1">服务反馈</td>
				<td>
					<s:property value="myService.request"></s:property>
				</td>
			</tr>
			<tr>
				<td class="listViewThS1">服务满意度</td>
				<td>
					<s:property value="myService.satisfy"></s:property>
				</td>
			</tr>
				<td colspan="3" ><a href="">返&nbsp;&nbsp;回</a></td>
			</tr>
		</table>
		</div>
</body>
</html>
