<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String websocketPath =request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	pageContext.setAttribute("path", path);
	pageContext.setAttribute("basepath", basePath);
	pageContext.setAttribute("websocketPath", websocketPath);
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
 
 <!-- websocket -->
  <script src="${path}/plugins/websocket/sockjs.min.js"></script>
<title>Insert title here</title>
</head>
<body>
		 <!-- 最外边框 -->
        <div style="margin: 20px auto; border: 1px solid blue; width: 300px; height: 500px;">

            <!-- 消息展示框 -->
            <div id="msg" style="width: 100%; height: 70%; border: 1px solid yellow;overflow: auto;"></div>

            <!-- 消息编辑框 -->
            <textarea id="tx" style="width: 100%; height: 20%;"></textarea>

            <!-- 消息发送按钮 -->
            <button id="TXBTN" style="width: 100%; height: 8%;">发送数据</button>

        </div>
</body>

	<script type="text/javascript">
	
	
	$(function() {
         //获取全局的变量
	    //var websocket = window.top['_CACHE']["websocket"];

          var websoket;
	    // 首先判断是否 支持 WebSocket
 	    if('WebSocket' in window) {
	        websocket = new WebSocket("ws://${websocketPath}websocket");
	    } else if('MozWebSocket' in window) {
	        websocket = new MozWebSocket("ws://${websocketPath}websocket");
	    } else {
	        websocket = new SockJS("http://${websocketPath}sockjs/websocket");
	    }

	    // 打开时
	    websocket.onopen = function(evnt) {
	    	
	        console.log("  websocket.onopen  ");
	    };


	    // 处理消息时
	    websocket.onmessage = function(evnt) {
	        $("#msg").append("<p>(<font color='red'>" + evnt.data + "</font>)</p>");
	        console.log("  websocket.onmessage   ");
	    };


	    websocket.onerror = function(evnt) {
	        console.log("  websocket.onerror  ");
	    };

	    websocket.onclose = function(evnt) {
	        console.log("  websocket.onclose  ");
	    };


	    // 点击了发送消息按钮的响应事件
	    $("#TXBTN").click(function(){

	        // 获取消息内容
	        var text = $("#tx").val();

	        $('#tx').val('')
	        // 判断
	        if(text == null || text == ""){
	            alert(" content  can not empty!!");
	            return false;
	        }

	        var msg = {
	            msgContent: text,
	            postsId: 1
	        };

	        // 发送消息
	        websocket.send(JSON.stringify(msg));
             
	        
	    });


	});
	</script>
</html>