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
    <title>新建销售机会</title>
	<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  	<link rel="stylesheet" href="mainfile/customer/js/date_input/jquery.datepick.css" type="text/css"></link>
	  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick.js"></script>
	  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick-zh-CN.js"></script>
	  <script type="text/javascript">
	  $(document).ready(function(){
			$('.biuuu').datepick({dateFormat: 'yy-mm-dd'}); 
			/*var url="employeeAction!findEmployees";
				$.getJSON(url,null,function(result){
					console.info(result);
					$.each(result,function(i,e){
						$("<option/>").attr("value",e.id).html(e.name).appendTo($("#employee"));
					});
				});
				*/
		});
	  </script>
  </head>
  
  <body>
    <form name="ff" method="post" action="marketChanceAction!save" >
	<div class="mtitle">
		<div class="mtitle-row">&nbsp;</div><%--
		客户-新建
		--%><h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;新建销售机会记录</h3>
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
			--%><h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;录入信息</h3>
		</th>
	  </tr>
	  
	  <tr>
	  	<td>
			<div id="menu1">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td width="8%" class="red">客户编号：</td>
				<td width="34%">
					<%--<input name="marketChance.customer.id" style="width:50%" />
					
					--%>
					<input id="marketchances" name="marketChance.customer.id"  style="width:50%" type="text"/>
					<input id="buttonID" type="button" value="选择输入" />
						<script type="text/javascript">
							//单击"选择输入"按钮，弹出对话框以供选择输入
							document.getElementById("buttonID").onclick=function(){
								var sURL="customerAction!findHidden";
								var vArguments=window;
								var sFeatures="dialogHeight:400px;dialogLeft:150px";
								//以模式方式显示窗体内容			
								window.showModalDialog(sURL,vArguments,sFeatures);
							}
						</script>
					
					
					
				</td>
				
				<td width="8%" class="red">销售机会概要：</td>
				<td width="34%"> 
					<input  id="name" name="marketChance.title"  style="width:50%" />
				</td>
			  </tr>
			  
			  <tr>
				<td>成功几率：</td>
				<td>
				  <input type="radio" name="marketChance.rate" value="0.5"  checked="checked"/>50%
		    	  <input type="radio" name="marketChance.rate" value="0.6" />60%
		    	  <input type="radio" name="marketChance.rate" value="0.7" />70%
		    	  <input type="radio" name="marketChance.rate" value="0.8" />80%
				</td>
					<td width="8%" class="red">创建日期：</td>
					<td width="34%"> 
						<input name="marketChance.createDate"  style="width:50%" class="biuuu" value=""/>
					</td>
			  </tr>
			  
			  <tr>
				<td valign="top">备注：</td>
				<td colspan="3">
				  <s:textarea name="marketChance.remark" rows="4" id="remark" cssStyle="width:96%"></s:textarea>
				</td>
			  </tr>
			  </table>
			</div>
	<br>
		</div>
		</td>
	  </tr>
	</table>
	</div>
	</form>
	<script src="mainfile/customer/js/menu.js" type="text/javascript"></script>
  </body>
</html>
