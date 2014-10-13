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
    
    <title>update.jsp</title><%--
   
	<style type="text/css">
		.red{
		color: red;
		}
		.gre{
		color: #00ff00;
		}
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
			function checkpwd(){
				var va=$("#pwd").val();
				var reva=$("#repwd").val();
				var Span=$("#d1");
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
				var Span=$("#d1");
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
					var Span=$("#d1");
					Span.addClass();
					Span.text();
					if(checkpwd()&&checkrepwd()){
					
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
					var Span=$("#d1");
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
  		<form action="userAction!updateToUser" id="ff" method="post">
  			<div class="mtitle">
				<div class="mtitle-row">&nbsp;</div>
				<h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;修改员工信息</h3>
			</div>
			<br>
			
			<hr color="green"/>
			<div id="menu1">
    		<table width="40%" border="0" cellspacing="0" cellpadding="0" style="margin-left: 200px;margin-top: 40px">
    			<tr>
    				<td width="8%" class="red" >密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
    				<td width="34%">
    					<input id="pwd" name="user.pwd" value="${param.pwd}" onblur="return checkpwd()"/>
    				</td>
    			</tr>
    		
    			<tr>
    				<td width="8%" class="red" >
    					重输密码<input type="hidden" id="id" name="id" value="${param.id}" onblur="return checkrepwd()"/>
    				</td>
    				<td width="34%">
    					<input id="repwd" name="repwd" />
    				</td>
    			</tr>
    		
    			<tr>
    				<td width="8%">
    					<input type="button" value="检&nbsp;&nbsp;验" onclick="return checkAll();">
    				</td>
    				<td width="8%">
    					<div id="d1"></div>
    				</td>
    				<td width="8%">
    					<input type="button" onclick="submit();" value="提&nbsp;&nbsp;交">
    				</td>
    			</tr>
    		</table>
    	</div>
    	</form>
  </body>
</html>
