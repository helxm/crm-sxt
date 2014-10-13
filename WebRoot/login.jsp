<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>login.jsp</title>
     <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
     <script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<link rel="stylesheet" href="js/wbox/wbox/wbox.css" type="text/css"></link>
	<script type="text/javascript" src="js/wbox/jquery1.4.2.js"></script>
	<script type="text/javascript" src="js/wbox/wbox.js"></script>
  	<script type="text/javascript">
  		var box;
  		$(function(){
  			 $("#Verify").click(function(){
	       		 $(this).attr("src","securityCodeImageAction!generate?timestamp="+new Date().getTime());
	       	 });
  			var msg = $("#msg").val();
  			if(msg){
	  		 box = $().wBox({
  	  			title:"温馨提示",
  	  			html:"<div style='width:200px;height:100px'><font color='#FFA500' size='4'>"+msg+"</font></div>"
  	  		});
  	  		box.showBox();
  	  		setTimeout(function(){
  	  			box.close();
  	  		},2000);
  			}
  		});
  	</script>
  </head>
  
 
  <BODY  topmargin="0" leftmargin="0" >
  	<input type="hidden" id="msg" value="${msg }">
	<form name="form1" method="post" action="loginAction!checkLogin" >
	<TABLE width="100%" cellpadding="0" cellspacing="0" id="header">
	<TR>
		<TD>
		<TABLE height="80" cellpadding="0" cellspacing="0" width="100%">
		<TR>
			<TD width="225"><img src="mainfile/customer/images/ban_1.gif"></TD>
			<TD background="mainfile/customer/images/ban_2.gif">&nbsp;</TD>
			<TD width="181" background="mainfile/customer/images/ban_2.gif"></TD>
		</TR>
		</TABLE>
		</TD>
	</TR>
	
	<TR>
	<!-- 
	 -->
		<TD height="119" background="mainfile/customer/images/bg.gif">&nbsp;</TD>
	</TR>
	<TR>
		<TD height="300">
		<TABLE width="100%" cellpadding="0" cellspacing="0">
		<TR>
			<TD valign="top" align="center">
			<!-- 可以任意替换背景图标 
			-->
			<img src="mainfile/customer/images/logo4.jpg">
			
			</TD>
			<TD width="44" height="200" background="mainfile/customer/images/line.png">&nbsp;</TD>
			<TD width="540" valign="top">
			  <TABLE width="100%" cellpadding="0" cellspacing="0" style="margin-top: 100px">
			  <TR>
			  	<TD height="140" valign="top">
				  <font class="font">请输入您的用户名及密码:</font>
				  <br>
	           		<font color="#FF0000"></font><br>
				  <TABLE cellpadding="0" cellspacing="0">
				  <TR>
				  	<TD class="td">用户帐号：</TD><TD class="td">
				  	<input name="name" type="text" value="" id="name"/></TD>
				  </TR>
				  <TR>
				  	&nbsp;
				  </TR>
				   
				  <TR>
				  	<TD class="td">登录密码：</TD>
				  	<TD class="td"><input name="pwd" type="password" value="" id="pwd"></TD>
				  </TR>
				  <br/>
				  <TR>
				  	<TD class="td">验&nbsp;证&nbsp;码：</TD>
				  	<TD vAlign=center colSpan=2>
	                  <INPUT id=securityCode size=4 name=securityCode >&nbsp; 
	                  <img src="security/securityCodeImageAction!generate" id="Verify"  style="cursor:hand;" />
	                </TD>
				  </TR>
				   
				  <TR>
			  		<TD vAlign=center colSpan=3>
	                <INPUT id=btnLogin type=submit value=" 登 录 " name=btnLogin>
	            </TD>
			  </TR>
				  </TABLE>
				</TD>
			  </TR>
			  
			  </TABLE>
			</TD>
		</TR>
		</TABLE>
		</TD>
	</TR>
	<TR>
		<TD align="center"><br><a href="http://www.bjsxt.com" target="_blank">北京尚学堂教育科技有限公司</a></TD>
	</TR>
	<TR>
		<TD height="5">&nbsp;</TD>
	</TR>
	</TABLE>
	</form>
</BODY>
</html>
