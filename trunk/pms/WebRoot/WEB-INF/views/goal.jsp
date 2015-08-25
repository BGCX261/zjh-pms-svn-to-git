<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>凯盛项目管理系统</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<script type="text/javascript" src="http://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
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

			<div class="btn-group" style="float:right">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">操作<span class="caret"></span></a>
          		<ul class="dropdown-menu">

            		<li><a href="goal.jspx?_m=save"><i class="icon-plus"></i>添加新目标</a></li>

            		<li><a href="#"><i class="icon-zoom-in"></i>浏览所有任务</a></li>

          		</ul>

        	</div>

			<div class="clear"></div>
			
			<c:forEach items="${requestScope.goalList }" var="g">
			
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;margin-top:40px">
	
					<li class="active">
	
						<a href="goal.jspx?_m=show&goalid=${g.id }"><i class="icon-th"></i>${g.name }</a>
	
					</li>				
	
					<li style="float:right"><i class="icon-edit"></i><a href="goal.jspx?_m=get&id=${g.id }" class="link-black">编辑</a></li>
	
				</ul>
	
				<div class="wall">
	
					<p>${g.desc }</p>
	
					<div class="progress progress-danger">
	
						<div class="bar" style="width: ${g.state}%;">已完成 ${g.state }%</div>
	
					</div>
	
				</div>

			</c:forEach>
		
		</div>

	  </div>

	</div>

</body>

</html>
