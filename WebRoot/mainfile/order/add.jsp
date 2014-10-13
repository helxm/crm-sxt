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
	
	<link rel="stylesheet" href="js/wbox/wbox/wbox.css" type="text/css"></link>
  	<LINK href="css/public.css" type=text/css rel=stylesheet>
	<LINK href="css/login.css" type=text/css rel=stylesheet>
	
	<link rel="stylesheet" href="css/order/c.css?v=1411093498444" />   
	<link rel="stylesheet" href="css/order/jquery.jqplot.css?v=1411093498444" />  
	 
	<%-- <script src="//hm.baidu.com/hm.js?e6a820e58d40d6bbfdaa42e767e97522"></script> --%>
	<script type="text/javascript" src="js/wbox/jquery1.4.2.js"></script>
	<script type="text/javascript" src="js/wbox/wbox.js"></script>
	<script type="text/javascript" src="js/registerValidate.js"></script>
	
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/wbox/wbox.js"></script>
	<script type="text/javascript" src="js/registerValidate.js"></script>
	<script type="text/javascript" src="js/My97DatePicker/My97DatePicker/WdatePicker.js"></script>
  	<script type="text/javascript">
  		
  		$(document).ready(function(){
  			
  			var operate = $("#operate").val();
  			console.info(operate);
  			if(operate == 2){
  				alert("恭喜您，操作成功！");
  			}else if(operate == 1){
  				alert("抱歉，操作失败！");
  			} 
  			
  			$.ajax({
  				url:'orderAction_selCu',
  				dataType:'json',
  				success:function(data){
  					console.info("data:"+data);
  					$.each(data,function(i,custom){
  						console.info("custom:"+custom.name);
  						$("#opc").clone().html(custom.name).attr("name","order.customer.id").attr("value",custom.id).appendTo("#selc")
  					});
  				}
  			});
  		});
  		
  		function selPro(){
  			
  			$.ajax({
  				url:"orderAction_selPro",
  				dataType:'json',
  				success:function(data){
  					console.info(data);
  					$.each(data,function(i,product){
  						$("#opp").clone().html(product.name).attr("name","order.product.id").attr("value",product.id).appendTo("#selp")
  					});
  				}
  			});
  		}
  		//ajax提交客户、商品类型、交易数据，生成价格返回
  		function calculateOm(num){
  			var cu_id = $("#selc").val();
  			var pr_id = $("#selp").val();
  			var number = $(num).val();
  			console.info(cu_id);
  			console.info(pr_id);
  			console.info(number);
  			$.ajax({
  				url:"orderAction_calucatePrice",
  				data:"order.customer.id="+cu_id+"&order.product.id="+pr_id+"&order.num="+number,
  				success:function(order_money){
  					console.info(order_money);
  					$("#om").attr("value",order_money)
  				}
  			});
  		}
  		//生成订单编号,由8位日期+4位商品编号+4位客户编号+uuid，最终截取前16位
  		function calurateOn(time){
  			var cu_id = $("#selc").val();
  			var pr_id = $("#selp").val();
  			var _time = $(time).val();
  			console.info(cu_id);
  			console.info(pr_id);
  			console.info(_time);
  			$.ajax({
  				type:"post",
  				dataType:'json',
  				url:"orderAction_calucateOr_number",
  				data:"order.customer.id="+cu_id+"&order.product.id="+pr_id+"&order.time="+_time,
  				success:function(order){
  					console.info(order);
  					$("#on").attr("value",order.or_number)
  				}
  			});
  		}
  	</script>
  
  </head>
  
  <body>
		<div class="main-wrap">		
	<div class="order">
		<!--begin map-->
	    <div class="map">
	    	<a class="index" href="orderIndex_indexDeal">订单首页</a>&nbsp;&gt;&nbsp;<a href="orderAction_shows">订单</a>&nbsp;&gt;&nbsp;新增订货单
	    </div>
        <div class="main-t">	
			<div class="table-wrap chks-table">		
				<table>
						<form action="orderAction_add">
							<tr>
								<td  class="tl" width=50>客户名</td>
								<td><select id="selc" onchange="selPro();" name="order.customer.id">
										<option id="opc">--请选择--</option>
								</select></td>
							</tr>
							<tr>
								<td class="tl" width=50>商品名</td>
								<td><select id="selp" name="order.product.id">
										<option id="opp">--请选择--</option>
								</select></td>
							</tr>
							<tr>
								<td class="tl" width=50>交易数量</td>
								<td><input name="order.num" onchange="calculateOm(this);"></td>
							</tr>
							<tr>
								<td class="tl" width=50>交易额度</td>
							
								<td><input id="om" name="order.order_money" value="">
								<!-- 系自动生成 --></td>
							</tr>
							<tr>
								<td class="tl" width=50>未付金额</td>
								
								<td><input name="order.unpay_money" value=""></td>
							</tr>
							<tr>
								<td class="tl" width=50>订单状态</td>
								
								<td><input name="order.statu.id" value=""></td>
							</tr>
							<tr>
								<td class="tl" width=50>交易员工</td>
								
								<td><input  value=""></td>
							</tr>
							<tr>
								<td class="tl" width=50>交易时间</td>
								
								<td><input class="Wdate" type="text"
									onClick="WdatePicker()" name="order.time"
									onchange="calurateOn(this);"
								></td>
							</tr>
							<tr>
								<td class="tl" width=50>订单编号</td>
								<td><input id="on" name="order.or_number" value=""></td>
							</tr>
							<tr>
								<td><input type="hidden" id="operate" value="${request.operate }"></td>
								<td><input type="submit"   value="提交"></td>
							</tr>

						</form>
						<tfoot>
						<tr>
							<td colspan="6">								
								
                   
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
	$("#order_status").val(status);
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

