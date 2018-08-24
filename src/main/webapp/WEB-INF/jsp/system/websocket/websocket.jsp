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
 
<title>Insert title here</title>
</head>
<body>

</body>
</html>