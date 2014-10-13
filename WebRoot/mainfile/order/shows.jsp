<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">

    <base href="<%=basePath%>">
    
    <title>订单列表</title>
    
	<link rel="stylesheet" href="js/wbox/wbox/wbox.css" type="text/css"></link>
  	<LINK href="css/public.css" type=text/css rel=stylesheet>
	<LINK href="css/login.css" type=text/css rel=stylesheet>
	
	<link rel="stylesheet" href="css/order/c.css?v=1411093498444" />   
	<link rel="stylesheet" href="css/order/jquery.jqplot.css?v=1411093498444" />  
	 
<%-- 	<script src="//hm.baidu.com/hm.js?e6a820e58d40d6bbfdaa42e767e97522"></script> --%>
	<script type="text/javascript" src="js/wbox/jquery1.4.2.js"></script>
	<script type="text/javascript" src="js/wbox/wbox.js"></script>
	<script type="text/javascript" src="js/registerValidate.js"></script>
  	<script type="text/javascript">
  		
  	</script>
  
  </head>
  
  <body>


		<div class="main-wrap">
			
	<div class="order">
		<!--begin map-->
	    <div class="map">
	    	<a class="index" href="orderIndex_indexDeal">订单首页</a>&nbsp;&gt;&nbsp;<a href="orderAction_shows">订单</a>
	    </div>
	    <!--end map-->
		<!--start main-->
		
		<ul class="ui-tab-menu">
            <li class="current"><a href="orderAction_shows">订&nbsp;&nbsp;&nbsp;单</a></li>
            <li><a href="orderSearch_showSeach?orderStatu.statuNum=-2">退货单</a></li>
            <li><a href="mainfile/order/ordPro.jsp">订单商品统计</a></li>
        </ul>
        
        <div class="main-t">
        	<!-- 普通搜索 -->
        	
			<form action="orderSearch_showSeach" method="get" id="myForm">
			    <input type="hidden" name="action" id="actionId" value="list"/>
			    <input type="hidden" name="searchType" id="searchType" value="1"/>
			    <input type="hidden" name="orderStatu.statuNum" id="statuNum" value=""/>
			    <input type="hidden" name="dateType" id="dateType" value=""/>
			    <input type="hidden" name="orderby" id="orderby" value=""/>
			    <input type="hidden" name="keyword" id="keyword" value=""/>
			    <div class="func clearfix">
			        <div class="btn-group">
			            <a class="ui-btn ui-btn-theme" href="mainfile/order/add.jsp"><span class="ui-btn-add-ico"></span><span class="ui-btn-txt">新&nbsp;&nbsp;增</span></a>
			        </div>
			        <div class="control-filter">筛选：
	                    <span id="order-filter-status" class="table-filter"></span>
	                    <div class="target_box shadow" id="order-filter-status-box" style="display: none;">
	                        <ul>
	                            <li><a href="javascript:void(0);" onclick="filterOrderByStatus()" class=selected>全部订单</a></li>
	                            <li><a href="javascript:void(0);" onclick="filterOrderByStatus(1)" >待处理订单</a></li>
	                            <li><a href="javascript:void(0);" onclick="filterOrderByStatus(0)" >已完成订单</a></li>
	                            <li><a href="javascript:void(0);" onclick="filterOrderByStatus(-1)" >正在退单中</a></li>
	                        </ul>
	                    </div>
	                </div>
	                
                	 排序：<span id="product-orderby" class="table-filter"></span>
                     <div class="target_box shadow product-orderby-target-box" id="product-orderby-box" style="display: none;">
                     <ul>
                     	
                     	<li><a href="javascript:void(0)" class="selected" onclick="queryByOrderBy(1)">下单时间</a><span class="">↑</span><span class="arrow theme-color fb">↓</span></li>
                     	<li><a href="javascript:void(0)" class="" onclick="queryByOrderBy(2)">订单状态</a><span class="">↑</span><span class="">↓</span></li>
                     	<li><a href="javascript:void(0)" class="" onclick="queryByOrderBy(3)">订单金额</a><span class="">↑</span><span class="">↓</span></li>
                     </ul>
                     </div>
				</div>
			</form>
			
			<!-- 普通搜索 -->
			
			<!-- 高级搜索 -->
			
			<!-- 高级搜索 -->
			
			<div class="table-wrap chks-table">
				<table>
					<tr>
		                <th class="tl" width=200>单号/下单时间</th>
		                <th class="tl">客户名称</th>
		                <th class="tr" width=90>金额/数目</th>
		                
		                <!-- <th class="tc" width=120>出库/发货</th> -->
		                <th class="tc" width=120>签单人</th>
		                <th class="tc" width=120>商品</th>
		                
		                <th class="tc" width=100>状态</th>
		                <th class="tc" width=100>操作</th>
		
					</tr> 
					<tbody>
						<s:iterator value="orders" var="top">
					    
					    <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140911-015101"><s:property value="#top.or_number"/></a>
					          
					          
					          <input type="hidden" class="order-num" value='<s:property value="#top.or_number"/>' />
					          </div>
					          <span class="lite-gray"><s:property value="#top.time"/></span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393"><s:property value="#top.customer.name"/></a></td>
		
						  <td class="tr pr10">
						  	<span><s:property value="#top.num"/></span><br />
						  	￥<span><s:property value="#top.order_money"/></span>
						  </td>
						  
						  <%-- <td class="tc order-logistics-status">
				            <span>已出库/已发货</span><br />
				            
				            <span class="order-logistics"><a href="/order/order?action=queryLogistics&orderNum=DH-O-20140911-015101" ><em class="ui-btn-logistics-orange-ico"></em>物流信息<em class="ui-arrow-icon"></em></a></span>
				            
						  </td> --%>
						  <td class="tc order-logistics-status">
						  	<span><s:property value="#top.employee.name"/></span><br />
				            <span><a href="">员工信息</a></span>
				            
						  </td>
						  
<%-- 						   <td class="tc order-logistics-status">
				            
				            
				            <span class="order-logistics"><a href="#" ><em class="ui-btn-logistics-orange-ico"></em>员工信息<em class="ui-arrow-icon"></em></a></span>
				            
						  </td>  --%>
						  
						  <td class="tc order-logistics-status">
						  	<span><s:property value="#top.product.name"/></span><br />
				            <span><a href="">商品信息</a></span>
				            
						  </td>
<%-- 						   <td class="tc order-logistics-status">
				            
				            
				            <span class="order-logistics"><a href="#" ><em class="ui-btn-logistics-orange-ico"></em>商品信息<em class="ui-arrow-icon"></em></a></span>
				            
						  </td>  --%>
						  
						  <td class="tc">
						  <div class='orange' >
						 	 <s:property value="#top.statu.statu"/>
						  </div>
						  </td>
						  <td class="tr">
							  <!-- <a href="/order/order?action=query&orderNum=DH-O-20140911-015101" class="theme-color" title="订单查详情">订单详情</a> -->
							  <s:if test='#top.statu.statuNum > 0'>
							  	<a class="theme-color ml5" href="mainfile/order/update.jsp?id=<s:property value='#top.id'/>" title="审核">审核</a>
							  </s:if>
							  <div class="cb"></div>
							  <a href="javascript:void(0)" class="theme-color order-pay" title="添加收款记录">添加收款记录</a>
						  </td>
					    </tr>
					</s:iterator>    
	
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6">								
								



<%-- <div class="page">
    <span>每页显示</span>
    <select class="select_page pageSel" id="select_page" onchange="selectPage()">
	    <option selected="selected" value="10">10</option>
		<option  value="15">15</option>
		<option  value="30">30</option>
	</select>
	<span>条</span>
    <div class="page-number">
        <span>第</span><input class="ui-pager-inp" type="text" value="1"  onkeyup="inputPage(this);" /> <span>页</span>
        <span>共</span>
        <span class="totalPage">1</span>
        <span>页</span>
        <div class="pn">
	        <a href="javascript:void(0);" onclick="goPage(1)" class="ui-pager-prev">上一页</a><a href="javascript:void(0);" onclick="goPage(1)" class="ui-pager-next">下一页</a>
	    </div>
    </div>
</div>
<span class="page-total">共计：10条</span> --%>
                   
<script type="text/javascript">

function goPage(page) {
	if(page <= 0){ 
		page = 1;
	}
	var pageSize = 10;
	window.location.href='http://corp2.dinghuo123.com/order/order?action=list&currentPage='+page+'&pageSize='+pageSize;
}
function inputPage(obj) {
	var event = window.event || arguments.callee.caller.arguments[0];
	if (event.keyCode == 13)
    {
		var page = parseInt(obj.value);
	    if(isNaN(page)) page=1;
	    if(page > parseInt($(".totalPage").text())) page = $(".totalPage").text();
		goPage(page);
    }
}
function selectPage() {
	var pageSize = $("#select_page").val();
	if(arguments.length != 0){
		pageSize = arguments[0];
	}
	var originalSize = 10;
	var currentPage = 1;
	var totalCount = 10;
	
	currentPage = currentPage==0 ? 1 : currentPage;
	totalCount = totalCount==0 ? 1 : totalCount;
	
	var totalPage = Math.ceil(totalCount/pageSize);
	currentPage = Math.round((originalSize/pageSize)*currentPage);
	if(currentPage<1) currentPage=1;
	if(currentPage>totalPage) currentPage=totalPage;
	
	window.location.href='http://corp2.dinghuo123.com/order/order?action=list&currentPage='+currentPage+'&pageSize='+pageSize;
	
}
</script>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			</div>
			<!--end main-->
			
</div>

		</div>
	</div>
	<input type="hidden" id="isTryModel" value="true" />
	<input type="hidden" id="customerName" value="代理商" />
	<input type="hidden" id="companyStatus" value="" />
	<input type="hidden" id="companyServicePaidFlag" value="1" />
	<input type="hidden" id="dbid" value="6102522" />
	<input type="hidden" id="isUseInventory" value="true" /><!-- 是否开启库存-->
	<input type="hidden" id="isOrderFreight" value="false" /><!-- 是否开启运费 -->
	
	<input type="hidden" id="isOrderDeliverDate" value="false" /><!-- 交货日期是否为必填 -->
	<input type="hidden" id="isUseProductImage" value="true" />
	<input type="hidden" id="isUseProductMulSpec" value="true" /> <!-- 是否启用多规格商品 -->
	<input type="hidden" id="isUseProductWeight" value="false" /> <!-- 是否启用商品重量统计 -->
	<input type="hidden" id="weightUnitName" value="" /> <!-- 商品重量统计单位 -->
	<input type="hidden" id="isUseProductProperty" value="true" /><!-- 是否启自定义字段 -->
	<input type="hidden" id="property1Name" value="" />
	<input type="hidden" id="property2Name" value="" />
	<input type="hidden" id="property3Name" value="" />
	<input type="hidden" id="property4Name" value="" />
	<input type="hidden" id="property5Name" value="" />
	<input type="hidden" id="property6Name" value="" />
	<input type="hidden" id="property7Name" value="" />
	<input type="hidden" id="property8Name" value="" />
	<input type="hidden" id="property9Name" value="" />
	<input type="hidden" id="property10Name" value="" />
	<input type="hidden" id="showSearchBox" value="">
</body>


<script type="text/javascript" src="js/order/r1.js?v=1411093498444"></script>
<script type="text/javascript" src="js/order/ui.min.js?v=1411093498444"></script>
<script type="text/javascript" src="js/order/handlebars.js?v=1411093498444"></script>
<script type="text/javascript" src="js/order/common.js?v=1411093498444"></script>
<script type="text/javascript" src="js/order/commonApp.js?v=1411093498444"></script>
<script type="text/javascript" src="js/order/statistics.js?v=1411093498444"></script>
<script type="text/javascript" src="js/order/floatService.js?v=1411093498444" defer="defer" async></script>


<!--[if lte IE 8]>
<script type="text/javascript" src="http://res2.dinghuo123.com/js/html5.js?v=1411093498444"></script>
<![endif]-->

<noscript>
	<div style="height:100%;width:100%;position: absolute;text-align:center;line-height:100px;background:#eff996;z-index:999;top:0;font-size:24px;font-family:微软雅黑">您的浏览器安全级别太高，需要在浏览器设置中降低安全级别。</div>
</noscript>


<script type="text/html" id="payCon">
<tr id="payTr">
	<td class="pay-td" colspan=7>
		<div class="pay-con hidden">
			<div class="order-pay-money-status">
				已付金额：￥<span class="order-payed-money mr20"></span>尚未付款：￥<span class="order-remain-money"></span>
				<input type="hidden" class="order-remain-money" value="" />
			</div>
			<div class="pay-box clearfix">
			</div>
		</div>
	</td>
</tr>
</script>



      
<link rel="stylesheet" href="css/order/jquery.Jcrop.css?v=1411093498444"/>
<script type="text/javascript" src="js/order/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="js/order/jquery.fileupload.js"></script>
 
<script type="text/javascript" src="js/order/jquery.Jcrop.js?v=1411093498444"></script>

<script type="text/javascript" src="js/order/orderList.js?v=1411093498444"></script>


<script type="text/javascript">
function filterOrderByStatus(status){	
	$("#searchType").val(1);
	$("#statuNum").val(status);
	$('#myForm').submit();
}

function queryByOrderBy(orderby){
	$("#orderby").val(orderby);
	$("form").submit();
}

function switchFilter(key){
	$(".order-status-checkboxs").hide();
	$(".deliverStatus-label-radios").hide();
	$(".outStorageStatus-label-radios").hide();
	$(".payStatus-label-radios").hide();
	$("input[name=orderStatusType]").val(key);
	switch(key){
		case 1:
			$("#orderSearch-filter-status").html("订单状态");
			$(".order-status-checkboxs").show();
			break;
		case 2:
			$("#orderSearch-filter-status").html("订单出库");
			$(".outStorageStatus-label-radios").show();
			break;
		case 3:
			$("#orderSearch-filter-status").html("订单发货");
			$(".deliverStatus-label-radios").show();
			break;
		case 4:
			$("#orderSearch-filter-status").html("订单收付款");
			$(".payStatus-label-radios").show();
			break;
	}
}

function switchSearchTimeType(type){
	$("input[name=searchTimeType]").val(type);
	if("createTime" == type){
		$("#searchTimeType-filter-status").html("下单时间");		
	}else{
		$("#searchTimeType-filter-status").html("报表统时间");
	}
}

$(function(){
	$(".deliverStatus-label-radios").hide();
	$(".outStorageStatus-label-radios").hide();
	$(".payStatus-label-radios").hide();
	
	$(".deliverStatus-label-radios").cssRadio();
	$(".outStorageStatus-label-radios").cssRadio();
	$(".payStatus-label-radios").cssRadio();
	$(".order-label-radios").cssRadio();
	
	$(".order-type-radios").cssRadio({
		callback:function(){
			 $("input[name=orderType]").change();
		 }
	});
	
	$("input[name=orderType]").die().live("change",function(){
		if($("input[name=orderType][checked]").val() == 2){
			window.location.href="/order/returnOrder?action=list&operation=search&showSearchBox=true";
		}
	});
	
	switchFilter(parseInt($("input[name=orderStatusType]").val()));
	switchSearchTimeType($("input[name=searchTimeType]").val());
	
	$(".btn-search").click(function(){
		$("#searchForm").attr("action", "/order/order");
		$("#searchForm").submit();
	});
	
	if($("input[name=beginDate]").val() == ""){
		$("input[name=beginDate]").val((new Date().addDays(-31)).Format("yyyy-MM-dd"));		
	}
	if($("input[name=endDate]").val() == ""){
		$("input[name=endDate]").val((new Date()).Format("yyyy-MM-dd"));		
	}
	
	$(".delete").click(function(){
		var orderNum = $(this).parents("tr").find(".order-num").val();
		$.dialog.confirm("确定删除订单？删除订单为不可逆操作",function(){
			var data = {};
			data.orderNums=orderNum;
			$.ajax({
				 url:"/order/order?action=delete",
				 type:"POST",
				 data:data,
				 dataType:"JSON",
				 success:function(responseText){
					 if(responseText.code == 200){
						 $.dialog.tips("订单删除成功",1,"success.gif",function(){
							 window.location.reload();
						 });
					 }
					 else {
						 Public.Ajax.handleResponseText(responseText);
					 }
					
				 }
			 });
			
		},function(){return;});
	});
});


</script>

</html>







<%-- <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140911-014801">DH-O-20140911-014801</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140911-014801" />
					          </div>
					          <span class="lite-gray">2014-09-11 16:23</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥220.00</td>
						  
						  <td class="tc order-logistics-status">
				            <span>部分出库/部分发货</span><br />
				            
				            <span class="order-logistics"><a href="/order/order?action=queryLogistics&orderNum=DH-O-20140911-014801" ><em class="ui-btn-logistics-orange-ico"></em>物流信息<em class="ui-arrow-icon"></em></a></span>
				            
						  </td>
						  
						  <td class="tc">
						  <div class='orange' >待出库审核</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140911-014801" class="theme-color" title="订单查详情">订单详情</a>
							  
								  
							  		
								  		<a class="theme-color ml5" href="/order/order?action=queryLogistics&orderNum=DH-O-20140911-014801" title="审核">审核</a>
							  		
						  	  
						  	  
							  	
							  <div class="cb"></div>
							  
							  <a href="javascript:void(0)" class="theme-color order-pay" title="添加收款记录">添加收款记录</a>
							  
						  </td>
					    </tr>
					    
					    <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140911-014501">DH-O-20140911-014501</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140911-014501" />
					          </div>
					          <span class="lite-gray">2014-09-11 16:22</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥1,400.00</td>
						  
						  <td class="tc order-logistics-status">
				            <span>部分出库/待发货</span><br />
				            
						  </td>
						  
						  <td class="tc">
						  <div class='orange' >待出库审核</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140911-014501" class="theme-color" title="订单查详情">订单详情</a>
							  
								  
							  		
								  		<a class="theme-color ml5" href="/order/order?action=queryLogistics&orderNum=DH-O-20140911-014501" title="审核">审核</a>
							  		
						  	  
						  	  
							  	
							  <div class="cb"></div>
							  
							  <a href="javascript:void(0)" class="theme-color order-pay" title="添加收款记录">添加收款记录</a>
							  
						  </td>
					    </tr>
					    
					    <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140911-014301">DH-O-20140911-014301</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140911-014301" />
					          </div>
					          <span class="lite-gray">2014-09-11 16:22</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥998.00</td>
						  
						  <td class="tc order-logistics-status">
				            <span>已出库/待发货</span><br />
				            
						  </td>
						  
						  <td class="tc">
						  <div class='orange' >待发货确认</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140911-014301" class="theme-color" title="订单查详情">订单详情</a>
							  
								  
								  		<a class="theme-color ml5" href="/order/order?action=query&orderNum=DH-O-20140911-014301" title="审核">审核</a>
							  		
							  		
						  	  
						  	  
							  	
							  <div class="cb"></div>
							  
						  </td>
					    </tr>
					    
					    <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140911-014201">DH-O-20140911-014201</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140911-014201" />
					          </div>
					          <span class="lite-gray">2014-09-11 16:21</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥710.00</td>
						  
						  <td class="tc order-logistics-status">
				            <span>备货中/待发货</span><br />
				            
						  </td>
						  
						  <td class="tc">
						  <div class='orange' >待出库审核</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140911-014201" class="theme-color" title="订单查详情">订单详情</a>
							  
								  
							  		
								  		<a class="theme-color ml5" href="/order/order?action=queryLogistics&orderNum=DH-O-20140911-014201" title="审核">审核</a>
							  		
						  	  
						  	  
							  	
							  <div class="cb"></div>
							  
							  <a href="javascript:void(0)" class="theme-color order-pay" title="添加收款记录">添加收款记录</a>
							  
						  </td>
					    </tr>
					    
					    <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140911-014001">DH-O-20140911-014001</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140911-014001" />
					          </div>
					          <span class="lite-gray">2014-09-11 16:20</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥130.00</td>
						  
						  <td class="tc order-logistics-status">
				            <span>备货中/待发货</span><br />
				            
						  </td>
						  
						  <td class="tc">
						  <div class='orange' >待财务审核</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140911-014001" class="theme-color" title="订单查详情">订单详情</a>
							  
								  
								  		<a class="theme-color ml5" href="/order/order?action=query&orderNum=DH-O-20140911-014001" title="审核">审核</a>
							  		
							  		
						  	  
						  	  
							  	
							  <div class="cb"></div>
							  
							  <a href="javascript:void(0)" class="theme-color order-pay" title="添加收款记录">添加收款记录</a>
							  
						  </td>
					    </tr>
					    
					    <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140911-004301">DH-O-20140911-004301</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140911-004301" />
					          </div>
					          <span class="lite-gray">2014-09-11 10:28</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥173.60</td>
						  
						  <td class="tc order-logistics-status">
				            <span>已出库/已发货</span><br />
				            
				            <span class="order-logistics"><a href="/order/order?action=queryLogistics&orderNum=DH-O-20140911-004301" ><em class="ui-btn-logistics-orange-ico"></em>物流信息<em class="ui-arrow-icon"></em></a></span>
				            
						  </td>
						  
						  <td class="tc">
						  <div  >已完成</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140911-004301" class="theme-color" title="订单查详情">订单详情</a>
							  
						  	  
							  
							  	 <a class="theme-color" href="/order/order?action=query&orderNum=DH-O-20140911-004301" title="作废">作废</a>
							  	
							  <div class="cb"></div>
							  
							  <a href="javascript:void(0)" class="theme-color order-pay" title="添加收款记录">添加收款记录</a>
							  
						  </td>
					    </tr>
					    
					    <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140911-002401">DH-O-20140911-002401</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140911-002401" />
					          </div>
					          <span class="lite-gray">2014-09-11 10:18</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥420.00</td>
						  
						  <td class="tc order-logistics-status">
				            <span>已出库/已发货</span><br />
				            
				            <span class="order-logistics"><a href="/order/order?action=queryLogistics&orderNum=DH-O-20140911-002401" ><em class="ui-btn-logistics-orange-ico"></em>物流信息<em class="ui-arrow-icon"></em></a></span>
				            
						  </td>
						  
						  <td class="tc">
						  <div  >已完成</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140911-002401" class="theme-color" title="订单查详情">订单详情</a>
							  
						  	  
							  
							  	 <a class="theme-color" href="/order/order?action=query&orderNum=DH-O-20140911-002401" title="作废">作废</a>
							  	
							  <div class="cb"></div>
							  
						  </td>
					    </tr>
					    
					    <tr class="lite-gray" >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140910-013301">DH-O-20140910-013301</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140910-013301" />
					          </div>
					          <span class="lite-gray">2014-09-10 18:26</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥558.60</td>
						  
						  <td class="tc order-logistics-status">
				            <span>备货中/待发货</span><br />
				            
						  </td>
						  
						  <td class="tc">
						  <div  >已作废</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140910-013301" class="theme-color" title="订单查详情">订单详情</a>
							  
						  	  
							 	 <a class="lite-gray delete" href="javascript:void(0)" title="删除">删除</a>
							  
							  	
							  <div class="cb"></div>
							  
						  </td>
					    </tr>
					    
					    <tr  >
					      <td class="tl pl10">
					          <div><a class="serial" href="/order/order?action=query&orderNum=DH-O-20140910-013201">DH-O-20140910-013201</a>
					          
					          
					          <input type="hidden" class="order-num" value="DH-O-20140910-013201" />
					          </div>
					          <span class="lite-gray">2014-09-10 18:26</span>
					      </td>
						  <td class="tl pl10"><a class="company" target="_blank" href="/customer/customer?action=load&id=20378393">易订货演示帐号A店</a></td>
		
						  <td class="tr pr10">￥957.60</td>
						  
						  <td class="tc order-logistics-status">
				            <span>备货中/待发货</span><br />
				            
						  </td>
						  
						  <td class="tc">
						  <div class='orange' >待订单审核</div>
						  </td>
						  <td class="tr">
							  <a href="/order/order?action=query&orderNum=DH-O-20140910-013201" class="theme-color" title="订单查详情">订单详情</a>
							  
								  
								  		<a class="theme-color ml5" href="/order/order?action=query&orderNum=DH-O-20140910-013201" title="审核">审核</a>
							  		
							  		
						  	  
						  	  
							  	
							  <div class="cb"></div>
							  
							  <a href="javascript:void(0)" class="theme-color order-pay" title="添加收款记录">添加收款记录</a>
							  
						  </td>
					    </tr> --%>
