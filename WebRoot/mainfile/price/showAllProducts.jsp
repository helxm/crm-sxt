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
		function deleteIt(pid){
			if(window.confirm("确定要彻底删除吗?")){
				document.location.href="productAction!delProduct3?pid="+pid;
			} 
		}
		function addProduct(){
			window.location.href="mainfile/price/addProduct.jsp";
		}
	</script>
  </head>
  
  <body>
	  	<div class="mtitle">
			<h3><img src="mainfile/price/images/menu/khlb.png" border="0">&nbsp;历史产品</h3>
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
			         onClick="">
			     <img src="mainfile/price/images/button/jinshourbg.png" border='0' align='absmiddle'>&nbsp;产品变更</button>
			     
			<button type='button' class='button'>
			     <img src="mainfile/price/images/button/shanchu.png" border='0' align='absmiddle'>&nbsp;删除</button>
			     
		</div>
		<div class="border">
			<table width="80%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 80px;margin-top: 40px;margin-bottom: 240px">
			<tr>
	  			<td class="listViewThS1" align="center">产品编号</td>
	  			<td class="listViewThS1" align="center">产品名称</td>
	  			<td class="listViewThS1" align="center">零售价格</td>
	  			<td class="listViewThS1" align="center">小客户价格</td>
	  			<td class="listViewThS1" align="center">中客户价格</td>
	  			<td class="listViewThS1" align="center">大客户价格</td>
	  			<td class="listViewThS1" align="center">操&nbsp;&nbsp;&nbsp;&nbsp;作</th>
	  		</tr>
	  		<s:iterator value="list" var="product">
		  		<tr>
		  			<td align="center"><font color="blue"><s:property value="#product.serialnumber"/></font></td>
		  			<td align="center"><font color="green"><s:property value="#product.name"/></font></td>
		  			<td align="center"><font color="green"><s:property value="#product.price"/></font></td>
		  			<td align="center"><font color="blue"><s:property value="#product.price*#product.p3/10"/></font></td>
		  			<td align="center"><font color="blue"><s:property value="#product.price*#product.p2/10"/></font></td>
		  			<td align="center"><font color="blue"><s:property value="#product.price*#product.p1/10"/></font></td>
		  			<s:if test="#product.available">
			  			<td align="center">
				  			<a href="productAction!delProduct2?pid=<s:property value="#product.id"/>"><font color="red">删除</font></a>
				  			&nbsp;&nbsp;<a href="javascript:void(0)" onclick="deleteIt(<s:property value="#product.id"/>)"><font color="blue">彻底删除</font></a>
						</td>
		  			</s:if>
		  			<s:else>
			  			<td align="center">
				  			<a href="productAction!reUseProduct?pid=<s:property value="#product.id"/>"><font color="green">恢复</font></a>
				  			&nbsp;&nbsp;<a href="javascript:void(0)" onclick="deleteIt(<s:property value="#product.id"/>)"><font color="blue">彻底删除</font></a>
						</td>
		  			</s:else>
		  		</tr>
	  		</s:iterator>
		</table>
	</div>
  </body>
</html>