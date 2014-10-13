<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>add.jsp</title><%--

	<style type="text/css">
		.red{
		color: red;
		}
		.gre{
		color: #00ff00;
		}
		
	table.imagetable {
		font-family: verdana,arial,sans-serif;
		font-size:20px;
		color:#333333;
		border-width: 1px;
		border-color: #999999;
		border-collapse: collapse;
	}
	table.imagetable th {
		background:#b5cfd2 url('mainfile/power/user/image/cell-blue.jpg');
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #999999;
	}
	table.imagetable td {
		background:#dcddc0 url('mainfile/power/user/image/cell-grey.jpg');
		border-width: 1px;
		padding: 8px;
		border-style: solid;
		border-color: #999999;
	}
	
		
		</style>
		--%>
		<script type="text/javascript" src="mainfile/power/js/jquery-1.4.4.min.js"></script>
		<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
  		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript">
				function checkname(){
					var va=$("#name").val();
					var Span=$("#namediv");
					Span.addClass();
					var reg=/^\w{3,40}$/ig;
					if(va.length<3||va.length>40||va==null){
						Span.addClass('red');
						Span.text("用户名长度有误或空值");
						return false;
					}
					else if(reg.test(va)==false){
						Span.addClass('red');
						Span.text("不符合规则");
						return false;
					}
					
					else{
						Span.addClass('gre');
						Span.text("OK");
						return true;
					}
				}
				function checkpwd(){
					var va=$("#pwd").val();
					console.info(va);
					var reva=$("#repwd").val();
					var Span=$("#pwddiv");
					Span.addClass();
					var reg=/^\w{5,18}$/ig;
					if(va.length<5||va.length>18||va==null){
						Span.addClass('red');
						Span.text("一次密码长度有误或空值");
						return false;
					}
					else if(reg.test(va)==false){
						Span.addClass('red');
						Span.text("不符合规则");
						return false;
					}
					else if(va!=reva){
						Span.addClass('red');
						Span.text("不符合规则");
						return false;
					}
					
					else{
						Span.addClass('gre');
						Span.text("OK");
						return true;
					}
				}
	
				function checkrepwd(){
					var Span=$("#repwddiv");
					var pwd=$("#pwd").val();
					var repwd=$("#repwd").val();
					if(repwd!=pwd||repwd==null){
						Span.addClass('red');
						Span.text("二次密码不相同");
						return false;
					}
					else{
						Span.addClass('gre');
						Span.text("OK");
						return true;
					}
				}
				function checkphone(){
					var va=$("#phone").val();
					var Span=$("#phonediv");
					Span.addClass();
					var reg=/^((\+86)?|\(\+86\))0?1[358]\d{9}$/ig;
					if(va.length<=0||va.length>11||va==null){
						Span.addClass('red');
						Span.text("手机长度有误或空值 ");
						return false;
					}
					else if(reg.test(va)==false){
						Span.addClass('red');
						Span.text("不符合规则");
						return false;
					}
					
					else{
						Span.addClass('gre');
						Span.text("OK");
						return true;
					}
				}
				function checkduty(){
					var va=$("#duty").val();
					var Span=$("#dutydiv");
					Span.addClass();
					var reg=/^[\u4e00-\u9fa5]+$/ig;
					 if(reg.test(va)==false){
						Span.addClass('red');
						Span.text("不符合规则");
						return false;
						}
					 else{
						if(va.length<=0||va.length>20||va==null){
							Span.addClass('red');
							Span.text("长度有误或空值 ");
							return false;
							}
						
						else{
							Span.addClass('gre');
							Span.text("OK");
							return true;
							}
	
						}
					}
				function checkdutyno(){
					var va=$("#duty_no").val();
					var Span=$("#duty_nodiv");
					Span.addClass();
					var reg=/^\d{1,2}$/ig;
					if(va.length<=0||va.length>2||va==null){
						Span.addClass('red');
						Span.text("长度有误或空值 ");
						return false;
					}
					else if(reg.test(va)==false){
						Span.addClass('red');
						Span.text("不符合规则");
						return false;
					}
					
					else{
						Span.addClass('gre');
						Span.text("OK");
						return true;
					}
				}
	
					function  checkAll(){
						var Span=$("#checkdiv");
						Span.addClass();
						Span.text();
						if(checkpwd()&&checkrepwd()&&checkphone()&&checkduty()&&checkdutyno()){
						
							Span.addClass('gre');
							Span.text("所有元素输入正确！！");
						return true;
						}
						else{
							Span.addClass('red');
							Span.text("有错误！！ ");
						return false;
						}
					}
					
					function submit(){
						var Span=$("#checkdiv");
						Span.addClass();
						Span.text();
						if(checkAll()==false){
							Span.addClass('red');
							Span.text("有错误！！ ");
							return false;
						}
						else{
							$("#ff")[0].submit();
							return true;
						}
	
					}
	</script>
  </head>
  
  <body>
  	<form action="userAction!add" id="ff" method="post">
  		<div class="mtitle">
			<div class="mtitle-row">&nbsp;</div>
			<h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;新建员工</h3>
		</div>
		<br>
		<div>
    		<div class="border">
    			&nbsp;&nbsp;
    			<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
    			<a href="userAction!homePage?admin=admin"><font color="blue" size="3">返回主页</font></a>
    		</div>
		</div>
		<div class="control">
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';" onClick="document.forms[0].submit()">
			<img src="mainfile/customer/images/button/baocun.png" border='0' align='absmiddle'>&nbsp;保存</button>
		</div>
		<br/>
		<hr color="green"/>
		<div id="menu1">
    	<table width="60%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 200px;margin-top: 40px">
    			<tr>
    				<td width="8%" class="red">用&nbsp;户&nbsp;名</td>
    				<td width="34%"><input id="name" name="user.name" value="" onblur="return checkname()"/></td>
    				<td><div id="namediv"></div></td>
    			
    				<td width="8%" class="red">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
    				<td width="34%"><input id="pwd" name="user.pwd" value="" onblur="return checkpwd()"/></td>
    				<td><div id="pwddiv"></div></td>
    			</tr>
    		
    			<tr>
    				<td width="8%" class="red">重输密码</td>
    				<td width="34%"><input id="repwd" name="repwd" value="" onblur="return checkrepwd()"/></td>
    				<td><div id="repwddiv"></div></td>
    			
    				<td width="8%" >电&nbsp;&nbsp;&nbsp;&nbsp;话</td>
    				<td width="34%"><input id="phone" name="user.phone" value="" onblur="return checkphone()"/></td>
    				<td><div id="phonediv"></div></td>
    			</tr>
    			<tr>
    				<td width="8%">职&nbsp;&nbsp;&nbsp;&nbsp;务</td>
    				<td width="34%"><input id="duty" name="user.duty" value="" onblur="return checkduty()"/></td>
    				<td><div id="dutydiv"></div></td>
    			</tr>
    			<tr>
    				<td width="8%">职务编号</td>
    				<td width="34%"><input id="duty_no" name="user.duty_no" value="" onblur="return checkdutyno()"/></td>
    				<td><div id="duty_nodiv"></div></td>
    			</tr>
    			
    			<tr>
    				<td width="8%"><input type="button" value="检&nbsp;&nbsp;验" onclick="return checkAll();"></td>
    				<td><div id="checkdiv"></div</td>
    				<td width="8%"><input type="button" onclick="submit();" value="提&nbsp;&nbsp;交"></td>
    			</tr>
    		</table>
    	</div>
    	</form>
  </body>
</html>
