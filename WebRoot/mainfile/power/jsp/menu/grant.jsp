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
    
    <title>grand.jsp</title>

	 <link rel="stylesheet" type="text/css" href="mainfile/power/css/zTreeStyle/zTreeStyle.css">
    <SCRIPT type="text/javascript" src="mainfile/power/js/jquery-1.4.4.min.js"></SCRIPT>
    <SCRIPT type="text/javascript" src="mainfile/power/js/jquery.ztree.all-3.5.js"></SCRIPT>
    <script type="text/javascript">
	    var curMenu = null, zTree_Menu = null;
		var setting = {
			view: {
				showLine: true,
				selectedMulti: false,
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onNodeCreated: this.onNodeCreated,
				beforeClick: this.beforeClick,
				onClick: this.onClick
			}
		};
    
	    $(function(){
			$.ajax({
				url:'menuAction!find4tree?roleId='+${param.roleId},
				dataType:'json',
				success:function(list){

					var setting={
								
							data: {
								simpleData: {
									enable: true
								}
							},
							check:{
								enable:true,
								chkStyle: "checkbox",
								chkboxType: { "Y": "s", "N": "s" },
							}
							
					};
					var show=$("#tb #show");
					var tree=$.fn.zTree.init($("#treeDemo"),setting, list);
					
					console.info(show.text());
					tree.expandAll(true);
				}
			});
	    });

	    
	    function beforeClick(treeId, node) {
			if (node.isParent) {
				if (node.level === 0) {
					var pNode = curMenu;
					while (pNode && pNode.level !==0) {
						pNode = pNode.getParentNode();
					}
					if (pNode !== node) {
						var a = $("#" + pNode.tId + "_a");
						a.removeClass("cur");
						zTree_Menu.expandNode(pNode, false);
					}
					a = $("#" + node.tId + "_a");
					a.addClass("cur");

					var isOpen = false;
					for (var i=0,l=node.children.length; i<l; i++) {
						if(node.children[i].open) {
							isOpen = true;
							break;
						}
					}
					if (isOpen) {
						zTree_Menu.expandNode(node, true);
						curMenu = node;
					} else {
						zTree_Menu.expandNode(node.children[0].isParent?node.children[0]:node, true);
						curMenu = node.children[0];
					}
				} else {
					zTree_Menu.expandNode(node);
				}
			}
			return !node.isParent;
		}
	    
	    
    		function mySubmit(){
    			var tree = $.fn.zTree.getZTreeObj("treeDemo");
				
            	var  sNodes = tree.getCheckedNodes();
				for ( var i= 0; i < sNodes.length; i++) {
					
					var node=sNodes[i];
					
					$("#ff").append("<input type=\"hidden\"  name=\"menuIds\"  value="+node.id+" />");
				}
				
				$("#ff")[0].action='menuAction!select';
				$("#ff")[0].submit();

        	}
    </script>
    	<style type="text/css">
			.ztree li a.level0 {width:180px;height: 25px; text-align:center; display:block; background-color: #0000CD; border:1px silver solid;}
			.ztree li a.level0.cur {background-color: red; }
			.ztree li a.level0 span {display: block; color: white; padding-top:4px; font-size:15px; font-weight: bold;word-spacing: 15px;}
			.ztree li a.level0 span.button {float:right; margin-left: 10px; visibility: visible;display:none;}
			.ztree li span.button.switch.level0 {display:none;}
		</style>
  </head>
  
  <body >
  	<table width="60%" border="0" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" >
  	<div>
  		<div class="border">
  			<h3><img src="mainfile/customer/images/menu/qdgl.png" border="0"><font color="green" size="3">授权管理</font></h3>
  		</div>
	    <div class="border">
	    	 &nbsp;&nbsp;&nbsp;&nbsp;<img src="mainfile/customer/images/button/fanhui.png" border='0' align='absmiddle'>
    		 <a href="userAction!homePage?admin=admin"><font color="green">返回主页</font></a>
	    </div>
  	</div>
  	<hr color="green"/>
  	</table>
   	<form  id="ff"  action="" method="post" >
  		<input type="hidden"  name="roleId" id="roleId" value="${roleId}" />
  	</form>
  	<table border="1" style="margin-left: 200px">
  		<tr>
	  		<td>
	  			<div class="content_wrap">
					<div class="zTreeDemoBackground left">
						<ul id="treeDemo" class="ztree"></ul>
					</div>
				</div>
	  		</td>
	  		<td>
				<div>
					<div style="margin-left: 50px">
						<button  onclick="mySubmit();">选择菜单并提交</button><br>
					</div>
					<img alt="" src="images/123.jpg">
				</div>
			</td>
  		</tr>
  	</table>
  </body>
</html>
