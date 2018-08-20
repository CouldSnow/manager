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
<!-- base js and css -->
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
 
<title>资源上传</title>
</head>
<body>
	<form id="file_form" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile">File input</label>
		    <input type="file"  name="file" id="exampleInputFile">
		    <p class="help-block">选择上传的文件夹</p>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputFileName">文件名</label>
		    <input type="text"  name="fileName" id="exampleInputFileName">
		  </div>
  		<!-- <button type="submit" class="btn btn-default">上传</button> -->
  			<div class="row-fluid">
		<div class="span12">
			 <button id="upload" class="btn btn-success" type="button">按钮</button>
		</div>
	</div>
	</form>
	
	带进度条的上传文件
		<form id="file_form_progress" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="exampleInputFile1">File input</label>
		    <input type="file"  name="file" id="exampleInputFile1">
		    <p class="help-block">选择上传的文件夹</p>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputFileName1">文件名</label>
		    <input type="text"  name="fileName" id="exampleInputFileName1">
		  </div>
  		<!-- <button type="submit" class="btn btn-default">上传</button> -->
  			<div class="row-fluid">
		<div class="span12">
			 <button onclick="UpladFile()" class="btn btn-success" type="button">按钮</button>
		</div>
	</div>
	</form>
		
		<div id="progerssbar"class="progress progress-info">
				<div class="bar">
				</div>
			</div>
</body>
<script type="text/javascript">
	 toastr.options.positionClass = 'toast-top-center';
	 $('#upload').click(function(){
		 $.ajax({
			url:'${path}/file/upload',
			type:'post',
			cache:false,
			processData:false,
			contentType:false,
			data:new FormData($('#file_form')[0]),
			dataType:'json',
			 beforeSend: function () {
				   // jqSender.hide().after('<img id="load" src="/images/load.gif" />');
				 toastr.info('loading'); 
			 },
			success:function(data){
				if(data.code==100){
					toastr.success('上传成功');
				}else{
					toastr.error('上传失败'+data.extend.error);
				}
			}
		 });
	 });
	 
	 
	 //带有进度进度条
	 function UpladFile() {
     // var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
      var FileController = "${basepath}/file/upload";          // 接收上传文件的后台地址 
 
      // FormData 对象
      var form = new FormData($( "#file_form_progress" )[0]);
 
      // XMLHttpRequest 对象
      var xhr = new XMLHttpRequest();
      xhr.open("post", FileController, true);
      xhr.onload = function () {
        // alert("上传完成!");
      };
 
      xhr.upload.addEventListener("progress", progressFunction, false);
      xhr.send(form);
    }
 
    function progressFunction(evt) {
      var progressBar = document.getElementById("progerssbar");
      var percentageDiv = document.getElementById("percentage");
      if (evt.lengthComputable) {
        progressBar.max = evt.total;
        progressBar.value = evt.loaded;
        percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) + "%";
        if(evt.loaded==evt.total){
          alert("上传完成100%");
        }
      }
    }

</script>
</html>