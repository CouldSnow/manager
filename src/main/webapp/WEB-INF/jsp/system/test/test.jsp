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

<title>Insert title here</title>
</head>
<body>
		<div class="panel panel-success">
			  <div class="panel-heading">
              		<div class="form-group">
						    <input type="text" class="form-control" id="url"  placeholder="请输入网址"  >
						    
				 </div>
						  <button id="submit" class="btn btn-info">开始</button>
						  
			</div>
					  
			</div>
			 <iframe scrolling="auto" allowtransparency="true" id="frame" onload="this.className='';" class="" frameborder="0" src="" style="width:100%;max-width:100%;height: 400px;" allowfullscreen="true">
						     		
		 	  </iframe>
</body>
<script type="text/javascript">
	$('#submit').click(function(){
		var url=$('#url').val();
		console.log(url)
		$('#frame').attr("src","http://"+url);
	})
</script>
</html>