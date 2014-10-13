<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>right.jsp</title>
	<link href="mainfile/default/images/skin.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/jquery.jdigiclock.css" />
	<script type="text/javascript" src="js/jquery.jdigiclock.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {
	        $('#digiclock').jdigiclock({
	            // Configuration goes here
	        });
	    });
	</script>
  </head>
  
  <body>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="17" valign="top" background="mainfile/default/images/mail_leftbg.gif"><img src="mainfile/default/images/left-top-right.gif" width="17" height="29" /></td>
	    <td valign="top" background="mainfile/default/images/content-bg.gif">
	    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
	      <tr>
	        <td height="31"><div class="titlebt">欢迎界面</div></td>
	      </tr>
	    </table>
	    </td>
	    <td width="16" valign="top" background="mainfile/default/images/mail_rightbg.gif">
	    <img src="mainfile/default/images/nav-right-bg.gif" width="16" height="29" /></td>
	    
	  </tr>
	  
	  <tr>
	    <td valign="bottom" background="mainfile/default/images/mail_leftbg.gif"><img src="mainfile/default/images/buttom_left2.gif" width="17" height="17" /></td>
	    <td background="mainfile/default/images/buttom_bgs.gif"><img src="mainfile/default/images/buttom_bgs.gif" width="17" height="17"></td>
	    <td valign="bottom" background="mainfile/default/images/mail_rightbg.gif"><img src="mainfile/default/images/buttom_right2.gif" width="16" height="17" /></td>
	     
	  </tr>
  	  <tr>
  	  	
  	  </tr>
	</table>
	<div class="border">
			<table style="margin-left: 30px">
				<tr>
					<td>
						<div class="border">
							<img src="images/bgmain.png" width="600px" height="490px">
						</div>
					</td>
					<td>
						<div>
							<img src=""/>
							<font size="5" style="background-color: #D1EEEE" color="blue">[系统时间]</font>
						</div><hr/>
						<div class="border">
							<div id="digiclock" style="width: 250px;height: 300px;">
						</div>
					</td>  	
				</tr>
			</table>
	</div>
  </body>
</html>
