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
    
    <title>客户流失记录和分析</title>

  <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
  <link rel="stylesheet" href="js/wbox/wbox/wbox.css" type="text/css"></link>
  <link rel="stylesheet" href="mainfile/customer/js/date_input/jquery.datepick.css" type="text/css"></link>
  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick.js"></script>
  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick-zh-CN.js"></script>
  
  <script type="text/javascript" src="js/wbox/jquery1.4.2.js"></script>
  <script type="text/javascript" src="js/wbox/wbox.js"></script>
  <script type="text/javascript">
  function findOrders(id){
		var box = $().wBox({
			title:'客户交易信息',
  			requestType:"iframe",
  			iframeWH:{width:600,height:300},
  			target:'customerAction!findOrders?id='+id
  		});
  		box.showBox();  
	}
  
  function lostConfirm(id,div){
	  console.info(div);
	  $.ajax({
		  url:'customerAction!changeState?id='+id,
		  success:function(msg){
	  			if(msg){
	  				console.info(msg);
		  		var box = $().wBox({
	  	  			title:"温馨提示",
	  	  			html:"<div style='width:200px;height:100px'><font color='#FFA500' size='4'>"+msg+"</font></div>"
	  	  		});
	  	  		box.showBox();
	  	  		setTimeout(function(){
	  	  			box.close();
	  	  		},2000);
		  }
	  }
	  });
	  $(div).html("<font color=\"green\">处理完毕</font>");
  }
  
  function backList(){
	  window.location.href="customerAction!findAll";
  }
  </script>
  
  <body>
  	
	  <div class="border">
	  	<div class="border" >
	  		<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;客户流失确认</h3>
	  	</div>
	  	<div class="border" >
	  		<div>
	  			&nbsp;&nbsp;&nbsp;&nbsp;<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
	  			<a href="javascript:void(0);" onclick="backList();"><font color="green">返回查看所有用户</font></a>
	  		</div>
	  		<br/>
	  		<table width="80%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 120px">
	  			<tr>
	  				<td class="listViewThS1" >客户名称</td>
	  				<td class="listViewThS1" >客户电话</td>
	  				<td class="listViewThS1" >客户等级</td>
	  				<td class="listViewThS1" >客户类型</td>
	  				<td class="listViewThS1" >交易记录</td>
	  				<td class="listViewThS1" >操作</td>
	  			</tr>
	  			<s:iterator value="list" var="item">
		  			<tr>
		  				<td><s:property value="#item.name"/></td>
		  				<td><s:property value="#item.phone"/></td>
		  				
		  				<td>
		  					<s:if test="#item.level == 0">
	  							vip0
	  						</s:if>
	  						<s:elseif test="#item.level == 1">
	  							vip1
	  						</s:elseif>
	  						<s:elseif test="#item.level == 2">
	  							vip2
	  						</s:elseif>
	  						<s:elseif test="#item.level == 3">
	  							vip3
	  						</s:elseif>
	  						<s:else>
	  							vip4
	  						</s:else>

		  				</td>
		  				<td>
		  					
		  					<s:if test="#item.type == 1">
	  							普通客户
	  						</s:if>
	  						<s:elseif test="#item.type == 2">
	  							小客户
	  						</s:elseif>
	  						<s:elseif test="#item.type == 3">
	  							大客户
	  						</s:elseif>
	  						<s:elseif test="#item.type == 0">
	  							潜在客户
	  						</s:elseif>
	  						<s:else>
	  							<font color="red">未标记</font>
	  						</s:else>
		  				</td>
		  				<td>
		  					<a href="javascript:void(0);" onclick="findOrders('<s:property value="#item.id"/>');"><font color="blue">查看交易记录</font></a>
		  				</td>
		  				<td>
		  					<s:if test="#item.status == 1">
			  					<div id="status">
			  						<a href="javascript:void(0);" onclick="lostConfirm('<s:property value="#item.id"/>',this)"><font color="blue">流失确认</font></a>
			  					</div>
		  					</s:if>
		  					<s:else>
		  						<font color="green">已确认流失</font>
		  					</s:else>
		  				</td>
		  			</tr>
	  			</s:iterator>
	  		</table>
	  	</div>
	  </div>
  </body>
</html>
