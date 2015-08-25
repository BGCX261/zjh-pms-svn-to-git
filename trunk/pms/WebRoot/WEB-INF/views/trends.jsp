<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
					<a href="#" class="brand">凯盛项目管理系统</a>
				</div>
			</div>
	</div>
	<div class="container">
		
		<div class="row">
			<div class="span3">
				<div class="well style="padding: 8px 0;">
					<ul class="nav nav-list">
						<li class="nav-header">新Apple总部项目</li>
						<li class="divider"></li>
						<li class="active">
							<a href="trend.jspx?_m=trend&id=${requestScope.code}">
							<i class="icon-white icon-home"></i>
							最新动态
							</a>
						</li>
						<li>
							<a href="goal.jspx">
							<i class="icon-flag"></i>
							目标
							</a>
						</li>
						<li>
							<a href="data.jspx">
							<i class="icon-folder-open"></i>
							资料库
							</a>
						</li>
						<li>
							<a href="docshare.jspx">
							<i class="icon-file"></i>
							文件共享
							</a>
						</li>
						<li>
							<a href="contact.jspx">
							<i class="icon-user"></i>
							联系人
							</a>
						</li>
						<li>
							<a href="idea.jspx">
							<i class="icon-fire"></i>
							想法
							</a>
						</li>
						<li>
							<a href="#">
							<i class="icon-warning-sign"></i>
							Bug
							</a>
						</li>
						<li>
							<a href="#">
							<i class="icon-cog"></i>
							项目设置
							</a>
						</li>
				</div>
			
			</div>
			<div class="span6">
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;">
					<li class="active">
					<i class="icon-th"></i>
					你在想什么？
					</li>
				</ul>
				
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;">
					<li class="active">
					<form style="margin:0px" acation="trends.jspx" >
						<textarea id="" rows="3" style="width:415px" name="content"></textarea>
						<button class="btn btn-primary" name="_m" value="save">发布</button>
					</form>
					</li>
				</ul>
				
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;margin-top:20px">
					<li class="active">
					<i class="icon-th"></i>
					信息流
					</li>
				</ul>
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0; height:60px;">
					<li class="active">

					

				

					</li>
				</ul>
				<div class="wall"> </div>
			</div>
			<div class="span3">
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;">
					<li class="active">
					
					<strong>我的任务</strong>
					</li>
				</ul>
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;">
					<li class="active">
						<ul>
							<li class="active">
							<li>任务1(xxx创建)</li>
							<li>任务1(xxx创建)</li>
							<li>任务1(xxx创建)</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		document.getElementsByName("")
	</script>
</body>
</html>