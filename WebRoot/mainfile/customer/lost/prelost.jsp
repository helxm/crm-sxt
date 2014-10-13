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
    
    <title>客户流失预警</title>
    

  <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
  
  <link rel="stylesheet" href="mainfile/customer/js/date_input/jquery.datepick.css" type="text/css"></link>
  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick.js"></script>
  <script type="text/javascript" src="mainfile/customer/js/date_input/jquery.datepick-zh-CN.js"></script>
  
  <script type="text/javascript">
  $(document).ready(function(){
		$('.biuuu').datepick({dateFormat: 'yy-mm-dd'}); 
	});
  
  function deal(id){
		window.location.href="customerAction!preDeal?id="+id;
	}
  function back(){
	  //后期处理
  }
  </script>
  
  <body>
  	<div class="border">
  		<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;客户流失预警管理</h3>
	  	<div class="border">
	  		&nbsp;&nbsp;&nbsp;&nbsp;<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
	    	<a href="javascript:void(0);" onclick="back()"><font color="green">返回</font></a>
	  	</div>
  	</div>
  	<br/>
  	<div class="border">
  		<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;客户关系管理</h3>
  		<fieldset style="background-color: #97FFFF;width: 30%; margin-left: 10px" >
  			<legend>
  					<img src="mainfile/customer/images/work/khbf.png" border='0' align='absmiddle'>
  				<label style="color: red"><font size="3">客户关系预警提示：</font></label><br/>
  			</legend>
  			<legend>
  				<u style="text-decoration: none">
  				<img src="mainfile/customer/images/button/bangzhu.png" border='0' align='absmiddle'>
  					<font size="2" color="blue">建议</font>
  				</u><br/>
  				<u style="text-decoration: none" ><font size="2" color="blue">&nbsp;&nbsp;1.客户是上帝，务必采取措施改善关系！</font></u><br/>
  				<u style="text-decoration: none"><font size="2" color="blue">&nbsp;&nbsp;2.一切为了客户是我们义不容辞的责任！</font></u><br/>
  				<u style="text-decoration: none"><font size="2" color="blue">&nbsp;&nbsp;3.留住顾客最好的办法是——采取行动！</font></u><br/>
  			</legend>
  		</fieldset>
  	</div>
  	<br/>
    <div class="border">
    <h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;预警客户</h3>
    <table border="1" align="center" cellspacing="0" cellpadding="0"  id="PowerTable" class="PowerTable" >
    	<tr>
    		<td width="10%"  class="listViewThS1">客户编号</td>
    		<td width="10%"  class="listViewThS1">客户名称</td>
    		<td width="10%"  class="listViewThS1">客户电话</td>
    		<td width="10%"  class="listViewThS1">客户联系人</td>
    		<td width="10%"  class="listViewThS1">联系人电话</td>
    		<!-- 
    		<td width="10%"  class="listViewThS1">订单记录</td>
    		 -->
    		
    		<td width="10%"  class="listViewThS1">操作</td>
    	</tr>
    	<s:iterator value="list" var="item">
    		<tr>
    			<td><s:property value="#item.cust_num"/></td>
    			<td><s:property value="#item.name"/></td>
    			<td><s:property value="#item.phone"/></td>
    			<td>
    				<s:if test="#item.linkMan.name != null">
		    			<s:property value="#item.linkMan.name"/>
    				</s:if>
    				<s:else>
    					<font color="red">未分配联系人</font>
    				</s:else>
    			
    			</td>
    			<td>
    				<s:if test="#item.linkMan.phone != null">
    					<s:property value="#item.linkMan.phone"/>
    				</s:if>
    				<s:else>
    					<font color="red">未分配联系人</font>
    				</s:else>
    			</td>
    			<!-- 
    			<td>
    				<s:property value="#item.order.time"/>
    			</td>
    			 -->
    			<td>
    				<a href="javascript:void(0);" onclick="deal('<s:property value="#item.id"/>');"><font color="blue">暂缓处理</font></a>
    			</td>
    		</tr>
    	</s:iterator>
    </table>
    </div>
  </body>
</html>
