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
 <link href="${path}/plugins/ace/css/ace.css" rel="stylesheet" />
 <script src="${path}/plugins/ace/js/ace/ace.js"></script>
<title>接口测试</title>
</head>
<body>
		<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
					 	<div class="span12">
							<div class="widget-box">
								<div class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
									<h4 class="lighter">服务器接口测试</h4>
								</div>
								<div class="widget-body">
								 <div class="widget-main">
										<div class="step-content row-fluid position-relative">
											<input name="form-field-radio1" id="form-field-radio1" onclick="setType('POST');" type="radio" value="icon-edit" checked="checked" ><span class="lbl">POST</span>&nbsp;&nbsp;
											<input name="form-field-radio1" id="form-field-radio2" onclick="setType('GET');" type="radio" value="icon-edit" ><span class="lbl">GET</span>&nbsp;&nbsp;&nbsp;&nbsp;
											<!-- <input name="key" id="form-field-radio1" type="radio" value="icon-edit" checked="checked" ><span class="lbl">加密参数:</span> -->
											<!-- <input name="S_TYPE_S" id="S_TYPE_S" style="width:79px;" type="text" value="USERNAME" title="例子"> -->
										</div>
										<div class="step-content row-fluid position-relative" style="padding-top: 10px;">
											<div style="float: left;">
												<span class="input-icon">
												 <!--  -->
													<input type="text" id="serverUrl" title="输入请求地址" value="<%=basePath%>consumer/consumerList" style="width:540px;">
													<i class="ace-icon fa"><span class="glyphicon glyphicon-globe "  style="top:8px" aria-hidden="true"></span></i>
												</span>
											</div>
											<div>
												&nbsp;&nbsp;<a class="btn btn-sm btn-success" onclick="sendSever();">请求</a>
												&nbsp;&nbsp;<a class="btn btn-sm btn-info" onclick="gReload();">重置</a>
											</div>
										</div>
										<div class="step-content row-fluid position-relative" style="padding-top: 10px;">
											<div>
													<textarea id="json-field" title="返回结果" class="autosize-transition span12" style="height:300px;width:690px;"></textarea>
										 			<textarea id="paramer-field" title="post请求参数" class="autosize-transition span12 " style="height:300px;width:200px;"></textarea>
											</div>
									 	</div>
									 	<div class="step-content row-fluid position-relative">
										<label style="float:left;padding-left: 35px;">服务器响应：<font color="red" id="stime">-</font>&nbsp;毫秒</label>
										<label style="float:left;padding-left: 35px;">客户端请求：<font color="red" id="ctime">-</font>&nbsp;毫秒</label>
										</div>
										<br/>
										<div class="step-content row-fluid position-relative">
											<ul class="unstyled spaced2">
												<li class="text-warning orange"><i class="ace-icon fa fa-exclamation-triangle"></i>
													相关参数协议：100 请求成功，200 请求失败
												</li>
												<!-- <li class="text-warning green"><i class="ace-icon fa fa-star blue"></i>
													校验加密规则：(取其中一个参数名+当前日期[格式 20150405]+混淆码",fh," 然后md5加密 的值作为 参数FKEY的值提交)
												</li> -->
											</ul>
										</div>
									 <input type="hidden" name="S_TYPE" id="S_TYPE" value="POST"/>
								 </div><!--/widget-main-->
								</div><!--/widget-body-->
							</div>
						</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
</body>
<script>

		//初始化消息提示框
		toastr.options.positionClass = 'toast-top-center';
		
		//重置按钮
		function gReload(){
			self.location.reload();//当前窗口刷新
		}
	   //设置请求类型
		function setType(type){
		   $('#S_TYPE').val(type);
			if(type=='POST'){
				$('#paramer-field').removeClass("hide");
			}else{
				$('#paramer-field').addClass("hide");
			}
		}
		//发送请求
		function sendSever(){
			var url = $('#serverUrl');
			if(url.val()==""){
				toastr.error('请输入请求地址');
				return false;
			}
			var startTime = new Date().getTime(); //请求开始时间
			//console.log(JSON.stringify({serverUrl:url.val(),requestMonthed:$('#S_TYPE').val(),requestBody:$('#paramer-field').val()}));
			$.ajax({
				type:'post',
				url:'${path}/tool/interfaceTest',
				data:JSON.stringify({serverUrl:url.val(),requestMonthed:$('#S_TYPE').val(),requestBody:$('#paramer-field').val()}),
				contentType:"application/json", //是为了后台能够映射成map类型
				datatype:'json',
				cache:false,
				success:function(datas){
					var data = JSON.parse(datas);
					console.log(data);
					if(data.code==100){
						toastr.success('服务器请求成功');
						var endTime = new Date().getTime(); //请求结束时间
						$('#ctime').text(endTime-startTime);
					}else{
						toastr.error('服务器请求失败');
					}
					$("#json-field").val(data.extend.result);
					//$("#json-field").find("pre").text(syntaxHighlight(data.extend.result));
					$("#stime").text(data.extend.rTime);
				}
			});
		}
		
		//格式化json数据
		function syntaxHighlight(json) {    
			if (typeof json != 'string') {        
				json = JSON.stringify(json, undefined, 2);   
			}    
			json = json.replace(/&/g, '&').replace(/</g, '<').replace(/>/g, '>');    
			return  json.replace(/("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, function(match) {        var cls = 'number';        if (/^"/.test(match)) {           
				if (/:$/.test(match)) {                
					cls = 'key';            
					} else {             
						cls = 'string';     
						}      
				} else if (/true|false/.test(match)) {          
					cls = 'boolean';       
					} else if (/null/.test(match)) {        
						cls = 'null';       
						}       
			return '<span class="' + cls + '">' + match + '</span>';   
			});
			}
</script>
</html>