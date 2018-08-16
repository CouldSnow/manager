<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String path = request.getContextPath();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 hello
 ${list}

 <form action="<%=path %>consume/add"  method="post" >
 		<input type="text" name="csmnumber"value="100.00">
 		<input type="text" name="csmDate"value="2018-8-13">
 		<input type="text" name="msg"value="assss">
 		<input type="text" name="label"value="1">
 		<input type="text" name="type"value="2">
 		<input type="text" name="source"value="1">
 		<input type="submit" value="提交">
 </form>
</body>
</html>