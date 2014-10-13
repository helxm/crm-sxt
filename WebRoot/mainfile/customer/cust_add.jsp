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
    <title>客户资料新建</title>
	<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  	<link rel="stylesheet" href="mainfile/customer/js/date_input/jquery.datepick.css" type="text/css"></link>
	  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick.js"></script>
	  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick-zh-CN.js"></script>
	  <script type="text/javascript">
	  $(document).ready(function(){
			$('.biuuu').datepick({dateFormat: 'yy-mm-dd'}); 
			$.ajax({
				url:'employeeAction!findAll',
				dataType:'json',
				success:function(list){
					console.info(list);
					$.each(list, function(i,n){
						console.info(n[0]);
						console.info(n[1]);
						$("#eid").append(new Option(n[1],n[0]));
					});
				}
			});
		});
	  </script>
  </head>
  
  <body>
    <form name="ff" method="post" action="customerAction!save" >
	<div class="mtitle">
		<div class="mtitle-row">&nbsp;</div><%--
		客户-新建
		--%><h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;新建客户</h3>
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
					<input id="code" name="customer.cust_num"  style="width:50%" />
				</td>
				
				<td width="8%" class="red">客户名称：</td>
				<td width="34%"> 
					<input  id="name" name="customer.name"  style="width:50%" />
				</td>
			  </tr>
			  
			  <tr>
				<td>客户等级：</td>
				<td>
				  <input type="radio" name="customer.level" value="0"  checked="checked"/>vip0
		    	  <input type="radio" name="customer.level" value="1" />vip1
		    	  <input type="radio" name="customer.level" value="2" />vip2
		    	  <input type="radio" name="customer.level" value="3" />vip3
				</td>
				<td>客户类型：</td>
				<td>
				  <input type="radio" name="customer.type" value="0"  checked="checked"/>潜在客户
				  <input type="radio" name="customer.type" value="1"  checked="checked"/>普通客户
		    	  <input type="radio" name="customer.type" value="2" />小客户
		    	  <input type="radio" name="customer.type" value="3" />大客户
				</td>
			</tr>
				<tr>
				<td>客户来源：</td>
				<td>
	                <select name="customer.source" style="width:50%">
	                        <option value="">-----请选择--------</option>
				            <option value="招标投标">招标投标</option>
							<option value="展销会议">展销会议</option>
							<option value="报刊杂志">报刊杂志</option>
							<option value="直销业务">直销业务</option>
							<option value="朋友介绍">朋友介绍</option>
							<option value="户外广告">户外广告</option>
							<option value="互联网">互联网</option>
							<option value="代理渠道">代理渠道</option>
							<option value="促销活动">促销活动</option>
							<option value="电话联系">电话联系</option>
	                </select>
				 </td>
				 <td width="8%" class="red">客户邮箱：</td>
				 <td width="34%"> 
					<input  id="name" name="customer.email"  style="width:50%" />
				 </td>
			  </tr>
			  <tr>
			  	<td width="8%" class="red">客户电话：</td>
				<td width="34%">
					<input id="code" name="customer.phone"  style="width:50%" />
				</td>
			  </tr>
			  <tr>
				<td>所属行业：</td>
				<td><select id='trade' name='customer.trade' style='width:50%'>
						<option value=''>-----请选择--------</option>
						<option value='政府机构'>政府机构</option>
						<option value='玩具'>玩具</option>
						<option value='服饰'>服饰</option>
						<option value='化工'>化工</option>
						<option value='机械及工业制品'>机械及工业制品</option>
	             </select>
	           </td>
				<td>客户性质：</td>
				<td><select id='quality' name='quality' style='width:50%'>
					<option value=''>-----请选择--------</option>
					<option value='下属子公司'>下属子公司</option>
					<option value='上级主管单位'>上级主管单位</option>
					<option value='竞争对手'>竞争对手</option>
					<option value='合作伙伴'>合作伙伴</option>
					<option value='代理商'>代理商</option>
					<option value='供应商'>供应商</option>
	               </select>
	            </td>
			  </tr>
			   <tr>
					<td width="8%" class="red">创建人</td>
					<td width="34%"> 
						<select name="eid" id="eid">
							<option>----请选择----</option>
						</select>
					</td>
					
					<%--
					<td width="34%"> 
						<input id="employee" name="customer.employee.id"  style="width:50%" type="text"/>
						<input id="buttonID" type="button" value="选择输入" />
						<script type="text/javascript">
							//单击"选择输入"按钮，弹出对话框以供选择输入
							document.getElementById("buttonID").onclick=function(){
								var sURL="marketChanceAction!findEmps";
								var vArguments=window;
								var sFeatures="dialogHeight:400px;dialogLeft:150px";
								//以模式方式显示窗体内容			
								window.showModalDialog(sURL,vArguments,sFeatures);
							}
						</script>
						
						<select id="employee" name="customer.employee.id" onchange="getName(this);" style='width:50%' >
					    	<option>---请选择---</option>
					    	<option value="1">---员工1---</option>
					    	<option value="2">---员工2---</option>
					    	<option value="3">---员工3---</option>
					    	<option value="4">---员工4---</option>
					    	
					    </select>
					</td>
					--%>
					
					<td width="8%" class="red">创建日期：</td>
					<td width="34%"> 
						<input  name="customer.createTime"  style="width:50%" class="biuuu" value=""/>
					</td>
			  </tr>
			  
			  <tr>
				<td valign="top">备注：</td>
				<td colspan="3">
				  <s:textarea name="customer.remark" rows="4" id="remark" cssStyle="width:96%"></s:textarea>
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
