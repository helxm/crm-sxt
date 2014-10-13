<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理页面</title>
	<script >
	function logout(){
		if (confirm("您确定要注销系统吗？"))
			top.location = "loginAction!logOut";
		return false;
	}
	</script>
	<script >
	function showsubmenu(sid) {
		var whichEl = eval("submenu" + sid);
		var menuTitle = eval("menuTitle" + sid);
		if (whichEl.style.display == "none"){
			eval("submenu" + sid + ".style.display=\"\";");
		}else{
			eval("submenu" + sid + ".style.display=\"none\";");
		}
	}
	</script>
	<script >
		function showsubmenu(sid) {
			var whichEl = eval("submenu" + sid);
			var menuTitle = eval("menuTitle" + sid);
			if (whichEl.style.display == "none"){
				eval("submenu" + sid + ".style.display=\"\";");
			}else{
				eval("submenu" + sid + ".style.display=\"none\";");
			}
		}
	</script>
	<base target="main">
	<link href="mainfile/default/images/skin.css" rel="stylesheet" type="text/css">
  </head>
  
  <body leftmargin="0" topmargin="0">
	<table width="100%" height="68" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
	  <tr>
	    <td width="61%" height="61"><img src="mainfile/default/images/logo.jpg" width="262" height="64"></td>
	    <td width="39%" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
	      <tr>
	        <td width="74%" height="38" class="admin_txt">管理员：<!-- ${sessionScope.realname} --> 您好,感谢登陆使用！</td>
	        <td width="22%"><a href="#" target="_self" onClick="logout();"><img src="mainfile/default/images/out.jpg" alt="安全退出" width="50" height="20" border="0"></a></td>
	        <td width="4%">&nbsp;</td>
	      </tr>
	      <tr>
	        <td height="19" colspan="3">&nbsp;</td>
	        </tr>
	    </table></td>
	  </tr>
	</table>
</body>
</html>
