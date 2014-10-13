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
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
	<script type="text/javascript" src="mainfile/power/js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript">
			function checkname(){
				var va=$("#name").val();
				var Span=$("#d1");
				console.info(Span);
				Span.addClass();
				var reg=/^\w{5,20}$/ig;
				if(va.length<5||va.length>20||va==null){
					Span.addClass('red');
					Span.text("用户名长度有误或空值");
					return false;
				}
				else if(reg.test(va)==false){
					Span.addClass('red');
					Span.text("用户名不符合规则");
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
				var reva=$("#repwd").val();
				var Span=$("#d2");
				console.info(Span);
				Span.addClass();
				var reg=/^\w{5,15}$/ig;
				if(va.length<5||va.length>15||va==null){
					Span.addClass('red');
					Span.text("密码长度有误或空值");
					return false;
				}
				else if(reg.test(va)==false){
					Span.addClass('red');
					Span.text("密码不符合规则");
					return false;
				}
				else if(va!=reva){
					Span.addClass('red');
					Span.text("密码必须相同");
					return false;
				}
				else{
					Span.addClass('gre');
					Span.text("OK");
					return true;
				}
			}

			function checkrepwd(){
				var Span=$("#red2");
				var pwd=$("#pwd").val();
				var repwd=$("#repwd").val();
				if(repwd!=pwd||repwd==null){
					Span.addClass('red');
					Span.text("密码不相同");
					return false;
				}
				else{
					Span.addClass('gre');
					Span.text("OK");
					return true;
				}
			}

				function  checkAll(){
					$("#d3").addClass();
					$("#d3").text();
					if(checkname()&&checkpwd()&&checkrepwd()){
					
					$("#d3").addClass('gre');
					$("#d3").text("所有元素输入正确！！");
					return true;
				}
					else{
						$("#d3").addClass('red');
						$("#d3").text("有错误！！ ");
					return false;
					}

				function submit(){
					$("#d3").addClass();
					$("#d3").text();
					if(checkAll()==false){
						$("#d3").addClass('red');
						$("#d3").text("有错误！！ ");
						return false;
					}
					else{
						$("#ff")[0].submit();
						return true;
					}

				}

			}

			
				
	</script>
  </head>
  
  <body>
    	<form action="userAction!checkUser" name="ff" id="ff">
    		<table class="imagetable">
    			<tr>
    				<th>
    				请输入名字
    				</th>
    				<td>
    				<input name="user.name" id="name" onblur="return checkname();">
    				</td>
    				<td>
    				<div id="d1"></div>
    				</td>
    			</tr>
    			<tr>
    				<th>
    				请输入密码
    				</th>
    				<td>
    				<input type="password" name="user.pwd" id="pwd" onblur="return checkpwd()">
    				</td>
    				<td>
    				<div id="d2"></div>
    				</td>
    			</tr>
    			<tr>
    				<th>
    				请再次输入密码
    				</th>
    				<td>
    				<input type="password" name="repwd" id="repwd" onblur="return checkrepwd()">
    				</td>
    				<td>
    				<div id="red2"></div>
    				</td>
    			</tr>
    			<tr>
    				<th>
    				<input type="button" onclick="return submit();" value="登陆">
    				</th>
    				<th>
    				<input type="button" onclick="return checkAll();" value="检测">
    				</th>
    				<td>
    				<div id="d3"></div>
    				</td>
    				<td>
    				
    				  
    				</td>
    			</tr>
    			
    		
    		</table>	
    			
    		
    	</form>
  </body>
</html>
