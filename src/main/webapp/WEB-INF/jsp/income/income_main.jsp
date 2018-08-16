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
<title>收入管理</title>
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
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="'col-md-12">
				<h1>收入管理</h1>
			</div>
		</div>
		<!--  -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button id="consumer_add" class="btn btn-info btn-sm">新增</button>
			</div>
		</div>
		<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<form id='listForm'>
				<table class="table table-hover" id="consumer_table">
					<tbody>
						<tr>
							<th>收入时间</th>
							<th>收入金额</th>
							<th>收入方式</th>
							<th>备注</th>
							<th>操作</th>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
		<!-- 分页 -->
		<div class="row">
			<!--分页信息  -->
			<div class="col-md-4" id="pageinfo"></div>
			<!-- 分页条 -->
			<div class="col-md-8">
				<nav aria-label="Page navigation">
				<ul class="pagination" id="page">

				</ul>
				</nav>
			</div>
		</div>
		<!-- 消费添加模态窗 -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog"aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">添加收入</h4>
					</div>
					<div class="modal-body">
							<form class="form-horizontal"  id="addForm" >
							<div class="form-group">
								<label for="csmDate" class="col-sm-2 control-label">收入时间：</label> 
								    <div class="col-sm-6">
								    <input size="16" type="text" value=""  name="icmdate" id="icmdate"  readonly class="form-control form_datetime">
									<span id="helpBlock2" class="help-block"></span>
									</div>
							</div> 
							<div class="form-group">
								<label for="csmnumber" class="col-sm-2 control-label">收入金额：</label> 
								<div class="col-sm-6">
								<input type="text"id="icmnumber" class="form-control" name="icmnumber">
								</div>
							</div>
							<div class="form-group">
								<label for="source" class="col-sm-2 control-label">收入方式：</label> 
								<div class="col-sm-4 ">
								<select class="form-control" id="select2" name="source">
                                    
								</select>
                                </div>
							</div>
						    <div class="form-group">
								<label for="msg" class="col-sm-2 control-label">备注：</label> 
								<div class="col-sm-6">
								<input type="text"id="msg" class="form-control" name="msg">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" id="submitbtn" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 消费修改模态窗 -->
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog"aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">修改收入记录</h4>
					</div>
					<div class="modal-body">
							<form class="form-horizontal"  id="editForm" >
							<div class="form-group">
								<label for="csmDate" class="col-sm-2 control-label">收入时间：</label> 
								    <div class="col-sm-6">
								    <input size="16" type="text" value=""  name="icmdate" id="edit_csmDate"  readonly class="form-control form_datetime">
									<span id="helpBlock2" class="help-block"></span>
									</div>
							</div> 
							<div class="form-group">
								<label for="csmnumber" class="col-sm-2 control-label">收入金额：</label> 
								<div class="col-sm-6">
								<input type="text"id="edit_csmnumber" class="form-control" name="icmnumber" >
								</div>
							</div>
							<div class="form-group">
								<label for="source" class="col-sm-2 control-label">收入方式：</label> 
								<div class="col-sm-4 ">
								<select class="form-control" id="edit_source" name="source">
                                    
								</select>
                                </div>
							</div>
						    <div class="form-group">
								<label for="msg" class="col-sm-2 control-label">备注：</label> 
								<div class="col-sm-6">
								<input type="text"id="edit_msg" class="form-control" name="msg">
									<input type="hidden"id="edit_id" class="form-control" name="id">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" id="update_submitbtn" class="btn btn-primary">更新</button>
					</div>
				</div>
			</div>
		</div>
		
		
		
	 </div>

	<script type="text/javascript">
		//1.页面加载完后 要发送ajax请求
		
		//初始化消息提示框
		toastr.options.positionClass = 'toast-bottom-center';
		
	/* 	toastr.success('提交数据成功');
		toastr.error('Error');
		 toastr.warning('只能选择一行进行编辑');
		  toastr.info('info'); */
		
			function init(){
				$.ajax({
					url : "${path}/income/incomeList",
					data : "pg=1",
					type : "get",
					//dataType:'json',
					success : function(data) {
						build_consumer_table(data);
						build_page_info(data);
						build_consumer_page(data);  
					}
				});
			}
			
			init();
		//表格
		function build_consumer_table(data) {
			$('#consumer_table tbody').children('tr[name="li"]').empty();
			var table = JSON.parse(data).extend.pageInfo.list;
			$.each(table,function(index, item) {
								var csmDatetd = $("<td></td>").append(getMyDate(item.icmdate));
								var csmnumbertd = $("<td></td>").append(item.icmnumber);
								var sourcetd = $("<td></td>").append(item.incomeSource.name);
								var msgtd = $("<td></td>").append(item.msg);

								var editbtn = $('<a href="#" name="edit_btn"></a>').addClass("btn btn-success btn-sm").attr('value',item.id)
										.append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑").attr("aria-hidden","true"));

								
								var delbtn =$('<a href="#" name="delt_btn"></a>').addClass("btn btn-danger btn-sm").attr('value',item.id)
								.append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("删除").attr("aria-hidden","true"));
								
								var btntd = $("<td></td").append(editbtn).append(delbtn)

								$('<tr name="li"></tr>').append().append(csmDatetd).append(csmnumbertd).append(sourcetd).append(msgtd).append(btntd)
										.appendTo("#consumer_table tbody");
							});

		}
		//分页条
		function build_consumer_page(data) {
			$('#page').empty();
			var page = JSON.parse(data).extend.pageInfo.navigatepageNums;
			var pageInfo = JSON.parse(data).extend.pageInfo;
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPage = $("<li></li>").append($('<a name="a_link"></a>').append("首页").attr("href", "#").val(1));
			var endPage = $("<li></li>").append($('<a name="a_link"></a>').append("末页").attr("href", "#").val(pageInfo.pages));
			var prePage = $("<li></li>").append($('<a name="a_link"></a>').append("<<").attr("href", "#").val(pageInfo.pageNum - 1));
			var nextPage = $("<li></li>").append($('<a name="a_link"></a>').append(">>").attr("href", "#").val(pageInfo.pageNum + 1));

			if (pageInfo.hasPreviousPage) {
				ul.append(firstPage).append(prePage);
			}

			$.each(page, function(index, item) {
				var li = $("<li></li>").append($('<a name="a_link"></a>').append(item).attr("href","#").val(item));
				if (pageInfo.pageNum == item) {
					li.addClass("active");
				}
				ul.append(li);
			})

			if (pageInfo.hasNextPage) {
				ul.append(nextPage).append(endPage);
			}

			$('#page').append(ul);

		}
		//分页信息
		function build_page_info(data) {
			$('#pageinfo').empty();
			var page = JSON.parse(data).extend.pageInfo;
			var str = "当前页数:" + page.pageNum + ",  总页数:" + page.pages + ", "
					+ page.total + "条记录";
			$('#pageinfo').append(str);
		}

	
			
			//分页按钮
			$('#page').on('click', 'a[name="a_link"]', function() {
				console.log($(this).val());
				var pg = $(this).val();
				$.ajax({
					url : "${path}/income/incomeList",
					data : "pg=" + pg,
					type : "get",
					success : function(data) {
						console.log(JSON.parse(data));
						build_consumer_table(data);
						build_page_info(data);
						build_consumer_page(data);
					}
				});
			});
			
			//清空表单
			function reset_form(ele){
				$(ele)[0].reset();
				$(ele).find('*').removeClass('has-error hase-success');
				$(ele).find('.help-block').text("");
			}
			
			//添加按钮
			$('#consumer_add').click(function() {
				reset_form('#addForm')
				$('#select2').empty();
				//发送ajax 返回部门信息
				$.ajax({
					url:"${path}/income/sourceList",
					type:"get",
					success:function(data){
						var options2 = JSON.parse(data).extend.source;
						$.each(options2,function(index,item){
							var option=$('<option></option>').append(item.name).attr('value',item.id);
							$('#select2').append(option);
						});
					}
				}); 
				
				$('#addModal').modal({
					backdrop : 'static'
				});
			});
			
			
			//修改按钮
			$('#consumer_table').on('click', 'a[name="edit_btn"]', function() {
				$('#edit_source').empty();
				var id = $(this).attr('value');
				//发送ajax 返回部门信息
			$.ajax({
					url:'${path}/income/IncomeById',
					type:"get",
					data : "id="+id,
					success:function(data){
						var income = JSON.parse(data).extend.income;
						var source = JSON.parse(data).extend.source;
						$('#edit_csmDate').attr("value",getMyDate(income.icmdate));
						$('#edit_csmnumber').attr("value",income.icmnumber);
						$('#edit_id').attr("value",income.id);
						$('#edit_msg').attr("value",income.msg);
					
						$.each(source,function(index,item){
							var option=$('<option></option>').append(item.name).attr('value',item.id);
							$('#edit_source').append(option);
						});
						//选中下拉框
						$('#editModal #edit_source').val([income.source]);
						$('#editModal').modal('show');
					}
				});
				/* $('#editModal').modal({
					backdrop : 'static'
				}); */

			});
			
			//删除按钮
			$('#consumer_table').on('click','a[name="delt_btn"]',function(){
				var deltid = $(this).attr('value');
			
				swal({
					  title: '提示',
					  text: "你确认删除吗",
					  type: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  cancelButtonText: '取消',
					  confirmButtonText: '确认删除'
					}).then(function(isConfirm) {
					  if (isConfirm) {
						  $.ajax({
								url:'${path}/income/delete?id='+deltid,
								type:'get',
								success:function(data){
									toastr.success('删除成功');
									init();
								}
							});
					  }
					})
               });
					          
		     
			
		
		
		//提交add表单
		$('#submitbtn').on('click',function(){
			//提交form
	        console.log($('#addForm').serialize());
			$.ajax({
				url:'${path}/income/add',
				type:'post',
				data:$('#addForm').serialize(),
				success:function(data){
					var info = JSON.parse(data);
					if(info.code==100){
						$('#addModal').modal('hide');
						init();
						toastr.success('操作成功');
					}else{
						toastr.error('操作失败');
					}
				}
			});
		});
		
      //更新按钮
		$('#update_submitbtn').click(function(){
			$.ajax({
				url:'${path}/income/update',
				type:'post',
				data:$('#editForm').serialize(),
				success:function(data){
					var info = JSON.parse(data);
					if(info.code==100){
						$('#editModal').modal('hide');
						toastr.success('更新成功');
						init();
					}else{
						toastr.error('更新失败');
					}
					/* window.location.reload(); */
				}
			});
		});
		
      
		//转时间戳
		function getMyDate(str){  
		    var oDate = new Date(str),  
		    oYear = oDate.getFullYear(),  
		    oMonth = oDate.getMonth()+1,  
		    oDay = oDate.getDate(),  
		    oHour = oDate.getHours(),  
		    oMin = oDate.getMinutes(),  
		    oSen = oDate.getSeconds(),  
		    oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay);//最后拼接时间  
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
			   format: 'yyyy-mm-dd',
			    weekStart: 1,
		        todayBtn:  1,
				autoclose: 1,
				todayHighlight: 1,
				startView: 2,
				minView: 2,
				forceParse: 0
				});
	</script>
</body>
</html>