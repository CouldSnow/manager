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
 <style type="text/css">
 	.label1{
 		height:35px;
 		width:100%;
 		text-align:right;
 		padding-top:10px;
 	}
 </style>
<title>反向代码</title>
</head>
<body>
	<div >
		<!-- form表单面板 -->
		<div class="panel panel-default panel-info" >
			  <div class="panel-heading " >
			    <h3 class="panel-title">反向生成代码 <small>数据库映射实体类</small></h3>
			  </div>
			  <div class="panel-body">
			  		 <form class="form-horizontal" id='db_form'>
						  <div class="form-group">
							    <label for="mysql" class="col-sm-1 control-label">数据库类型：</label>
							    <div class="col-sm-3">
							      <input type="text" class="form-control" id="mysql" name="mysql" value="mysql">
							    </div>
							    <label for="localhost" class="col-sm-1 control-label">连接地址：</label>
							    <div class="col-sm-3">
							      <input type="text" class="form-control" id="localhost" name="localhost"value="localhost">
							    </div>
							    <label for="port" class="col-sm-1 control-label">端口:</label>
							    <div class="col-sm-3">
							      <input type="text" class="form-control" id="port"  name="port"value="3306">
							    </div>
						  </div>
						   <div class="form-group">
							     <label for="user" class="col-sm-1 control-label">用户名:</label>
							    <div class="col-sm-3">
							      <input type="text" class="form-control" id="user" name="user" value="root">
							    </div>
							    <label for="password" class="col-sm-1 control-label">密码:</label>
							    <div class="col-sm-3">
							      <input type="text" class="form-control" id="password" name="password"value="">
							    </div>
							    <label for="dbname" class="col-sm-1 control-label">数据库:</label>
							    <div class="col-sm-3">
							      <input type="text" class="form-control" id="dbname"  name="dbname"value="">
							    </div>
						  </div>
						  <div class="form-group">
						    <div class="col-sm-1 col-sm-offset-11 ">
						     <button type="submit" class="btn btn-success">连接</button>
					   	 	</div>
				  		</div>
				</form>
			  </div>
		</div>
		<div class="page-header">
		  <h3>数据库列表 <small></small></h3>
		</div>
			<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width:50px">序号</th>
								<th>表名</th>
								<th style="width:150px">操作</th>
							</tr>
						</thead>
				</table>
	</div>
</body>
</html>