<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
 	<script src="mainfile/default/js/prototype.lite.js" type="text/javascript"></script>
	<script src="mainfile/default/js/moo.fx.js" type="text/javascript"></script>
	<script src="mainfile/default/js/moo.fx.pack.js" type="text/javascript"></script>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(mainfile/default/images/menu_bgs.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(mainfile/default/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(mainfile/default/images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(mainfile/default/images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(mainfile/default/images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
  </head>
  
  <body>
    <table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
	  <tr>
	    <td width="182" valign="top"><div id="container">
	      <h1 class="type"><a href="javascript:void(0)">客户管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="mainfile/default/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	          <li><a href="customerAction!add" target="main">添加客户</a></li>
	          <li><a href="customerAction!findAll" target="main">查看客户</a></li>
	          <li><a href="customerAction!warnLost" target="main">客户关系预警</a></li>
	          <li><a href="customerAction!findTimedCustomer" target="main">客户流失处理</a></li>
	         
	        </ul>
	      </div>
	       <h1 class="type"><a href="javascript:void(0)">服务管理分类</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="mainfile/default/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	          <li><a href="serviceAction!findByStatus1?status=1" target="main">创建服务</a></li>
	          <li><a href="serviceAction!findAll" target="main">服务列表</a></li>
	          <li><a href="serviceAction!findByStatus2?status=1" target="main">服务分配</a></li>
	          <li><a href="serviceAction!findByStatus3?status=2" target="main">服务处理</a></li>
	          <li><a href="serviceAction!findByStatus4?status=3" target="main">服务反馈</a></li>
	          <li><a href="serviceAction!findByStatus5?status=4" target="main">服务归档</a></li>
	         
	        </ul>
	      </div>
	      <h1 class="type"><a href="javascript:void(0)">营销管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="mainfile/default/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	          <li><a href="marketChanceAction!add" target="main">拟定营销机会</a></li>
	          <li><a href="marketChanceAction!findAll" target="main">查看销售机会</a></li>
	          <li><a href="developmentAction!add" target="main">拟定营销计划</a></li>
	          <li><a href="developmentAction!findAll" target="main">查看营销计划</a></li>
	         
	        </ul>
	      </div>
	      <h1 class="type"><a href="javascript:void(0)">网站常规管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="mainfile/default/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	          <li><a href="#" target="main">基本设置</a></li>
	         
	        </ul>
	      </div>
	      <h1 class="type"><a href="javascript:void(0)">栏目分类管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="mainfile/default/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	          <li><a href="#" target="main">信息分类</a></li>
	         
	        </ul>
	      </div>
	      <h1 class="type"><a href="javascript:void(0)">订单管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="mainfile/default/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
			  <li><a href="#" target="main">订单列表</a></li>
	         
	        </ul>
	      </div>
	      <h1 class="type"><a href="javascript:void(0)">商品价格管理</a></h1>
	      <div class="content">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td><img src="mainfile/default/images/menu_topline.gif" width="182" height="5" /></td>
	          </tr>
	        </table>
	        <ul class="MM">
	          <li><a href="productAction!findAll" target="main">产品列表</a></li>
	          <li><a href="mainfile/price/addProduct.jsp" target="main">增加产品</a></li>
	        </ul>
	      </div>
	    </div>
	        
	        <script type="text/javascript">
			var contents = document.getElementsByClassName('content');
			var toggles = document.getElementsByClassName('type');
		
			var myAccordion = new fx.Accordion(
				toggles, contents, {opacity: true, duration: 400}
			);
			myAccordion.showThisHideOpen(contents[0]);
		</script>
	        </td>
	  </tr>
	</table>
  </body>
</html>
