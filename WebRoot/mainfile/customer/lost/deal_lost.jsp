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
    
  <title>客户流失暂缓</title>
  <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
  <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  <link rel="stylesheet" href="js/wbox/wbox/wbox.css" type="text/css"></link>
  <link rel="stylesheet" href="mainfile/customer/js/date_input/jquery.datepick.css" type="text/css"></link>
  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick.js"></script>
  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick-zh-CN.js"></script>
  <script type="text/javascript" src="js/wbox/jquery1.4.2.js"></script>
  <script type="text/javascript" src="js/wbox/wbox.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
	  $.ajax({
			url:'serviceAction!findMyServices',
			dataType:'json',
			success:function(list){
				console.info(list);
				$.each(list, function(i,n){
					console.info(n[0]);
					console.info(n[1]);
					$("#mid").append(new Option(n[1],n[0]));
				});
			}
		});
	});
  
  function dailPhone(phone){
	 var box = $('.wboxImg').wBox({target:"mainfile/customer/images/dail.jpg",requestType:"img",title:'phone'+phone});
			box.showBox();//这一句必须要加上
  		setTimeout(function(){
  			box.close();
  		},10000);
  }
  function sendEmail(email){
	  box = $().wBox({
			title:'邮件联系'+email,
  			requestType:"iframe",
  			iframeWH:{width:800,height:500},
  			target:'http://mail.163.com/'
  		});
  		box.showBox();
  }
  function chooseService(){
	  box = $().wBox({
			title:'邮件联系'+email,
  			requestType:"iframe",
  			iframeWH:{width:800,height:500},
  			target:'http://mail.163.com/'
  		});
  		box.showBox();
  }
  </script>
  
  <body>
	  		<div class="border">
	  			<div style="height: 20px">
	  				<h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;客户基本信息</h3>
	  			</div>
	  			<table border="1" cellspacing="0" cellpadding="0"  id="PowerTable" class="PowerTable"  width="600px" style="margin-top: 3%;margin-left: 8%">
	  				<tr>
	  					<td width="15%" class="listViewThS1">客户姓名</td>
	  					<td width="20%"><s:property value="customer.name"/></td>
	  					<td width="15%" class="listViewThS1">客户电话</td>
	  					<td width="20%"><s:property value="customer.phone"/></td>
	  				</tr>
	  				
	  				<tr>
	  					<td width="15%" class="listViewThS1">客户等级</td>
	  					<td width="20%">
	  						<s:if test="customer.level == 0">
	  							vip0
	  						</s:if>
	  						<s:elseif test="customer.level == 1">
	  							vip1
	  						</s:elseif>
	  						<s:elseif test="customer.level == 2">
	  							vip2
	  						</s:elseif>
	  						<s:elseif test="customer.level == 3">
	  							vip3
	  						</s:elseif>
	  						<s:else>
	  							vip4
	  						</s:else>
	  					</td>
	  					<td width="15%" class="listViewThS1">客户邮箱</td>
	  					<td width="20%"><s:property value="customer.email"/></td>
	  				</tr>
	  				<tr>
	  					<td width="15%" class="listViewThS1">客户状态</td>
	  					<td width="20%">
	  						<s:if test="customer.status == 1">
	  							普通客户
	  						</s:if>
	  						<s:elseif test="customer.status == 2">
	  							小客户
	  						</s:elseif>
	  						<s:else>
	  							大客户
	  						</s:else>
	  					</td>
	  					<td width="15%" class="listViewThS1">客户来源</td>
	  					<td width="20%"><s:property value="customer.source"/></td>
	  				</tr>
	  				
	  				<tr>
	  					<td width="15%" class="listViewThS1">客户满意度</td>
	  					<td width="20%">
	  						<s:if test="customer.myService.satisfy != null">
	  							<s:property value="customer.myService.satisfy"/>
	  						</s:if>
	  						<s:else>
	  							<font color="red">暂无记录</font>
	  						</s:else>
	  					</td>
	  					<td width="15%" class="listViewThS1">客户创建时间</td>
	  					<td width="20%"><s:property value="customer.createTime"/></td>
	  				</tr>
	  				<tr>
	  					<td width="15%" class="listViewThS1">备注：</td>
	  					<td colspan="3">
	  						<textarea  style="width: 100%">
	  							<s:property value="customer.remark"/>
	  						</textarea>
	  					</td>
	  				</tr>
	  			</table>
	  		</div>
	  	<br/>
	  	<div class="border" >
	  		<div style="height: 30px;border: 1">
	  			<h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;暂缓措施</h3>
	  		</div>
	  	<form action="customerAction!serviceDeal" method="post">
	  		<input type="hidden" name="id" value='<s:property value="customer.id" />'>
	  		<div>
	  			<div style="margin-left: 30px">
	  				<font color="blue" size="3">方式一：电话或邮件联系</font><br/>
	  				<img src="mainfile/customer/images/wdxx.png" border='0' align='absmiddle'>
	  				<A href="javascript:void(0);" onclick="sendEmail('<s:property value="customer.email"/>');"><font size="2" color="green">1.发送邮件:</font><s:property value="customer.email"/></A><br/><br/>
	  				<img src="mainfile/customer/images/button/zhuanweiqd.png" border='0' align='absmiddle'>
	  				<A href="javascript:void(0);" onclick="dailPhone('<s:property value="customer.phone"/>');"><font size="2" color="green">2.电话联系:</font><s:property value="customer.phone"/></A></font>
	  			</div>
	  			<br/>
	  			<div style="margin-left: 30px">
	  				<font color="blue" size="3">方式二：通知服务</font><br/><br/>
	  				<img src="mainfile/customer/images/button/zhuanweiqd.png" border='0' align='absmiddle'>
	  				<font size="2" color="green">&nbsp;&nbsp;&nbsp;&nbsp;选择服务</font>
	  				<select name=sid id="mid">
						<option value="0">---选择---</option>
					</select>
	  				<%--
	  				<input id="myservice" name="sid"  style="width:50%" type="text"/>
					<input id="buttonID" type="button" value="选择输入" />
						<script type="text/javascript">
							//单击"选择输入"按钮，弹出对话框以供选择输入
							document.getElementById("buttonID").onclick=function(){
								var sURL="customerAction!findServices";
								var vArguments=window;
								var sFeatures="dialogHeight:400px;dialogLeft:150px";
								//以模式方式显示窗体内容			
								window.showModalDialog(sURL,vArguments,sFeatures);
							}
						</script>
	  				
	  				<select id="myservice" name="sid" style='width:15%'>
	  					<option>---请选择---</option>
	  					<option value="1">服务1</option>
					    <option value="2">服务2</option>
					    <option value="3">服务2</option>
					    <option value="4">服务2</option>
	  				</select>
	  			--%>
	  			</div>
	  			<br/>
	  			<div style="margin-left: 30px">
	  				<font color="red" size="3">*备注记录：</font><br>
	  				<textarea style="width: 50%;height: 50px" name="customer.remark">
	  					请填写记录。。
	  				</textarea>
	  			</div>
	  			<br/>
	  			<div style="margin-left: 30px">
		  			<input type="submit" value="点击处理" style="background-color: #6495ED"/>
	  			</div>
	  		</div>
	  	</form>
	  	</div>
  </body>
</html>
