<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>产品列表</title>
    
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<link rel="stylesheet" href="js/wbox/wbox/wbox.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="mainfile/customer/js/domtool.js"></script>
  	
  	<script type="text/javascript" src="js/wbox/jquery1.4.2.js"></script>
	<script type="text/javascript" src="js/wbox/wbox.js"></script>
	
	<script type="text/javascript">
		function addProduct(){
			window.location.href="mainfile/price/addProduct.jsp";
		}
	</script>
  </head>
  
  <body>
	  	<div class="mtitle">
			<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;产品列表</h3>
			<span id="slt_ids_count1"></span>
	  	</div>
  		<br/>
		<div>
    		<div class="border">
    			&nbsp;&nbsp;
    			<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
    			<a href="javascript:history.go(-1);"><font color="blue" size="3">返回</font></a>
    		</div>
		</div>
		<br/>
		<div class="control">
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
			     onClick="addProduct();">
			     <img src="mainfile/price/images/button/xinjian.png" border='0' align='absmiddle'>&nbsp;新增产品</button>
			     
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
			         onClick="goChangePerson()">
			     <img src="mainfile/price/images/button/jinshourbg.png" border='0' align='absmiddle'>&nbsp;产品变更</button>
			     
			<button type='button' class='button'>
			     <img src="mainfile/price/images/button/shanchu.png" border='0' align='absmiddle'>&nbsp;删除</button>
			     
		</div>
		<div class="border">
		<table width="80%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-bottom: 240px;margin-left: 80px;margin-top: 40px;">
		<tr>
  			<td class="listViewThS1" align="center">产品编号</td>
  			<td class="listViewThS1" align="center">产品名称</td>
  			<td class="listViewThS1" align="center">零售价格</td>
  			<td class="listViewThS1" align="center">小客户价格</td>
  			<td class="listViewThS1" align="center">中客户价格</td>
  			<td class="listViewThS1" align="center">大客户价格</td>
  			<td class="listViewThS1" align="center">操&nbsp;&nbsp;&nbsp;&nbsp;作</td>
  		</tr>
  		<s:iterator value="list" var="product">
	  		<tr>
	  			<td align="center"><font color="blue"><s:property value="#product.serialnumber"/></font></td>
	  			<td align="center"><font color="green"><s:property value="#product.name"/></font></td>
	  			<td align="center"><font color="red"><s:property value="#product.price"/></font></td>
	  			<td align="center"><font color="blue"><s:property value="#product.price*#product.p3/10"/></font></td>
	  			<td align="center"><font color="blue"><s:property value="#product.price*#product.p2/10"/></font></td>
	  			<td align="center"><font color="blue"><s:property value="#product.price*#product.p1/10"/></font></td>
	  			<td align="center">
		  			<a href="productAction!delProduct?pid=<s:property value="#product.id"/>"><font color="red">删除</font></a>&nbsp;&nbsp;
		  			<a href="mainfile/price/modifyProduct.jsp?pid=<s:property value="#product.id"/>&
						name=<s:property value="#product.name"/>&
						serialnumber=<s:property value="#product.serialnumber"/>&
						price=<s:property value="#product.price"/>&
						p1=<s:property value="#product.p1"/>&
						p2=<s:property value="#product.p2"/>&
						p3=<s:property value="#product.p3"/>"><font color="blue">修改</font>
					</a>
				</td>
	  		</tr>
  		</s:iterator>
		</table>
		</div>
  </body>
</html>
 