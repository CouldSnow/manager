<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath();
    		pageContext.setAttribute("path", path);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${path}/static/js/jquery-3.2.1.min.js"></script>
<script src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
<link href="${path}/static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">
<link href="${path}/static/bootstrap/css/bootstrap-theme.min.css" type="text/css" rel="stylesheet">
<link href="${path}/plugins/toastr/toastr.css" rel="stylesheet" />
 <script src="${path}/plugins/toastr/toastr.js"></script>
 <!-- 登录界面的css -->
 <link href="${path}/static/css/avivo.css" rel="stylesheet" />
 <link href="${path}/static/css/default.css" rel="stylesheet" />
 <link href="${path}/static/css/font-awesome.min.css" rel="stylesheet" />
  <script src="${path}/static/js/avivo.js"></script>
<title>manager</title>
</head>
<body>
 <div class="login">
		<img src="${path}/static/image/profile.jpg" alt="..." class="img-circle photo-user">
		<div class="login-form">
    		<form action="${path}/login" method="post" >
    			<div class="input-group">
					<input class="form-control" name="username" placeholder="username" type="text">
					<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				</div>
    			<div class="input-group">
					<input class="form-control" name="password" placeholder="password" type="password">
					<span class="input-group-addon"><i class="glyphicon glyphicon-eye-close" ></i></span>
				</div>
    		</form>
    		
		</div>
	</div>
</body>
<script type="text/javascript">
		$("body").bind('keyup',function(event){   
			if(event.keyCode==13){     
				$('form').submit();   
				}  
			/* if(event.keyCode==123){     
				alert("sdfsdf"); 
				}  */
			});
		//禁用查看源码
		document.oncontextmenu = function () { return false; };
        document.onkeydown = function () {
            if (window.event && window.event.keyCode == 123) {
                alert("F12已被禁用");
            	event.keyCode = 0;
                event.returnValue = false;
                return false;
            }
        };
</script>
</html>