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
    
    <title>联系人列表</title>
 	<link href="mainfile/customer/css/style_cn.css" rel="stylesheet" type="text/css">
 	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
 	<script type="text/javascript">
 	function to_add(){
		   window.location.href="linkManAction!add";
	}
 	 function changeCheckCount(){
	       var count=0;
		   $("input[type='checkbox'][name='ids']").each(function(index,data){
	            if(this.checked){
	            	count++;  
	            }
		   });
		   $("#slt_ids_count2").empty();
	 	   $("#slt_ids_count2").append(count);
	
	       if(count== $("input[type='checkbox'][name='ids']").length){
	    	   $("#checkall").attr("checked","checked");
	       }else{
	    	   $("#checkall").attr("checked",null);
	       }
	   }
	   
	   function  checkAll(){
	      if($("#checkall")[0].checked){
	    	  $("input[type='checkbox'][name='ids']").attr("checked","checked");
	    	  $("#slt_ids_count2").empty();
	    	  $("#slt_ids_count2").append($("input[type='checkbox'][name='ids']").length);
	      }else{
	    	  $("input[type='checkbox'][name='ids']").attr("checked",null);
	    	  $("#slt_ids_count2").empty();
	    	  $("#slt_ids_count2").append(0);
	      }
	   }
 	</script>
  </head>
  
  <body>
   	<table width="100%" border="0" cellspacing="0" class="tabForm">
<tr>
	<td colspan="4" class="th_head">
		<div id="menuArrow1" style="background:url(mainfile/customer/images/down.gif) no-repeat center;float:left;">&nbsp;</div>
		<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;联系人搜索</h3>
	</td>
</tr>
<tr>
<td>
<div id="menu1"> 
<form name="form2" method="post" action="linkManAction!findLink">
	
	<table  width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
	  	    <td width="6%" nowrap>姓名：</td>
			<td><input name="name" type="text" id="name" value="" style="width:110px"></td>
			
	  	    <td width="19%" align="center">
				<div class="control">
					<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="document.form2.submit();"><img src="mainfile/customer/images/button/sousuo.png" border='0' align='absmiddle'>&nbsp;搜索</button>
	      			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="goRefresh()"><img src="mainfile/customer/images/button/qingkong.png" border='0' align='absmiddle'>&nbsp;清空</button>
				</div>
	        </td>
	  	</tr>
	</table>
	</form>
	</div>
	</td>
	</tr>	
	
	</table>	
	<hr style="background-color: green"/>
<br>
	<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;联系人列表</h3>
	<div class="control">
		  <button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
		          onClick="to_add();">
		          <img src="mainfile/customer/images/button/xinjian.png" border='0' align='absmiddle'>&nbsp;新建</button>
		  <button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
		          onClick="document.forms[1].submit()">
		          <img src="mainfile/customer/images/button/shanchu.png" border='0' align='absmiddle'>&nbsp;删除</button>
	</div>
	<!-- list -->
	<div class="border">
	<form name="ActionForm" method="post" action="linkManAction!delete">
	<table width="100%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable">
		<tr>
	    	<td width="4%" class="listViewThS1">
	    		<input type="checkbox" id="checkall" name="checkall" value="" class="checkbox" onClick="checkAll();"></td>
	  	    <td width="14%" class="listViewThS1">姓名</td>
	  	    <td width="20%" class="listViewThS1">手机</td>
	  	    <td width="20%" class="listViewThS1">已分配人数</td>
	    </tr>
		<s:iterator value="links" var="item" >
			<tr>
				<td width="4%">
    	  			<input type="checkbox" name="ids" value='<s:property value="#item.id"/>' class="checkbox" onClick="changeCheckCount();">
    	  		</td>
				<td><s:property value="#item.name"/></td>
				<td><s:property value="#item.phone"/></td>
				<td><s:property value="#item.customers.size()"/></td>
			</tr>
		</s:iterator>
	</table>
	</form>
	</div>
</body>
</html>
