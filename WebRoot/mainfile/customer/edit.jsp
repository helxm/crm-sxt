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
    
    <title>客户资料修改</title>
	
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  	<link rel="stylesheet" href="mainfile/customer/js/date_input/jquery.datepick.css" type="text/css"></link>
	  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick.js"></script>
	  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick-zh-CN.js"></script>
	  <script type="text/javascript">
	  $(document).ready(function(){
			$('.biuuu').datepick({dateFormat: 'yy-mm-dd'}); 
		});
	  
	  function backword(){
		  
	  }
  	</script>
  </head>
  
  <body>
     <form name="ff" method="post" action="customerAction!update" >
     <input type="hidden" name="customer.id" value='<s:property value="customer.id"/>' >
     <input type="hidden" name="customer.status" value='<s:property value="customer.status"/>' >
     <input type="hidden" name="customer.latestTouchtime" value='<s:property value="customer.latestTouchtime"/>' >
     <input type="hidden" name="eid" value='<s:property value="customer.employee.id"/>' >
	<div class="mtitle"><%--
		<div class="mtitle-row">&nbsp;</div>
		客户-修改
		--%><h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;客户修改</h3>
	</div>
	
	<br>
	
	<div class="control">
		<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';" onClick="document.forms[0].submit()">
		<img src="mainfile/customer/images/button/baocun.png" border='0' align='absmiddle'>&nbsp;保存</button>
		<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="">
		<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>&nbsp;<A href="javascript:history.go(-1);">返回</A></button>
	    <span class="remarkText"></span>
	</div>
	
	<table width="100%" border="0" cellspacing="0" class="tabForm">
	  <tr>
	    <th colspan="4" class="th_head">
			<div id="menuArrow1" style="background:url(mainfile/customer/images/down.gif) no-repeat center;float:left;">&nbsp;</div>
			<div  id="menuTitle1">&nbsp;</div>
			<%--<div id="menuTitle1" style="font-weight:bold;font-size: 16px;">[客户信息]</div>
			--%><h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;基本信息</h3>
		</th>
	  </tr>
	  <%--<hr style="background-color: green;size: 1px"/>
	  --%><tr>
	  	<td>
			<div id="menu1">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td width="8%" class="red">客户编号：</td>
				<td width="34%">
					<input id="customer.cust_num" name="customer.cust_num"  value='<s:property value="customer.cust_num"/>' style="width:50%" />
				</td>
				
				<td width="8%" class="red">客户名称：</td>
				<td width="34%"> 
					<input  id="name" name="customer.name" value='<s:property value="customer.name"/>' style="width:50%" />
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
		    	  <input type="radio" name="customer.type" value="2" />短期客户
		    	  <input type="radio" name="customer.type" value="3" />长期客户
				</td>
			</tr>
				<tr>
				
				<td>客户来源：</td>
				<td>
	                <select name="customer.source" style="width:50%">
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
					<input  id="name" name="customer.email" value='<s:property value="customer.email"/>' style="width:50%" />
				 </td>
				
				 
			  </tr>
			   <tr>
			  	<td width="8%" class="red">客户电话：</td>
				<td width="34%">
					<input id="code" name="customer.phone" value='<s:property value="customer.phone"/>' style="width:50%" />
				</td>
			  </tr>
			  
			  <tr>
				<td>所属行业：</td>
				<td><select id='trade' name='customer.trade' style='width:50%'>
						<option value='政府机构'>政府机构</option>
						<option value='玩具'>玩具</option>
						<option value='服饰'>服饰</option>
						<option value='化工'>化工</option>
						<option value='机械及工业制品'>机械及工业制品</option>
	             </select>
	           </td>
				<td>客户性质：</td>
				<td><select id='quality' name='quality' style='width:50%'>
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
					<td width="8%" >创&nbsp;建&nbsp;人：</td>
					<td width="34%"> 
						<input name="customer.employee.name" value='<s:property value="customer.employee.name"/>' style="width:50%" disabled="disabled"/>
					</td>
					<td width="8%" class="red">创建日期：</td>
					<td width="34%"> 
						<input name="customer.createTime" value='<s:property value="customer.createTime"/>' style="width:50%" class="biuuu"/>
					</td>
			  </tr>
			  
			  <tr>
				<td valign="top">备注：</td>
				<td colspan="3">
				  <textarea rows="4" style="width: 96%" name="customer.remark">
				  		<s:property value="customer.remark"/>
				  </textarea>
				</td>
			  </tr>
			  </table>
			</div>
	<br>
		</div>
		</td>
	  </tr>
	</table>
	</form>
	<script src="mainfile/customer/js/menu.js" type="text/javascript"></script>
  </body>
</html>
