<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<title></title>
	<style type="text/css">
		body{
			padding-top:60px;
		}
	
	</style>
	<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="main.jspx">na凯盛项目管理系统</a>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="span9">
				<form class="form-horizontal" action="project.jspx" method="post">
					<fieldset>
						<legend>开始一个新项目</legend>
						<div class="control-group">
						<input type="hidden" name="_m" value="save"/>
							<label class="control-label" for="input01">项目名称</label>
							<div class="controls">
								<input id="input01" class="span5" type="text" x-webkit-speech="" style="height:30px;" name="name"/>
								<p class="help-block">In addition to freeform text, any HTML5 text-based input appears like so.</p>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">项目描述</label>
							<div class="controls">
								<textarea class="span5" rows="4" name="desc"></textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="multiSelect">负责人</label>
							<div class="controls">
								<select id="multiSelect">
									<option></option>
									<option>aa</option>
									<option>Jerry</option>
									<option>Rose</option>
									<option>Adsen</option>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="input01">项目成员</label>
							<div class="controls">
								<input id="input01" class="span5" type="text" x-webkit-speech="" style="height:30px;">
							</div>
						</div>
						<div class="form-actions">
							<button class="btn btn-primary" type="submit">保存</button>
							<button class="btn" onclick="location.back()"><a href="project.jspx">返回</a></button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>