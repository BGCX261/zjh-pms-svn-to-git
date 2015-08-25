<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title></title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	
	<style type="text/css">
		body{
			background-image:url(img/bg.png);
			
		}
		.containter{
			margin-left:auto;
			margin-right:auto;
			
		}
		.myform{
			background-color: #F5F5F5;
			border: 1px solid rgba(0, 0, 0, 0.05);
			border-radius: 4px 4px 4px 4px;
			
			margin-bottom: 20px;
			min-height: 20px;
			padding: 19px;
		}
		input{
			border-radius: 2px 2px 2px 2px;
			height:25px;
			width:350px;
		}
		button{
			background-color: #0074CC;
			border-radius: 4px 4px 4px 4px;
			color:#FFFFFF;
			height:27px;
		}
	</style>
  </head>
  <body>
    <div class="containter" style="margin-top:50px">
		<form class="myform"  style="width:400px;margin:0px auto;" action="login.action" method="post">
			<h3>系统登录</h3><br/>
			<h3>用户名</h3>
			<input type="text" name="user.username" class="input1"/><br/>
			<h3>密码</h3>
			<input type="password" name="user.password" class="input2"/><br/>
			<button type=submit">进入系统</button>
			<p></p>
			<a style="font-size:12px" href="http://www.kaishengit.com">@焦作凯盛信息技术有限公司</a>
		</form>
	</div>
  </body>
</html>
