<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	String path = request.getContextPath();
	pageContext.setAttribute("path", path);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${path}/static/js/jquery-3.2.1.min.js"></script>
<script src="${path}/plugins/hightcharts/highcharts.js"></script>
<script src="${path}/plugins/hightcharts/modules/exporting.js"></script>
<script src="${path}/plugins/hightcharts/modules/export-data.js"></script>

<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<link href="${path}/static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${path}/plugins/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script src="${path}/plugins/datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script src="${path}/plugins/datetimepicker/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<link href="${path}/plugins/toastr/toastr.css" rel="stylesheet" />
 <script src="${path}/plugins/toastr/toastr.js"></script>
 <link href="${path}/plugins/sweetalert/dist/sweetalert2.css" rel="stylesheet" />
 <script src="${path}/plugins/sweetalert/dist/sweetalert2.js"></script>
<title>月消费分析</title>
</head>
<body>
		<div class="container">
		<div class="row">
			  <div class="col-md-8">
			  		<form class="form-inline" id="search_form">
							<div class="form-group">
									<label for="csmDate1" >起始月份：</label> 
								    <input size="16" type="text" value=""  id="csmDate1" name="csmDate1" readonly class="form-control form_datetime">
							</div> 
							<div class="form-group">
									<label for="csmDate2" >结束月份：</label> 
									<input size="16" type="text" value=""  id="csmDate2"name="csmDate2"  readonly class="form-control form_datetime">
							</div> 
							<input type="button"  id="submit" class="btn-success btn " value="搜索"></button>
					</form>
			  </div>
		</div>
		<div class="row">
				 <div id="container" style="min-width:400px;height:400px"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
		
		toastr.options.positionClass = 'toast-bottom-center';
		//一进来显示
		function init(){
			$('#csmDate1').val(getMyDate(new Date()));
			$('#csmDate2').val(getMyDate(new Date()));
			$.ajax({
				url:'${path}/anaylse/anaylseMonthInfo',
				type:'POST',
				contentType:"application/json",
				dataType:'json',
				data:JSON.stringify(getJsonStr("search_form")),
				success:function(data){
					if(data.code=100){
						build_line(data.extend.monthtotal,'每月消费统计','container');
					}else{
						toastr.error('查询失败');
					}
				}
			});
		}
		
		init();
		
		$('#submit').click(function(){
			$.ajax({
				url:'${path}/anaylse/anaylseMonthInfo',
				type:'POST',
				contentType:"application/json",
				dataType:'json',
				data:JSON.stringify(getJsonStr("search_form")),
				success:function(data){
					if(data.code=100){
						$('#container').empty();
						toastr.success('操作成功');
						build_line(data.extend.monthtotal,'每月消费统计','container');
					}else{
						toastr.error('操作失败');
					}
				}
			});
		});
		
		function build_line(data,text,ele){
			var months=[];
			var values=[];
			$.each(data,function(index,item){
				months.push(item.months);
				values.push(item.count);
			});
			var chart = Highcharts.chart(ele,{
			    chart: {
			        type: 'column'
			    },
			    title: {
			        text: text
			    },  credits: 
			       {
			          enabled: false
			       },
			       exporting: { 
			    	   enabled: false
			       },
			    xAxis: {
			        categories: months,
			        crosshair: true
			    },
			    yAxis: {
			        min: 0,
			        title: {
			            text: '元/单位'
			        }
			    },
			    tooltip: {
			        // head + 每个 point + footer 拼接成完整的 table
			        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			        '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
			        footerFormat: '</table>',
			        shared: true,
			        useHTML: true
			    },
			    plotOptions: {
			        column: {
			            borderWidth: 0
			        }
			    },
			    series: [{
			        name: '月消费总计',
			        data: values
			    }]
			});
		}
		
		//转时间戳
		function getMyDate(str){  
		    var oDate = new Date(str),  
		    oYear = oDate.getFullYear(),  
		    oMonth = oDate.getMonth()+1,  
		    oTime = oYear +'-'+ getzf(oMonth);//最后拼接时间  
		    return oTime;  
		}; 
		//补0操作
		function getzf(num){  
		    if(parseInt(num) < 10){  
		        num = '0'+num;  
		    }  
		    return num;  
		}
		
		//时间控件操作
		 $(".form_datetime").datetimepicker({
			   format: 'yyyy-mm',
			    weekStart: 1,
		        todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 3,
				minView: 3,
				forceParse: 0,
				language:  'zh',
				});
		
		
		//将form表单转成json
		function getJsonStr(data){
			var formArray=$('#'+data).serializeArray();
			var formObject={};
			$.each(formArray,function(i,item){
				formObject[item.name] = item.value;
			})
			return formObject;
		}
</script>
</html>