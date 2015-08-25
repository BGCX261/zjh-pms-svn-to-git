<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
	<script type="text/javascript" src="js/jquery.js"></script>
	<title>index</title>
	<!-- background-image:url(img/bg1.jpg);
			background-color:#59b4e9; -->
	<style type="text/css">
		body{
			
			background-position:center;	
			
		}
		.containter{
			margin-left:auto;
			margin-right:auto;
			
		}
		.myform{
			background-color: #dff1f;
			border: 1px solid rgba(0, 0, 0, 0.05);
			border-radius: 10px 10px 10px 10px;
			
			margin-bottom: 20px;
			min-height: 20px;
			padding: 19px;
		}
		input{
			border-radius: 4px 4px 4px 4px;
		}
		button{
			background-color: #0074CC;
			border-radius: 8px 8px 8px 8px;
			color:#FFFFFF;
			height:27px;
		}
		img{
			width:130px;
		}
		span{
    		color:red;
    	}
	</style>
	
</head>
<body>
	<c:choose>
  		<c:when test="${param.code == '10001'}">
  			<div style="color:red">用户名或密码错误</div>
  		</c:when>
  		<c:when test="${param.code == '10002' }">
  			<div style="color:red">请先登录</div>
  		</c:when>
  		<c:when test="${param.code == '10003' }">
  			<div style="color:red">验证码错误</div>
  		</c:when>
  	</c:choose>
	<div class="containter" style="margin-top:100px">
		<form class="myform"  style="width:220px;margin:0px auto;" action="login.jspx" method="post">
			<h3>Kaishengit-PMS</h3>
			<label>账号: </label>
			<input type="text" name="username" class="input1"/><span id="name_error"></span><br/>
			<br/>
			<label>密码: </label>
			<input type="password" name="password" class="input2"/><span id="pwd_error"></span><br/>
			<br/>
			
			<button type=submit" id="btn">进入系统</button>
			
		</form>
	</div>
	
		
</body>
</html>