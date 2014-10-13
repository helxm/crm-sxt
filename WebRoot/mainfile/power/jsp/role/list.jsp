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
    
    <title>list.jsp</title>

	<script type="text/javascript" src="mainfile/power/js/jquery-1.4.4.min.js">
		
	</script>
	<script type="text/javascript">
		var userId='${userId}';
		$(function(){
			$.ajax({
				   type: "POST",
				   url:'roleAction!findByUserId?userId='+userId,
					dataType:'json',
				   success: function(list){
					$.each(list, function(i,obj){
						console.info(list);
						$("#s1").append(new Option(obj.name,obj.id));
					})
					
				   }
				});

			
			$.ajax({
				   type: "POST",
				   url:'roleAction!findByNotUserId?userId='+userId,
					dataType:'json',
				   success: function(list){
					$.each(list, function(i,obj){
						console.info(list);
						$("#s2").append(new Option(obj.name,obj.id));
					})
					
				   }
				});

			
		});

		function left2right(){
			$("#s1 option:selected")
			.appendTo("#s2")
			.attr("selected",false)
			.each(function(){
				$.ajax({
					 type: "POST",
					url:'roleAction!delRoleAction?roleId='+this.value+'&userId='+userId
				});
			});
		};
		
		function right2left(){
			$("#s2 option:selected")
			.appendTo("#s1")
			.attr("selected",false)
			.each(function(){
				$.ajax({
					 type: "POST",
					url:'roleAction!addRoleAction?roleId='+this.value+'&userId='+userId
				});
			});
		};
		
	
	</script>
	
  </head>
  
  <body>
  	<div>
  		<div class="border">
  			<h3><img src="mainfile/customer/images/menu/h1.png" border="0"><font size="3">角色管理</font></h3>
  		</div>
	    <div class="border">
	    	 &nbsp;&nbsp;<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
	    	 <a href="userAction!findAll"><font color="green">返回授权页面 </font></a>
	    	 &nbsp;&nbsp;&nbsp;&nbsp;<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
    		 <a href="userAction!homePage?admin=admin"><font color="green">返回主页</font></a>
	    </div>
  	</div>
  	<hr color="green"/>
  	<table width="60%" border="0" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 100px;" >
  	<tr>
  	<td>
  	<div class="border">
  		<div class="border">
  			<h3><img src="mainfile/customer/images/menu/zxyh.png" border="0"><font size="3" color="green">已分配角色</font></h3>
  		</div>
  		<br>
  		<div>
		    <SELECT id="s1" multiple="multiple" size="10" style="width: 100px">
		    </SELECT>
	</td>
	<td> 
		<div style="margin-top: 60px">
		 删除<button onclick="left2right();">&gt;&gt;&gt;</button>
		 添加<button onclick="right2left();">&lt;&lt;&lt;</button>
		</div>
	</td>
	<td>	            
		    <div class="border">
  				<h3><img src="mainfile/customer/images/menu/zxyh.png" border="0"><font size="3" color="red">可选角色</font></h3>
  			</div>
  			<br>
		    <SELECT id="s2" multiple="multiple" size="10" style="width: 100px">
		    </SELECT>
  		</div>
  	</td>
  	</div>
  	</tr>
  	</table>
  </body>
</html>
