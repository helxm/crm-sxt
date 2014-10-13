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
    <title>销售机会列表</title>
    
    <link rel="stylesheet" href="mainfile/customer/css/style_cn.css" type="text/css"></link>
	<link rel="stylesheet" href="js/wbox/wbox/wbox.css" type="text/css"></link>
  	<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="mainfile/customer/js/domtool.js"></script>
  	
  	<script type="text/javascript" src="js/wbox/jquery1.4.2.js"></script>
	<script type="text/javascript" src="js/wbox/wbox.js"></script>
	<style type="text/css">
		.one {
			background-color: #33ffcc;
		}
		
		.two {
			background-color: #eeffcc;
		}
	
	</style>
	 <SCRIPT type="text/javascript">
	 	
    	function allocate(id){
    		var box = $().wBox({
    			title:'分配联系人',
  	  			requestType:"iframe",
  	  			iframeWH:{width:400,height:500},
  	  			target:'linkManAction!findForAllocates?mid='+id
  	  		});
  	  		box.showBox();  
		}
    	
    	function createMan(id){
    		var box = $().wBox({
    			title:'添加创建人',
  	  			requestType:"iframe",
  	  			iframeWH:{width:400,height:500},
  	  			target:'marketChanceAction!findEmployees?mid='+id
  	  		});
  	  		box.showBox();  
		}
    	function makePlan(id,mid){
    		window.location.href="developmentAction!add?cid="+id+"&mid="+mid;
    	}
    </SCRIPT>
  </head>
  
  <body>
    <div class="mtitle">
		<div class="mtitle-row">&nbsp;</div>
			<h3><img src="mainfile/customer/images/menu/zxyh.png" border="0">销售机会列表</h3>
		</div>
		<div class="link_title">
		<br>&nbsp;&nbsp;
			<a href="javascript:void(0);" onclick=""><img src="mainfile/customer/images/menu/kfkd.png" border="0"/>&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="javascript:void(0);" onclick=""><img src="mainfile/customer/images/menu/fzxx.png" border="0"/>&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<%--
		<br>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tabForm">
		  <tr>
		    <th class="th_head">
				<h3><img src="mainfile/customer/images/menu/qdgl.png" border="0">&nbsp;客户搜索</h3>
			</th>
		  </tr>
		  <tr>
			  <td colspan="2">
		<!-- 基本查询的表单-->
		<form name="form1" method="post" action="customerAction!findCus" >
		<table width="70%" border="0" cellspacing="0" cellpadding="0" name="base" id="base">
			<tr>
		    	<td width="9%" nowrap>客户编码：</td>
		   	    <td width="12%" nowrap><input name="code" type="text" id="code" value="" style="width:110px"></td>
		  	    <td width="9%" nowrap>客户名称：</td>
				<td width="12%" nowrap><input name="name" type="text" id="name" value="" style="width:110px"></td>
				
		  	    <td width="19%" align="center">
					<div class="control">
						<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  onClick="document.forms[0].submit();">
						<img src="mainfile/customer/images/button/sousuo.png" border='0' align='absmiddle'>&nbsp;搜索</button>
						        
						<button type='button' class='button' onMouseOver="this.className='button_over';"onMouseOut="this.className='button';" onClick="clear();">
						<img src="mainfile/customer/images/button/qingkong.png" border='0' align='absmiddle'>&nbsp;清空</button>
					</div>
				</td>
			</tr>
			
		</table>
		</form>
		<!-- 基本查询的表单结束 -->
		</td>
		  </tr>
		</table>
		--%><br>
		<hr color="green"/>
		<h3><img src="mainfile/customer/images/menu/khlb.png" border="0">&nbsp;销售机会列表</h3>
		<span id="slt_ids_count1"></span>
		<div class="control">
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
			     onClick="to_add();">
			     <img src="mainfile/customer/images/button/xinjian.png" border='0' align='absmiddle'>&nbsp;新建</button>
			     
			<%--
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';" 
				    onClick="gonextTouchTime()">
			     <img src="mainfile/customer/images/button/xiacilxsj.png" border='0' align='absmiddle'>&nbsp;下次联系时间</button>
			     
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
			        onClick="do_share()">
			     <img src="mainfile/customer/images/button/gongxiang.png" border='0' align='absmiddle'>&nbsp;共享</button>
		
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
			         onClick="goChangePerson()">
			     <img src="mainfile/customer/images/button/jinshourbg.png" border='0' align='absmiddle'>&nbsp;联系人变更</button>
			--%>
			     
			<button type='button' class='button' onMouseOver="this.className='button_over';" onMouseOut="this.className='button';"  
			        onClick="document.forms[1].submit()" >
			     <img src="mainfile/customer/images/button/shanchu.png" border='0' align='absmiddle'>&nbsp;删除</button>
			     
		</div>
		<div class="border">
		<form method="post" action="marketChanceAction!delete">
		<table width="80%" border="1" cellspacing="0" cellpadding="0" id="PowerTable" class="PowerTable" style="margin-left: 100px">
			<tr>
		    	<td class="listViewThS1">
		    	   <input type="checkbox" id="checkall" name="checkall"  class="checkbox" onclick="checkAll()">
		    	</td>
		  	    <td  class="listViewThS1">机会编号</td>
		  	    <td  class="listViewThS1">客户名称</td>
		  	    <td  class="listViewThS1">机会概述</td>
		        <td  class="listViewThS1">成功几率</td>
		        <td  class="listViewThS1">联&nbsp;系&nbsp;人</td>
		        <td  class="listViewThS1">创&nbsp;建&nbsp;人</td>
		        <td  class="listViewThS1">创建日期</td>
		        <td  class="listViewThS1">操&nbsp;&nbsp;作&nbsp;&nbsp;</td>
		    </tr>
			<s:if test="list!=null">
				<s:iterator value="list"  var="item">
					<tr>
				    	<td>
				    	   <input type="checkbox" name="ids" value="<s:property value="#item.id"/>" class="checkbox" onclick="changeCheckCount();">
				    	</td>
				    	
				  	    <td><s:property value="#item.id"/></td>
				  	    
				  	    <td>
				  	       <s:property value="#item.customer.name"/>
				  	    </td>
				  	    <td>
				  	       <s:property value="#item.title"/>
				  	    </td>
				  	    <td>
				  	       <s:property value="#item.rate"/>
				  	    </td>
				  	    
				        <td>
					        <s:if test="#item.linkMan.name != null">
					        	<s:property value="#item.linkMan.name"/>
					        </s:if>
					        <s:else>
					        	<img src="mainfile/customer/images/menu/zxyh.png" border="0">
					        	<a href="javascript:void(0);" onclick="allocate('<s:property value="#item.id"/>');">分配联系人</a>
					        </s:else>
				        </td>
				        <td>
					        <s:if test="#item.createMan != null">
					        	<s:property value="#item.createMan"/>
					        </s:if>
					        <s:else>
					        	<img src="mainfile/customer/images/menu/zxyh.png" border="0">
					        	<a href="javascript:void(0);" onclick="createMan('<s:property value="#item.id"/>');">点击添加</a>
					        </s:else>
				        </td>
				        
				        <td><s:property value="#item.createDate"/></td>
				        
				        <td>
				        	<s:if test="#item.status != null">
				        		<font color="green">计划已拟定</font>
				        	</s:if>
				        	<s:else>
				        		<a href="javascript:void(0);" onclick="makePlan('<s:property value="#item.customer.id"/>','<s:property value="#item.id"/>');"><font color="blue">拟定计划</font></a>
				        	</s:else>
				        </td>
				        </tr>
				</s:iterator>
			</s:if>
		</table>
		</form>
		</div>
		<script type="text/javascript">
			function goChangePerson() {
				var count=0;
			    var ids="";
			    $("input[type='checkbox'][name='ids']").each(function(index,data){
			       if(this.checked){
			          count++;
			          if(count==1){
			              ids=$(this).val();
			          }else{
			              ids=ids+","+$(this).val();
			          }
			       }
			   });
			   if(count==0){
			         alert("必须有一个客户被选中!!!");
			         return false;
			   }
			  
			  var url = "${pageContext.request.contextPath}/crm/companyAction_showChangePerson.do?ids="+ids;
			  //var url = "${pageContext.request.contextPath}/crm/customer/base/changePerson.jsp";
			  OpenWin(url,'',480,140);
			}
		
			
			//处理下次联系时间
		    function gonextTouchTime(){
			  var count=0;
			  var ids="";
			   //遍历所有的复选框
			   $("input[type='checkbox'][name='ids']").each(function(index,data){
			     if(this.checked){   //如果复选框处于选中状态
			        count++;         //count加1
			        if(count==1){    
			            ids=$(this).val();   //43,44,45   
			        }else{
			            ids=ids+","+$(this).val();
			        }
			     }
			     //如果没有被选中
			 });
		
			 //alert("ids  "+ids);
			   		 
			 if(count==0){
			       alert("必须有一个客户被选中!!!");
			       return false;
			 }
			 OpenWin("${pageContext.request.contextPath}/crm/customer/base/nextTouchTime.jsp?ids="+ids,'',420,300);
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
		   
		   function to_add(){
			   window.location.href="marketChanceAction!add";
		   }
	</script>
  </body>
</html>
