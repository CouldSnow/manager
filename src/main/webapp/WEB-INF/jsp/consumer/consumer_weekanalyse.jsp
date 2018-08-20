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
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div id="container" style="min-width:50%; height: 100%; max-width: 50%; margin: 0 auto ;float:left" ></div>
<div id="container1" style="min-width:50%; height: 100%; max-width: 50%; margin: 0 auto ;float:left"></div>

</div>
</body>
<script type="text/javascript">
	//ajax获取数据
	$.ajax({
		url:'${path}/anaylse/anaylseWeekInfo',
		type:'post',
		datatype:'json',
		success:function(data){
			var type=JSON.parse(data).extend.weekType;
			var source=JSON.parse(data).extend.weekSource;
			
			build_pie(type,'container','本周消费类型百分比');
			build_pie(source,'container1','本周消费方式百分比');
		}
	})
	
	
	function build_pie(data,ele,text){
		var piedata=[];
		$.each(data,function(index,item){
			var subdata ={};
			subdata.name=item.name;
			subdata.y=item.count;
			piedata.push(subdata);
		});
		
		Highcharts.chart(ele, {
		    chart: {
		        plotBackgroundColor: null,
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    credits: 
		       {
		          enabled: false
		       },
		       exporting: { 
		    	   enabled: false
		       },
		    title: {
		        text: text
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b> <br>消费：<b>{point.y}元</b>'
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                style: {
		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                }
		            }
		        }
		    },
		    series: [{
		        name: '占比',
		        colorByPoint: true,
		        data: piedata
		    }]
		});
	}
</script>
</html>