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
<title>订单的工作台</title>
<link rel="stylesheet" href="css/order/c.css?v=1411093498444" /> 
 
<link rel="stylesheet" href="css/order/jquery.jqplot.css?v=1411093498444" /> 

</head>
<body>

	<div class="r-wrap">
		
<!--end header-->
		<div class="main-wrap">
			
	<div class="workbench">
		<!--begin map-->
		<div class="map">
		    <a class="index" href="orderIndex_indexDeal">订单首页</a>&nbsp;&gt;&nbsp;<a href="orderAction_shows">订单</a>	<span class="last-login"><!-- 上次登录时间：2014-09-21 11:41:46 --></span>
		    <a href="/index" class="tip ui-icon-blue-info ydh-web-tip">厂商tip</a>
		</div>
		<!--end map-->
		<!--begin main-->
		<div class="main-t clearfix">
			<!-- 右边布局 -->
			<div class="work-bench-r">
				<!-- 待处理订单 -->
		        <div class="pending-order">
		            <dl>
		                <dt><span class="title">待处理订单</span></dt>
		                <dd><a href="orderSearch_showSeach?orderStatu.statuNum=1">订货单：<s:property value="unDealNum"/>笔</a>￥<s:property value="unDealNumMonay"/></dd>
		                <dd><a href="orderSearch_showSeach?orderStatu.statuNum=-1">退货单：<s:property value="unProceNum"/>笔</a>￥<s:property value="unProceNumMonay"/></dd>
		            </dl>
		        </div>
		        <!-- 最新通知 -->
		        <div class="latest-notice">
		            <dl>
		                <dt><span class="title">最新通知</span> <a class="more" href="/message/notification?action=list">更多&gt;</a></dt>
		                <dd>
		                	<a href="/message/notification?action=query&id=16137723" title="2014中秋放假通知">
		                			2014中秋放假通知
		                	</a>
		                	<span class="datetime">2014-09-13</span>
		                </dd>
		                
		                <dd>
		                	<a href="/message/notification?action=query&id=16137722" title="促销活动公告">		
		                			促销活动公告
		                	</a>
		                	<span class="datetime">2014-09-13</span>
		                </dd>
		                <!-- 这里循环11条 -->
		            </dl>
		        </div>
		        
		    </div>
		    <!-- 左边布局 -->
		    <div class="work-bench-l">
		        <!--begin 今日简报-->
		        <div class="today-presentation">
		            <dl>
		                <dt>
		                    <span class="totay-1">今日简报</span>
		                    <span class="totay-2">订货单</span>
		                    <span class="totay-3">订货金额</span>
		                    <span class="totay-4">退货单</span>
		                    <span class="totay-5">退货金额</span>
		                </dt>
		                <dd>
		                    <span class="totay-1">今日</span>
		                    <span class="totay-2"><s:property value="todayTradeNum"/>笔</span>
		                    <span class="totay-3">￥<s:property value="todayTradeNumMoney"/></span>
		                    <span class="totay-4"><s:property value="todayCancelNum"/>笔</span>
		                    <span class="totay-5">￥<s:property value="todayCancelNumMoney"/></span>
		                </dd>
		                <dd>
		                    <span class="totay-1">本月</span>
		                    <span class="totay-2"><s:property value="monthTradeNum"/>笔</span>
		                    <span class="totay-3">￥<s:property value="monthTradeNumMoney"/></span>
		                    <span class="totay-4"><s:property value="monthCancelNum"/>笔</span>
		                    <span class="totay-5">￥<s:property value="monthCancelNumMoney"/></span>
		                </dd>
		                <dd>
		                    <span class="totay-1">本年</span>
		                    <span class="totay-2"><s:property value="yearTradeNum"/>笔</span>
		                    <span class="totay-3">￥<s:property value="yearTradeNumMoney"/></span>
		                    <span class="totay-4"><s:property value="yearCancelNum"/>笔</span>
		                    <span class="totay-5">￥<s:property value="yearCancelNumMoney"/></span>
		                </dd>
		            </dl>
		        </div>
		        <!--end 今日简报-->
		
		        <!--begin 业务简报-->
		        <div class="business-presentation">
		        	<dl>
		                <dt class="briefreporttab"><span class="title">业务简报</span>
		                	<span class="briefreporttab-radios">
			                	<label class="radio"><input type="radio" name="dateSegment" value="4" />月</label>
			                	<label class="radio"><input type="radio" name="dateSegment" value="5" />半年</label>
			                	<label class="radio"><input type="radio" name="dateSegment" value="6" />年</label>
		                	</span>
			                <!-- <a href="javascript:void(0)" data="onemonth" class="workbench-tab current" id="briefonemonth">月</a>
							<a href="javascript:void(0)" data="halfyear" class="workbench-tab" id="briefhalfyear">半年</a>
							<a href="javascript:void(0)" data="oneyear" class="workbench-tab" id="briefoneyear">年</a> -->
						</dt>
	                </dl>
	                <div class="order-unit">订货金额（元）</div>
	                <div id="chart1" style="width:98%;height:230px;"></div>
	                
		        </div>
		        <!--end 业务简报-->
		
		    </div>
		</div>
		<!--end main-->
	</div>
	<input type="hidden" id="isCeo" value="1" />
	<input type="hidden" id="isPaid" value="1" />
	<input type="hidden" id="serviceEndDate" value="2100-01-01" />

		</div>
	</div>
	<input type="hidden" id="isTryModel" value="true" />
	<input type="hidden" id="customerName" value="代理商" />
	<input type="hidden" id="companyStatus" value="" />
	<input type="hidden" id="companyServicePaidFlag" value="1" />
	<input type="hidden" id="dbid" value="7119609" />
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
<script type="text/javascript" src="http://res2.dinghuo123.com/js/html5.js?v=1411122445874"></script>
<![endif]-->

<noscript>
	<div style="height:100%;width:100%;position: absolute;text-align:center;line-height:100px;background:#eff996;z-index:999;top:0;font-size:24px;font-family:微软雅黑">您的浏览器安全级别太高，需要在浏览器设置中降低安全级别。</div>
</noscript>

<script type="text/javascript" src="js/order/chart.min.js?v=1411122445874"></script>


<!--[if lt IE 9]>
<script language="javascript" type="text/javascript" src="http://res2.dinghuo123.com/js/charts/excanvas.js"></script>
<![endif]-->



      
<!--grid-->

<script type="text/javascript" src="js/order/grid.min.js?v=1411122445874"></script>


<!--end grid-->
<script type="text/plain" id="rankli">
<dd><em></em><span class="ranktitle"></span><span class="rankprice"></span></dd>
</script>

<script type="text/javascript" src="js/order/index.js?v=1411122445874"></script>



</html>