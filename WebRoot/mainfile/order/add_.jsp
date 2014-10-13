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
<title>新增订单</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="css/css1.css?v=1411093498444" />
<link href="mainfile/Copy of order/slide_banner_extension.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="css/order/c.css?v=1411093498444" />  
<link href="mainfile/Copy of order/ydh.css" rel="stylesheet" id="lhgdialoglink">

<script src="//hm.baidu.com/hm.js?e6a820e58d40d6bbfdaa42e767e97522"></script>
<!--[if lte IE 8]>
<script type="text/javascript" src="http://res2.dinghuo123.com/js/respond.js?v=1411093498444"></script>
<![endif]-->

</head>
<body>

	<!--end header-->
	<div class="main-wrap">
		<div class="order">
			<!--begin map-->
			<div class="map">
				<a class="index" href="/index">首页</a>&nbsp;&gt;&nbsp;<a
					href="orderAction_shows"
				>订单</a>&nbsp;&gt;&nbsp;新增订货单
			</div>
			<!--end map-->


					<!--begin main-->
					<form autocomplete="off" action="orderAction_add">
						<div class="main-t">
							<div class="control-box ui-page-tab-con">
								<div class="choose-client control-group">
									<label class="control-label">代理商名称:</label>
									<div class="control-input pr">
										<span class="ui-combo-wrap" id="agentAuto"> <input
											type="text" name="" class="input-txt agentAuto"
											autocomplete="off" value="" data-hasqtip="18"
											aria-describedby="qtip-18"
										><span class="ui-icon-ellipsis"></span></span>
									</div>
								</div>
								<%-- <div class="choose-invoice-type control-group">
									<label class="control-label">发票类型:</label> <input type="hidden"
										id="isAddValueInvoice" value="1" autocomplete="off"
									>
									<!-- 1为可以开增值税发票 -->
									<!-- <div class="control-input">
										<label class="radio checked"><input class="fl"
											type="radio" value="0" name="invoiceType" checked=""
											autocomplete="off"
										>不开发票<input type="hidden" name="taxVal" value="0"
											autocomplete="off"
										></label> <label class="radio"><input class="fl"
											type="radio" value="1" name="invoiceType" autocomplete="off"
										>普通发票</label> <label class="radio"><input class="fl"
											type="radio" value="2" name="invoiceType" autocomplete="off"
										>增值税发票</label> <input type="hidden" id="isUsetax" value="0"
											autocomplete="off"
										>
									</div> -->
									<span class="fr red order-promotion" style="display: none;">
										<a class="ml10 red"
										href="/product/promotion?action=list&amp;type=2"
										target="_blank"
									>订单满￥<span id="orderPromotionMeetMoney"></span>送商品
									</a><a class="ml10"
										href="/product/promotion?action=list&amp;type=2"
										target="_blank"
									>详情&gt;</a>
									</span>
								</div> --%>
								<div class="grid-wrap">
									<div
										class="ui-jqgrid ui-widget ui-widget-content ui-corner-all"
										id="gbox_order-add" dir="ltr" style="width: 1152px;"
									>
										<div class="ui-widget-overlay jqgrid-overlay"
											id="lui_order-add"
										></div>
										<div class="loading ui-state-default ui-state-active"
											id="load_order-add" style="display: none;"
										>读取中...</div>
										<div class="ui-jqgrid-view" id="gview_order-add"
											style="width: 1152px;"
										>
											<div style="position:fixed;top:0px;width:1px;height:1px;"
												tabindex="0"
											>
												<div tabindex="-1" style="width:1px;height:1px;"
													id="order-add_kn"
												></div>
											</div>
											<div
												class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix"
												style="display: none;"
											>
												<a role="link" class="ui-jqgrid-titlebar-close HeaderButton"
													style="right: 0px;"
												><span class="ui-icon ui-icon-circle-triangle-n"></span></a><span
													class="ui-jqgrid-title"
												></span>
											</div>
										<!-- ----------- -->
											<%-- <div class="ui-state-default ui-jqgrid-hdiv"
												style="width: 1152px;"
											>
												<div class="ui-jqgrid-hbox">
													<table class="ui-jqgrid-htable" style="width: 1152px;"
														role="grid" aria-labelledby="gbox_order-add"
														cellspacing="0" cellpadding="0" border="0"
													>
														<thead>
															<tr class="ui-jqgrid-labels" role="rowheader">
																<th id="order-add_rn" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 25px;"
																><div id="jqgh_order-add_rn">
																		<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_operating" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 50px;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_operating"
																		class="ui-jqgrid-sortable"
																	>
																		<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_productId" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 150px; display: none;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_productId"
																		class="ui-jqgrid-sortable"
																	>
																		productId<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_name" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 504px;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_name" class="ui-jqgrid-sortable">
																		商 品<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_count" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 92px;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_count"
																		class="ui-jqgrid-sortable"
																	>
																		数 量<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_productUnitName" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 57px;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_productUnitName"
																		class="ui-jqgrid-sortable"
																	>
																		单位<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_marketPrice" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 150px; display: none;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_marketPrice"
																		class="ui-jqgrid-sortable"
																	>
																		<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_orderPrice" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 150px; display: none;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_orderPrice"
																		class="ui-jqgrid-sortable"
																	>
																		<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_showPrice" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 115px;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_showPrice"
																		class="ui-jqgrid-sortable"
																	>
																		单 价<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_promotionPrice" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 150px; display: none;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_promotionPrice"
																		class="ui-jqgrid-sortable"
																	>
																		促 销 价<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_money" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 172px;"
																><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
																	style="cursor: col-resize;"
																>&nbsp;</span>
																<div id="jqgh_order-add_money"
																		class="ui-jqgrid-sortable"
																	>
																		小 计<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
																<th id="order-add_productRemark" role="columnheader"
																	class="ui-state-default ui-th-column ui-th-ltr"
																	style="width: 57px;"
																><div id="jqgh_order-add_productRemark"
																		class="ui-jqgrid-sortable"
																	>
																		备注<span class="s-ico" style="display:none"><span
																			sort="asc"
																			class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"
																		></span><span sort="desc"
																			class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"
																		></span></span>
																	</div></th>
															</tr>
														</thead>
													</table>
												</div>
											</div> --%>
											
										<!-- 	----------------------- -->
											
											
											<div class="ui-jqgrid-bdiv"
												style="height: auto; width: 1152px;"
											>
												<div style="position:relative;">
													<div></div>
													<table id="order-add" tabindex="0" cellspacing="0"
														cellpadding="0" border="0" role="grid"
														aria-multiselectable="false"
														aria-labelledby="gbox_order-add" class="ui-jqgrid-btable"
														style="width: 1152px;"
													>
														<tbody>
															<tr class="jqgfirstrow" role="row" style="height:auto">
																<td role="gridcell" style="height:0px;width:25px;"></td>
																<td role="gridcell" style="height:0px;width:50px;"></td>
																<td role="gridcell"
																	style="height:0px;width:150px;display:none;"
																></td>
																<td role="gridcell" style="height: 0px; width: 504px;"></td>
																<td role="gridcell" style="height: 0px; width: 92px;"></td>
																<td role="gridcell" style="height: 0px; width: 57px;"></td>
																<td role="gridcell"
																	style="height:0px;width:150px;display:none;"
																></td>
																<td role="gridcell"
																	style="height:0px;width:150px;display:none;"
																></td>
																<td role="gridcell" style="height: 0px; width: 115px;"></td>
																<td role="gridcell"
																	style="height:0px;width:150px;display:none;"
																></td>
																<td role="gridcell" style="height: 0px; width: 172px;"></td>
																<td role="gridcell" style="height: 0px; width: 57px;"></td>
															</tr>
															<tr role="row" id="1" tabindex="-1"
																class="ui-widget-content jqgrow ui-row-ltr"
																aria-selected="false"
															>
																<td role="gridcell"
																	class="ui-state-default jqgrid-rownum"
																	style="text-align:center;width: 25px;" title="1"
																	aria-describedby="order-add_rn"
																>1</td>
																<td role="gridcell" style="text-align:center;" title=""
																	aria-describedby="order-add_operating" class=""
																><div class="operating" data-id="1">
																		<span class="ui-icon ui-icon-plus" title="新增行">+</span><span
																			class="ui-icon ui-icon-trash" title="删除行"
																		>-</span>
																	</div></td>
																<td role="gridcell" style="display:none;" title=""
																	aria-describedby="order-add_productId"
																>&nbsp;</td>
																<td role="gridcell" style="" title=""
																	aria-describedby="qtip-0" class="tip1-3"
																	data-hasqtip="0" tabindex="-1"
																>&nbsp;</td>
																<td role="gridcell" style="text-align:center;" title=""
																	aria-describedby="order-add_count" class=""
																	tabindex="-1"
																>&nbsp;</td>
																<td role="gridcell" style="text-align:center;" title=""
																	aria-describedby="order-add_productUnitName" class=""
																>&nbsp;</td>
																<td role="gridcell"
																	style="text-align:center;display:none;"
																	aria-describedby="order-add_marketPrice"
																></td>
																<td role="gridcell"
																	style="text-align:center;display:none;"
																	aria-describedby="order-add_orderPrice"
																></td>
																<td role="gridcell" style="text-align:right;"
																	aria-describedby="order-add_showPrice" class=""
																></td>
																<td role="gridcell"
																	style="text-align:center;display:none;"
																	aria-describedby="order-add_promotionPrice"
																></td>
																<td role="gridcell" style="text-align:right;"
																	aria-describedby="order-add_money" class=""
																></td>
																<td role="gridcell" style="text-align:center;"
																	aria-describedby="order-add_productRemark" class=""
																></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="ui-jqgrid-resize-mark" id="rs_morder-add">&nbsp;</div>
									</div>
								</div>
								<div class="product-promotion">
									<ul>
										<li class="template" style="display:none;">【赠品】<input
											type="hidden" class="productId" autocomplete="off"
										><span class="code"></span> <span class="name"></span><span
											class="spec"
										></span> <span class="count"></span><span class="unit"></span></li>
									</ul>
								</div>
								<div class="order-total">
									<div class="total-r">

										<div class="total-group">
											<label class="total-label total-money-label">合计：</label>
											<div class="total">
												￥<span class="total-money">0.00</span>
											</div>
										</div>

										<div class="total-group">
											<label class="total-label total-rel-money-label">应付总额：</label>
											<div class="total red">
												￥<span class="total-rel-money">0.00</span>
											</div>
										</div>
									</div>
									<div class="total-l chks">
										<!-- <div class="control-group">
                            <label class="ui-chk chk fl"><input type="checkbox" name="isUseBackPoint">使用返点</label><span class="is-use-back-point-con fl" style="display: none;">：返点帐户余额￥<span class="back-point-account">0.00</span>元，本次使用￥（<input type="text" class="ui-input-line ui-input-line-dis" value="0" disabled id="inp-back-point-account" />）元</span>
                        </div> -->

										<div class="control-group">
											<label class="ui-chk chk fl"><input type="checkbox"
												name="isDiscountOrder" autocomplete="off"
											>已申请特价</label><span class="is-discount-order-con fl">，请输入获批订单金额：￥（<input
												type="text" id="inp-discount-order"
												class="ui-input-line w80 tr ui-input-line-dis" value=""
												autocomplete="off" disabled="disabled"
											>）
											</span><a href="javascript:void(0)"
												class="tip-orange ui-icon-info discount-tip"
												data-hasqtip="3" aria-describedby="qtip-3"
											></a>
										</div>

									</div>
								</div>
								<div class="control-group remark">
									<label class="control-label">填写备注：</label>
									<div class="control-input">
										<textarea class="ui-textarea-line ui-textarea-auto inp-remark"
											placeholder="在此填写备注信息..."
										></textarea>
									</div>
								</div>
								<div class="control-group delivery-date">
									<label class="control-label">交货日期：</label>
									<div class="control-input delivery-info">
										<input type="text"
											class="ui-datepicker-inp datepickerStart  hasDatepicker"
											id="deliveryDate" autocomplete="off" readonly="readonly"
										>
									</div>
								</div>
								<div class="control-group receive-info">
									<label class="control-label">收货信息：</label>
									<div class="control-input address-info" style="display: none;">
										<a href="javascript:void(0)" class="ui-op ui-op-edit"
											id="address-edit" title="编辑"
										>编辑</a><input type="hidden" class="addressId" autocomplete="off">收货人：<span
											class="contactor"
										></span> 联系电话：<span class="mobile"></span> 收货地址：<span
											class="address"
										></span>
									</div>
								</div>
								<div class="control-group control-group-invoice-info"
									style="display: none;"
								>
									<label class="control-label">发票信息：</label>

									<div class="control-input invoice-info" style="display: none;">
										<a href="javascript:void(0)" class="ui-op ui-op-edit"
											id="invoice-edit" title="编辑"
										>编辑</a>
										<!-- <input type="hidden" name="invoiceType" /><span class="invoiceType"></span> -->
										<span class="invoiceType1">发票抬头：<span class="invoice"></span>&nbsp;&nbsp;&nbsp;&nbsp;发票内容：<span
											class="invoiceContent"
										>商品明细</span></span><span class="invoiceType2" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;开户银行：<span
											class="bank"
										></span>&nbsp;&nbsp;&nbsp;&nbsp;开户账号：<span class="bankAccount"></span>&nbsp;&nbsp;&nbsp;&nbsp;纳税人识别号：<span
											class="taxNum"
										></span></span>
									</div>
								</div>
							</div>

							<div id="initCombo" class="hidden">

								<input type="text" class="textbox productAuto customelement"
									name="name" autocomplete="off" id="4_name"
								>
							</div>
						</div>
						<div class="control-box btn-submit">
							<a class="ui-btn ui-btn-theme save" href="javascript:void(0)">提交</a>
							<a class="ui-btn ui-btn-default cancel" href="javascript:void(0)">取消</a>
						</div>
					</form>
					<!--end main-->
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
	<input type="hidden" id="isUseInventory" value="true" />
	<!-- 是否开启库存-->
	<input type="hidden" id="isOrderFreight" value="false" />
	<!-- 是否开启运费 -->

	<input type="hidden" id="isOrderDeliverDate" value="false" />
	<!-- 交货日期是否为必填 -->
	<input type="hidden" id="isUseProductImage" value="true" />
	<input type="hidden" id="isUseProductMulSpec" value="true" />
	<!-- 是否启用多规格商品 -->
	<input type="hidden" id="isUseProductWeight" value="false" />
	<!-- 是否启用商品重量统计 -->
	<input type="hidden" id="weightUnitName" value="" />
	<!-- 商品重量统计单位 -->
	<input type="hidden" id="isUseProductProperty" value="true" />
	<!-- 是否启自定义字段 -->
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


<script type="text/javascript" src="js/order/r1.js?v=1411093498444"></script>
<script type="text/javascript" src="js/order/ui.min.js?v=1411093498444"></script>
<script type="text/javascript"
	src="js/order/handlebars.js?v=1411093498444"
></script>
<script type="text/javascript" src="js/order/common.js?v=1411093498444"></script>
<script type="text/javascript"
	src="js/order/commonApp.js?v=1411093498444"
></script>
<script type="text/javascript"
	src="js/order/statistics.js?v=1411093498444"
></script>
<script type="text/javascript"
	src="js/order/floatService.js?v=1411093498444" defer="defer" async
></script>
<!--[if lte IE 8]>
<script type="text/javascript" src="http://res2.dinghuo123.com/js/html5.js?v=1411093498444"></script>
<![endif]-->
<noscript>
	<div
		style="height:100%;width:100%;position: absolute;text-align:center;line-height:100px;background:#eff996;z-index:999;top:0;font-size:24px;font-family:微软雅黑"
	>您的浏览器安全级别太高，需要在浏览器设置中降低安全级别。</div>
</noscript>
<!--grid-->
<script type="text/javascript"
	src="js/order/grid.min.js?v=1411093498444"
></script>
<!--end grid-->
<script type="text/javascript"
	src="js/order/orderAdd.js?v=1411093498444"
></script>
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" style="position: absolute; top: 501px; left: 266px; z-index: 1; display: none;"><div class="ui-datepicker-header ui-widget-header ui-helper-clearfix ui-corner-all"><a class="ui-datepicker-prev ui-corner-all ui-state-disabled" title="Prev"><span class="ui-icon ui-icon-circle-triangle-w">Prev</span></a><a class="ui-datepicker-next ui-corner-all" data-handler="next" data-event="click" title="Next"><span class="ui-icon ui-icon-circle-triangle-e">Next</span></a><div class="ui-datepicker-title"><select class="ui-datepicker-month" data-handler="selectMonth" data-event="change"><option value="8" selected="selected">9</option><option value="9">10</option><option value="10">11</option><option value="11">12</option></select><select class="ui-datepicker-year" data-handler="selectYear" data-event="change"><option value="2014" selected="selected">2014</option><option value="2015">2015</option><option value="2016">2016</option><option value="2017">2017</option><option value="2018">2018</option><option value="2019">2019</option><option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option><option value="2023">2023</option><option value="2024">2024</option></select></div></div><table class="ui-datepicker-calendar"><thead><tr><th class="ui-datepicker-week-end"><span title="星期日">日</span></th><th><span title="星期一">一</span></th><th><span title="星期二">二</span></th><th><span title="星期三">三</span></th><th><span title="星期四">四</span></th><th><span title="星期五">五</span></th><th class="ui-datepicker-week-end"><span title="星期六">六</span></th></tr></thead><tbody><tr><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">1</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">2</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">3</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">4</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">5</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">6</span></td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">7</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">8</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">9</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">10</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">11</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">12</span></td><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">13</span></td></tr><tr><td class=" ui-datepicker-week-end ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">14</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">15</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">16</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">17</span></td><td class=" ui-datepicker-unselectable ui-state-disabled "><span class="ui-state-default">18</span></td><td class=" ui-datepicker-days-cell-over  ui-datepicker-today" data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default ui-state-highlight ui-state-hover" href="#">19</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">20</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">21</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">22</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">23</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">24</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">25</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">26</a></td><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">27</a></td></tr><tr><td class=" ui-datepicker-week-end " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">28</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">29</a></td><td class=" " data-handler="selectDay" data-event="click" data-month="8" data-year="2014"><a class="ui-state-default" href="#">30</a></td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td><td class=" ui-datepicker-week-end ui-datepicker-other-month ui-datepicker-unselectable ui-state-disabled">&nbsp;</td></tr></tbody></table></div>
<div id="COMBO_WRAP"><div class="ui-droplist-wrap" style="position: absolute; top: 153px; z-index: 1000; width: 98px; display: none; left: 929px;"><div class="droplist" style="position: relative; overflow: auto; height: 150px;"><div class="list-item selected" data-value="1">搜订货单</div><div class="list-item" data-value="2">搜退货单</div><div class="list-item" data-value="3">搜代理商</div><div class="list-item" data-value="4">搜商品</div><div class="list-item" data-value="5">搜库存</div></div></div><div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 332px; display: none;"><div class="droplist" style="position: relative; overflow: auto; height: 150px;"><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div><div class="tips">数据加载失败</div></div><div class="extra-list-ctn"><a href="javascript:void(0);" id="quickChooseAgent" class="quick-add-link"><i class="ui-icon-choose"></i>选择客户</a></div></div><div class="ui-droplist-wrap" style="position: absolute; top: 502px; z-index: 1000; width: 523px; display: none; left: 238px;"><div class="droplist" style="position: relative; overflow: auto; height: 28px;"><div class="tips">暂无数据</div></div><div class="extra-list-ctn"><a href="javascript:void(0);" id="quickChooseProduct" class="quick-add-link"><i class="ui-icon-choose"></i>选择商品</a></div></div></div>
<div id="ldg_lockmask" style="position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; overflow: hidden; z-index: 1988; display: none;"></div>
<div id="float_service" style="position: fixed; right: -212px; top: 135px; overflow: hidden; z-index: 9999; height: 328px;"><div class="float_start" style="border-radius:2px 0 0 2px;font-size:13px;width:30px;height:100px;line-height:19px;font-size:14px;cursor:pointer;background:#03b8cc;float:left;color:#FFFFFF;text-align:center;font-family:宋体,simsun;margin-top:58px;">&lt;<br>服<br>务<br>在<br>线</div><div class="float_contact" style="width: 212px; height: 328px; float: left; background-image: url(http://res.dinghuo123.com/dist/images/floatservice-bg-2.png);"><ul style="margin-top:205px;padding-left:25px;list-style:none;font-size:14px;"><li><a target="_blank" id="service_qq1" href="javascript:void(0)" style="transition-duration: 0.5s;width:95px;height:18px;padding:11px 35px;display:block;background-color:#f47469;color:#FFFFFF;" onmouseover="this.style.cssText='transition-duration: 0.5s;width:95px;height:18px;padding:11px 35px;display:block;background-color:#e46459;color:#FFFFFF;'" onmouseout="this.style.cssText='transition-duration: 0.5s;width:95px;height:18px;padding:11px 35px;display:block;background-color:#f47469;color:#FFFFFF;'"><em style="display:inline-block;background:url(http://res.dinghuo123.com/dist/images/floatservice-bg-2.png) 0 -330px no-repeat;width:20px;height:20px;float:left;margin-right:5px;"></em><span style="float:left;line-height:18px;">在线客服</span></a></li><li style="margin-top:16px;"><a id="liuyan" href="javascript:void(0)" style="width:95px;height:18px;padding:11px 35px;display:block;background-color:#77b36c;color:#FFFFFF;transition-duration: 0.5s;" onmouseover="this.style.cssText='transition-duration: 0.5s;width:95px;height:18px;padding:11px 35px;display:block;background-color:#508945;color:#FFFFFF;'" onmouseout="this.style.cssText='transition-duration: 0.5s;width:95px;height:18px;padding:11px 35px;display:block;background-color:#77b36c;color:#FFFFFF;'"><em style="display:inline-block;background:url(http://res.dinghuo123.com/dist/images/floatservice-bg-2.png) -20px -330px no-repeat;width:20px;height:20px;float:left;margin-right:5px;"></em><span style="float:left;line-height:18px;">留言反馈</span></a></li></ul></div></div>
<div id="qtip-0" class="qtip qtip-default  qtip-pos-tc" tracking="false" role="alert" aria-live="polite" aria-atomic="false" aria-describedby="qtip-0-content" aria-hidden="true" data-qtip-id="0" style="z-index: 15007;"><div class="qtip-tip" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px; line-height: 11px; left: 50%; margin-left: -6px; top: -11px;"><canvas width="11" height="11" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px;"></canvas></div><div class="qtip-content" id="qtip-0-content" aria-atomic="true">点击选择商品</div></div>
<div id="slide_bottom_edge" style="background-image: url(chrome-extension://nhckipefmgdddckaeipfklkdggefgkae/edgebgbot.png); position: absolute; margin: 0px; padding: 0px; border-width: 0px; height: 0px; left: 0px; top: 869px; width: 100%; display: block; background-position: 0px 0px;"></div>
<div id="qtip-1" class="qtip qtip-default  qtip-pos-tc" tracking="false" role="alert" aria-live="polite" aria-atomic="false" aria-describedby="qtip-1-content" aria-hidden="true" data-qtip-id="1" style="z-index: 15005; top: 512px; left: 451px;"><div class="qtip-tip" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px; line-height: 11px; left: 50%; margin-left: -6px; top: -11px;"><canvas width="11" height="11" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px;"></canvas></div><div class="qtip-content" id="qtip-1-content" aria-atomic="true">点击选择商品</div></div>
<div id="qtip-2" class="qtip qtip-default  qtip-pos-tc" tracking="false" role="alert" aria-live="polite" aria-atomic="false" aria-describedby="qtip-2-content" aria-hidden="true" data-qtip-id="2" style="z-index: 15001;"><div class="qtip-tip" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px; line-height: 11px; left: 50%; margin-left: -6px; top: -11px;"><canvas width="11" height="11" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px;"></canvas></div><div class="qtip-content" id="qtip-2-content" aria-atomic="true">点击选择商品</div></div>
<div id="qtip-7" class="qtip qtip-default  qtip-pos-tc" tracking="false" role="alert" aria-live="polite" aria-atomic="false" aria-describedby="qtip-7-content" aria-hidden="true" data-qtip-id="7" style="z-index: 15006;"><div class="qtip-tip" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px; line-height: 11px; left: 50%; margin-left: -6px; top: -11px;"><canvas width="11" height="11" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px;"></canvas></div><div class="qtip-content" id="qtip-7-content" aria-atomic="true">点击选择商品</div></div>
<div id="qtip-8" class="qtip qtip-default  qtip-pos-tc" tracking="false" role="alert" aria-live="polite" aria-atomic="false" aria-describedby="qtip-8-content" aria-hidden="true" data-qtip-id="8" style="z-index: 15004;"><div class="qtip-tip" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px; line-height: 11px; left: 50%; margin-left: -6px; top: -11px;"><canvas width="11" height="11" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px;"></canvas></div><div class="qtip-content" id="qtip-8-content" aria-atomic="true">点击选择商品</div></div>
<div id="qtip-3" class="qtip qtip-default  qtip-pos-tc" tracking="false" role="alert" aria-live="polite" aria-atomic="false" aria-describedby="qtip-3-content" aria-hidden="true" data-qtip-id="3" style="z-index: 15002;"><div class="qtip-tip" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px; line-height: 11px; left: 50%; margin-left: -6px; top: -11px;"><canvas width="11" height="11" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px;"></canvas></div><div class="qtip-content" id="qtip-3-content" aria-atomic="true">特价单必须在已经获得特价审批批准前提下勾选，并填写获批特价后的订单金额，<br>并需在订单备注中填写申请原因和审批人。如之前未获批准，请不要勾选本项</div></div>
<div id="qtip-18" class="qtip qtip-default  qtip-pos-lc" tracking="false" role="alert" aria-live="polite" aria-atomic="false" aria-describedby="qtip-18-content" aria-hidden="true" data-qtip-id="18" style="z-index: 15003;"><div class="qtip-tip" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px; line-height: 11px; top: 50%; margin-top: -6px; left: -11px;"><canvas width="11" height="11" style="background-color: transparent !important; border: 0px !important; width: 11px; height: 11px;"></canvas></div><div class="qtip-content" id="qtip-18-content" aria-atomic="true">先选择客户</div></div>

</body>

</html>