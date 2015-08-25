<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">

	<title>凯盛项目管理系统</title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

	<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>

	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
</head>

<body class="body" style="padding-top:60px;">

	

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="brand" href="#">Kaishengit PMS</a>

			</div>

		</div>

	</div>

	

	

	<div class="container">

	  <div class="row">

		<div class="span3">

			<div style="padding: 8px 0;" class="well">

				<ul class="nav nav-list">

				  <li class="nav-header">新Apple总部项目</li>

				  <li class="divider"></li>

				  <li><a href="trends.jspx"><i class="icon-home"></i>最新动态</a></li>

				  <li class="active">

					<a href="goal.jspx"><i class="icon-white icon-flag"></i>目标</a>

				  </li>

				  <li><a href="data.jspx"><i class="icon-folder-open"></i>资料库</a></li>

				  <li><a href="docshare.jspx"><i class="icon-file"></i>文件共享</a></li>

				  <li><a href="contact.jspx"><i class="icon-user"></i>联系人</a></li>

				  <li><a href="idea.jspx"><i class="icon-fire"></i>想法</a></li>

				  <li><a href="#"><i class="icon-warning-sign"></i>Bug</a></li>

				  <li><a href="#"><i class="icon-cog"></i>项目设置</a></li>

				</ul>

			</div>

		</div>

		<div class="span9">

			

			<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;margin-top:15px">

				<li class="active">

					<a href="javascript:;"><i class="icon-th"></i> ${goal.name }</a>

				</li>

				<li style="float:right">

					<i class="icon-edit"></i><a href="goal.jspx?_m=get&id=${goal.id }" class="link-black">编辑</a>

				</li>

			</ul>

			<div class="wall">

				<p> ${goal.desc }</p>

				<div class="progress progress-danger">

					<div class="bar" style="width: ${goal.state}%;">当前目标总进度完成 ${goal.state }%</div>

				</div>



				<div class="page-header">

					<a href="task.jspx?_m=save&goalid=${goal.id }" class="btn btn-success"><i class="icon-plus icon-white"></i>添加新任务</a>

				</div>



				<c:forEach items="${requestScope.taskList }" var="task">

				<dl>

        			<dt><i class="icon-bookmark"></i><a href="task.jspx?_m=get&id=${task.id }&userid=${requestScope.user.id}"> ${task.name }</a>&nbsp;&nbsp;&nbsp;[${requestScope.user.userName }]</dt>

        			<dd> ${task.desc }</dd>

        			
					
	        			<div class="progress ">
	
							<div class="bar" style="width: ${task.rate}%;">当前进度${task.rate }%</div>
	
						</div>
					



					<!--  

        			<dt style="margin-top:15px"><i class="icon-bookmark"></i><a href="#">写DAO和Services类</a>&nbsp;&nbsp;&nbsp;[金泰熙]</dt>

        			<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>

        			<div class="progress progress-success">

					  <div class="bar" style="width:100%;">100%</div>

					</div>



        			<dt style="margin-top:15px"><i class="icon-bookmark"></i><a href="#">使用TwitterBootStrop重构前端页面</a>&nbsp;&nbsp;&nbsp;[艾莉婕]</dt>

        			<dd>Etiam porta sem malesuada magna mollis euismod.</dd>

        			<div class="progress">

					  <div class="bar" style="width:35%;">35%</div>

					</div>
					-->

      			</dl>
				</c:forEach>


			</div>

			

		</div>

	  </div>

	</div>

</body>

</html>