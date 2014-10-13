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
  					//console.info("data:"+data);
  					$.each(data,function(i,custom){
  						$("#opc").clone().html(custom.name).attr("name","order.customer.id").attr("value",custom.id).appendTo("#selc");
  					});
  				}
  			});
  		});
  		
  		function selPro(){
  			
  			$.ajax({
  				url:"orderAction_selPro",
  				dataType:'json',
  				success:function(data){
  					//console.info(data);
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
  			//console.info(cu_id);
  			//console.info(pr_id);
  			//console.info(number);
  			$.ajax({
  				url:"orderAction_calucatePrice",
  				data:"order.customer.id="+cu_id+"&order.product.id="+pr_id+"&order.num="+number,
  				success:function(order_money){
  					//console.info(order_money);
  					$("#om").attr("value",order_money)
  				}
  			});
  		}
  		//生成订单编号,由8位日期+4位商品编号+4位客户编号+uuid，最终截取前16位
  		function calurateOn(time){
  			var cu_id = $("#selc").val();
  			var pr_id = $("#selp").val();
  			var _time = $(time).val();
  			//console.info(cu_id);
  			//console.info(pr_id);
  			//console.info(_time);
  			$.ajax({
  				type:"post",
  				dataType:'json',
  				url:"orderAction_calucateOr_number",
  				data:"order.customer.id="+cu_id+"&order.product.id="+pr_id+"&order.time="+_time,
  				success:function(order){
  					//console.info(order);
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
	    	<a class="index" href="orderIndex_indexDeal">订单首页</a>&nbsp;&gt;&nbsp;<a href="orderAction_shows">订单</a>&nbsp;&gt;&nbsp;修改订单
	    </div>
        <div class="main-t">	
			<div class="table-wrap chks-table">		
				<table>
						<form action="orderAction_update">
							<tr>
								<td  class="tl" width=50>客户名</td>
								<td><select id="selc" onclick="selPro();" name="order.customer.id">
										<option id="opc" value="">--请选择--</option>
								</select></td>
							</tr>
							<tr>
								<td class="tl" width=50>商品名</td>
								<td><select id="selp" name="order.product.id">
										<option id="opp" value="">--请选择--</option>
								</select></td>
							</tr>
							<tr>
								<td class="tl" width=50>交易数量</td>
								<td><input id="num" name="order.num" onchange="calculateOm(this);"></td>
							</tr>
							<tr>
								<td class="tl" width=50>交易额度</td>
							
								<td><input id="om" name="order.order_money" value="">
								<!-- 系自动生成 --></td>
							</tr>
							<tr>
								<td class="tl" width=50>未付金额</td>
								
								<td><input id="unpay_money" name="order.unpay_money" value=""></td>
							</tr>
							<tr>
								<td class="tl" width=50>订单状态</td>
								
								<td><input id="status" name="order.status" value=""></td>
							</tr>
							<tr>
								<td class="tl" width=50>交易员工</td>
								
								<td><input id="emp"  value=""></td>
							</tr>
							<tr>
								<td class="tl" width=50>交易时间</td>
								
								<td><input id="time" class="Wdate" type="text"
									onClick="WdatePicker()" name="order.time"
									onchange="calurateOn(this);"
								></td>
							</tr>
							<tr>
								<td class="tl" width=50>订单编号</td>
								
								<td><input id="on" name="order.or_number" value=""></td>
							</tr>
							<tr>
								<td><input type="hidden" id="order_id" name="order.id" value="${param.id }"></td>
								<td><input type="hidden" id="operate" value="${request.operate }"></td>
								<td><input type="submit"   value="提交"></td>
							</tr>

						</form>
						<tfoot>
						<tr>
							<td colspan="6">								
								
                   
<script type="text/javascript">

</script>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			</div>
</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var id = $("#order_id").val();
	  		if(id!=null){
	  			$.ajax({
				url:'orderAction_update_pre',
				dataType:'json',
				data:'order.id='+id,
				success:function(order){
					//console.info(order.customer_id);
					//console.info($("#selc option[value='"+order.customer_id+"']"));
					
					$("#selc option[value='"+order.customer_id+""+"']").attr("selected","selected");
					$("#selp option[value='"+order.product_id+"']").attr("selected","selected");
					$("#emp").val(order.employee_name);
					$("#num").val(order.num);
					$("#om").val(order.order_money);
					$("#unpay_money").val(order.unpay_money);
					$("#status").val(order.status);
					$("#time").val(order.time);
					$("#on").val(order.or_number);
				}
				});
	  		} 
	});
</script>

</html>

