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
    <title>login.jsp</title>
  	<link rel="stylesheet" href="css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.ztree.core-3.5.js"></script>
    <SCRIPT type="text/javascript" src="mainfile/power/js/jquery-1.4.4.min.js"></SCRIPT>
    <SCRIPT type="text/javascript" src="mainfile/power/js/jquery.ztree.all-3.5.js"></SCRIPT>
    <SCRIPT type="text/javascript">
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
					url:'menuAction!findByUserIdtree?uid='+${sessionScope.user.id},
					dataType:'json',
					success:function(list){
						var setting={
								data: {
									simpleData: {
										enable: true
									}
								}
						};
						
						$.fn.zTree.init($("#treeDemo"),setting, list);
						var tree = $.fn.zTree.getZTreeObj("treeDemo");
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
    	
    </SCRIPT>
    <style type="text/css">
		.ztree li a.level0 {width:180px;height: 25px; text-align:center; display:block; background-color: #0000CD; border:1px silver solid;}
		.ztree li a.level0.cur {background-color: red; }
		.ztree li a.level0 span {display: block; color: white; padding-top:4px; font-size:15px; font-weight: bold;word-spacing: 15px;}
		.ztree li a.level0 span.button {float:right; margin-left: 10px; visibility: visible;display:none;}
		.ztree li span.button.switch.level0 {display:none;}
	</style>
    
  </head>
  
  <body>
  <div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
  </div>
</body>
</html>
