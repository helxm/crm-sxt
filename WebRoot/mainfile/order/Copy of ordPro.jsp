<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>订单商品统计</title>

<link rel="stylesheet" href="css/order/c.css?v=1411093498444" /> 
 
<link rel="stylesheet" href="css/order/jquery.jqplot.css?v=1411093498444" /> 
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
</head>
<body>

<div class="side-wrap">
    <h1 class="logo"><a title="易订货，让订货不再麻烦！" href="/">易订货</a></h1>
    <div class="side-menu">
        <ul>
            <li id="order"><a class="order" href="/order/order?action=list">订单</a></li>
            <li id="customer"><a class="customer" href="/customer/customer?action=list&customerStatus=0">代理商</a></li>
            <li id="product"><a class="product" href="/product/product?action=list&status=0">商品</a></li>
            <li id="pay"><a class="pay" href="/pay/payment?action=list">资金</a></li>
            <li id="message"><a class="message" href="/message/notification?action=list">通知</a></li>
            <li id="report"><a class="report" href="/report/report?action=load&reportType=business&statisticsType=2&dateSegment=4">报表</a></li>
        </ul>
    </div>
</div>

	<div class="r-wrap">

<!--end header-->

		<div class="main-wrap">
			
	<div class="order">
		<!--begin map-->
	    <div class="map">
	    	<a class="index" href="orderIndex_indexDeal">订单首页</a>&nbsp;&gt;&nbsp;<a href="orderAction_shows">订单</a>
	    </div>
	    <!--end map-->
		<!--start main-->
		<ul class="ui-tab-menu">
            <li><a href="orderAction_shows">订货单</a></li>
            <li><a href="orderSearch_showSeach?orderStatu.statuNum=-2">退货单</a></li>
            <li class="current"><a href="mainfile/order/ordPro.jsp">订单商品统计</a></li>
        </ul>
        
<!-- form表单提交的数据
beginDate:2014-06-11
endDate:2014-09-02
customerName:代理商A
productTypeName:家用电器
status:0
action:queryContent
forward:data
orderType:1
productTypeId:35519662
productTypeIds:[]
customerId:23774793   --> 
        
		<form action="/order/order?action=queryContent" method="get" id="myForm">
			<div class="main-t">
		    <div class="func clearfix">
		    <div class="btn-group">
		    	<a href="javascript:void(0)" class="ui-btn ui-btn-theme export">导出数据</a>
		    </div>
		    <div class="control-box">
               	<div class="control-group control-group-line">
                   <div class="control-label"><span>时段选择</span></div>
                   <div class="control-input">
                   	<input class="ui-datepicker-inp datepickerStart valid" id="report_dateFrom" name="beginDate" value="" type="text">
                   </div>                        						
	<div class="control-label control-label-2"><span>至</span></div>
                   <div class="control-input">
		<input class="ui-datepicker-inp datepickerEnd" id="report_dateTo" name="endDate" value="" type="text">
                   </div>
               </div>
            </div>
            <div class="control-box">
           		<div class="control-group">
	               	<div class="control-label"><span>选择代理商</span></div>
	               	<div class="control-input">
	               		<span class="ui-combo-wrap" id="customerNameCombo" style="width:338px;">
		                	<input type="text" name="customerName" class="input-txt" style="width:298px;" autocomplete="off" value="">
		                	<i class="trigger"></i>
		                </span>
	               	</div>
               	</div>
           </div>
           <div class="control-box">
               	<div class="control-group">
               		<div class="control-label"><span>选择商品分类</span></div>
               		<div class="control-input productTypeComboBox">
						<span class="ui-combo-wrap"  id="productType" style="width:338px;">
							<input type="text" name="productTypeName" class="input-txt name" value="" readonly="readonly" style="cursor: default;width:298px;"><input type="hidden" class="cur-id" value="" /><i class="trigger"></i>
						</span>
					</div>
               	</div>
           </div>
           <div class="control-box">
               	<div class="control-group">
               		<div class="control-label"><span>选择订单状态</span></div>
               		<div class="control-input order-status-checkboxs">
						<label><input type="checkbox" name="status"  value="-9">全部</label>
						<label><input type="checkbox" name="status"  value="0">待订单审核</label>
						<label><input type="checkbox" name="status"  value="1">待财务审核</label>
						<label><input type="checkbox" name="status"  value="2">待出库审核</label>
						<label><input type="checkbox" name="status"  value="3">待发货确认</label>
						<label><input type="checkbox" name="status"  value="4">待收货确认</label>
					</div>
               	</div>
           </div>
           <div class="cb"></div>
           <div class="control-box ">
           <div class="control-group">
              	<div class="control-label"></div>
              	<div class="control-input">
	              	<a href="javascript:void(0);" class="ui-btn ui-btn-default" id="queryContent">查询</a>
	            </div>
            </div>
           </div>
		   </div>
			<div class="table-wrap chks-table">
				<table>
					<tr>
					 	<th class="tl" width=120>代理商名称</th>
					 	<th class="tl" width=120>订单号</th>
					 	<th class="tc" width=60>订单状态</th>
					 	<th class="tl" width=70>下单日期</th>
		                <th class="tl" width=70>商品编码</th>
		                <th class="tl" width=150>商品名称</th>
		                <th class="tc" width=30>数量</th>
		                <th class="tr" width=90>单价</th>
		                <th class="tr" width=70>小计金额</th>
		                <th class="tc" width=60>是否赠品</th>
		                
		                
					</tr>
					<tbody>
						
							<tr><td colspan="10"><div class="list-none-text">暂无数据</div></td></tr>
						
						
						
					</tbody>
					<tfoot>
						<tr>
							<td colspan="10">								
								


                   
<script type="text/javascript">
/* 
function goPage(page) {
	if(page <= 0){ 
		page = 1;
	}
	var pageSize = 0;
	window.location.href=''+page+'&pageSize='+pageSize;
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
	var originalSize = 0;
	var currentPage = 0;
	var totalCount = 0;
	
	currentPage = currentPage==0 ? 1 : currentPage;
	totalCount = totalCount==0 ? 1 : totalCount;
	
	var totalPage = Math.ceil(totalCount/pageSize);
	currentPage = Math.round((originalSize/pageSize)*currentPage);
	if(currentPage<1) currentPage=1;
	if(currentPage>totalPage) currentPage=totalPage;
	
	window.location.href=''+currentPage+'&pageSize='+pageSize;
	
} */
</script>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			</div>
			<!--end main-->
			<input type="hidden" name="action" value="queryContent"/>
		    <input type="hidden" name="forward" id="forward" value="data"/>
		    <input type="hidden" name="orderType" id="orderType" value="1"/>
			<input type="hidden" name="productTypeId" id="productTypeId" value=''/>
			<input type="hidden" name="productTypeIds" id="productTypeIds" value='' />
			
			<input type="hidden" name="customerId" id="customerId" value='' />
		</form>	
</div>



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


<script type="text/javascript">
var THISPAGE = {};
$(function(){
	if($("input[name=beginDate]").val() == "" && $("input[name=endDate]").val() == ""){
		var d = new Date();
		d.setMonth(d.getMonth()-3);
		var lastThreeMonth = d.Format("yyyy-MM-dd");
		$("input[name=beginDate]").val(lastThreeMonth);
		$("input[name=endDate]").val((new Date()).Format("yyyy-MM-dd"));
	}
	//商品分类
	$("#productType").productTypeCombo({
		curId:parseInt($(".cur-id").val()),
		url:"/product/type?action=queryTypeTree",//ajax请求分类数据的接口
		width:340,
		callback:{
			nameClick : function(elem){
				var id = elem.find(".type-id").val();
				var itemData = elem.data("typeInfo");
				var leafIds = [];
				if(id == ""){
					$("#productTypeId").val("");
					$("#productTypeIds").val("[]");
				}else{
					var typeLevel = elem.data("typeInfo").typeLevel;
					var typeData = $("#productType").data("typeData");
					var queryId = id;
					var childTypes = [];
					function findAllChildType(typeData, parentType,childTypes){
						if(childTypes == null || typeof(childTypes) == "undefined"){
							childTypes = [];
						}
						// 遍历当前父类型下一层级的所有子类型
						if(typeData[parentType.typeLevel + 1] instanceof Array && typeData[parentType.typeLevel + 1].length > 0){
							var subTypes = typeData[parentType.typeLevel + 1];
							$(subTypes).each(function(i){
								// 判断子类型中是否有属于当前父类型的子类型
								if(subTypes[i].parentTypeId == parentType.id){
									// 如果是当前父类型的子类型, 再判断是不是叶子类型, 是的话就添加到子类型中, 否的话就继续递归遍历
									if(subTypes[i].leafTypeFlag == "1"){
										childTypes.push(subTypes[i]);
									}else{
										findAllChildType(typeData, subTypes[i], childTypes);
									}					
								}
							});
							
						}
						
						return childTypes;
					}
					var ids = findAllChildType(typeData, itemData,childTypes);
					for(var i = 0,ilen = ids.length; i < ilen; i++){
						leafIds.push(ids[i].id);
					}
					$("#productTypeId").val($(".cur-id").val());
					$("#productTypeIds").val($.toJSON(leafIds));
				}
			},
			complete:function(){
				$('<div class="item" style=""><a class="name" href="javascript:void(0)">全部类别</a><input type="hidden" class="type-id" value="" autocomplete="off"></div>').prependTo($("#productType").next().find(".type-info"));
				if($(".cur-id").val() == ""){
					$("input.type-id[value='']").parents(".item").find(".name").trigger("click");
				}
			}
		}
	});

	
	//客户列表--/customer/customer?action=listSummary&pageSize=100...1411301285222&timestamp=1411301285&submitType=ajax
	//{"code":200,"message":"操作成功","data":[{"id":23774792,"name":"易订货演示帐号A店"},{"id":23774793,"name":"代理商A"}]}
	//{"code":200,"message":"操作成功!","data":[{"id":1,"name":"张总"},{"id":2,"name":"王五"},{"id":3,"name":"李四"},{"id":4,"name":"王二"},{"id":5,"name":"狗剩"}]}
	Public.Ajax.get({},"ordProdcQuery_ajaxProduct?time="+new Date().getTime(),false,function(responseText){
        if(responseText.code == 200){
        	//代理商信息
            THISPAGE.agentInfo = responseText.data;
            THISPAGE.agentInfo.unshift({id:0,name:"全部"});
        }else{
            Public.Ajax.handleResponseText(responseText);
            return;
        }
    });
	
	//客户下拉框
	THISPAGE.customerCombo = $("#customerNameCombo").combo({
		data:function(){
			return THISPAGE.agentInfo;
		},
		formatText: function(row){
            return row.name;
        },
        text: 'name',
        value: 'id',
        defaultSelected: ["id",parseInt($("#customerId").val()) || 0],
        forceSelection: true,
        noDataText: '暂无数据',
        focusExpand:true,
        cache: false,
        width:340,
        callback:{
            onChange:function(data){
            	$("input[name=customerId]").val(data.id);
            }
        }
	}).getCombo();
	
	
	$("#queryContent").click(function(){
		/*var formData = {
			forward : "data",
			productTypeIds : $("#productTypeIds").val(),
			productTypeId : $("#productTypeId").val(),
			customerId : THISPAGE.customerCombo.getValue(),
			beginDate : $(".datepickerStart").val(),
			endDate : $(".datepickerEnd").val()
		};*/
		//window.location.href = '/order/order?action=queryContent&forward=data&productTypeId='+formData.productTypeId+'&productTypeIds='+formData.productTypeIds+'&customerId='+formData.customerId+'&beginDate='+formData.beginDate+'&endDate='+formData.endDate;
		$("input[name=action]").val("queryContent");
		$("#myForm").attr("action","orderSearch_query");
		$("#myForm").submit();
	});
	
	$(".export").click(function(){
		/*var formData = {
				forward : "data",
				productTypeIds : $("#productTypeIds").val(),
				productTypeId : $("#productTypeId").val(),
				customerId : THISPAGE.customerCombo.getValue(),
				beginDate : $(".datepickerStart").val(),
				endDate : $(".datepickerEnd").val()
			};*/
		$("input[name=action]").val("queryContentExport");
		$("#myForm").attr("action","/report/excel");
		$("#myForm").submit();
		//window.open('/report/excel?action=queryContentExport&forward=data&productTypeName='+$('input[name=productTypeName]').val()+'&customerName='+THISPAGE.customerCombo.getText()+'&productTypeId='+formData.productTypeId+'&productTypeIds='+formData.productTypeIds+'&customerId='+formData.customerId+'&beginDate='+formData.beginDate+'&endDate='+formData.endDate);
	});
	
});
</script>
 

<!-- 	//商品分类
	$("#productType").productTypeCombo({
		curId:parseInt($(".cur-id").val()),
		//product/type?action=queryTypeTree&t=1411301285178
		var datas = {"code":200,"message":"查询成功","data":
		{"1":[
		{"dbid":7119609,"id":35519658,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"服装箱包","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519689,"isDefault":"","leafTypeFlag":"0","modifyTime":"","name":"食品饮料","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519664,"isDefault":"","leafTypeFlag":"0","modifyTime":"","name":"餐饮","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519663,"isDefault":"","leafTypeFlag":"0","modifyTime":"","name":"图书音像","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519662,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"家用电器","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519661,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"数码产品","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519660,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"电脑周边","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519659,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"家居家具","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519657,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"个护化妆","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519656,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"汽车用品","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519655,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"珠宝首饰","parentTypeId":0,"status":"0","typeLevel":1},
		{"dbid":7119609,"id":35519597,"isDefault":"1","leafTypeFlag":"1","modifyTime":"","name":"通用","parentTypeId":0,"status":"0","typeLevel":1}
		],"2":[
		{"dbid":7119609,"id":35519694,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"音像","parentTypeId":35519663,"status":"0","typeLevel":2},
		{"dbid":7119609,"id":35519693,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"图片","parentTypeId":35519663,"status":"0","typeLevel":2},
		{"dbid":7119609,"id":35519692,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"零食","parentTypeId":35519689,"status":"0","typeLevel":2},
		{"dbid":7119609,"id":35519691,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"饮料","parentTypeId":35519689,"status":"0","typeLevel":2},
		{"dbid":7119609,"id":35519690,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"酒料","parentTypeId":35519689,"status":"0","typeLevel":2},
		{"dbid":7119609,"id":35519667,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"其他","parentTypeId":35519664,"status":"0","typeLevel":2},
		{"dbid":7119609,"id":35519666,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"主食","parentTypeId":35519664,"status":"0","typeLevel":2},
		{"dbid":7119609,"id":35519665,"isDefault":"","leafTypeFlag":"1","modifyTime":"","name":"配料","parentTypeId":35519664,"status":"0","typeLevel":2}
		]}};  -->
</html>




