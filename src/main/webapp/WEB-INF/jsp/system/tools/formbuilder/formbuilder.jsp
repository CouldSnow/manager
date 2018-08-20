<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basepath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${path}/static/js/jquery-3.2.1.min.js"></script>
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<link href="${path}/static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${path}/plugins/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<script src="${path}/plugins/datetimepicker/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script src="${path}/plugins/datetimepicker/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<link href="${path}/plugins/toastr/toastr.css" rel="stylesheet" />
 <script src="${path}/plugins/toastr/toastr.js"></script>
 <link href="${path}/plugins/sweetalert/dist/sweetalert2.css" rel="stylesheet" />
 <script src="${path}/plugins/sweetalert/dist/sweetalert2.js"></script>
</head>
<body>
<div id="all"class="container-fluid">
	<div id="text" class="row-fluid">
		<div class="span12">
			<h3>
				h3. 这是一套可视化布局系统.
			</h3>
			<p class="text-left">
				<em>Git</em>是一个分布式的版本控制系统，最初由<strong>Linus Torvalds</strong>编写，用作Linux内核代码的管理。在推出后，Git在其它项目中也取得了很大成功，尤其是在Ruby社区中。
			</p>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			 <button id="btn" class="btn btn-success" type="button">按钮</button>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			 <button id="btn1" class="btn btn-success" type="button">本地链接</button>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			 <button onclick="print1()" class="btn btn-success" type="button">打印</button>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			 <button id="pool" class="btn btn-success" type="button">数据库连接池</button>
		</div>
	</div>
	<!-- 遮罩框 -->
	
		<div class="modal fade" id="html_modal" tabindex="-1" role="dialog"aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">编辑</h4>
					</div>
					<div class="modal-body">
							<pre>
							
							</pre>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" id="submitbtn" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div>
		
		
</div>
</body>
<script type="text/javascript">
	$('#btn').click(function(){
		
		/* $('#html_modal').find('pre').text($('#text').prop('outerHTML')); */
		$('#html_modal').find('pre').text($('#text').html()); //不包括自己
	/* 	$('#html_modal').modal({
			backdrop : 'static'
		}); */
		$('#html_modal').modal('show');
	});
	
$('#btn1').click(function(){
		
	alert(window.location)
	});
	
	function print1(){
		var printData = $('#text').prop('outerHTML');
		var printDataAll = $('#all').prop('outerHTML');
		window.document.body.innerHTML = printData ;
		window.print();
		window.document.body.innerHTML = printDataAll;
	}
	
	$('#pool').click(function(){
		//alert("${basepath}druid/index.html")
		self.location.href="${basepath}druid/index.html";
		/* window.open("${basepath}druid/index.html"); */
	})
</script>
</html>