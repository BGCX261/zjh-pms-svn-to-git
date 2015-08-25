<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">

<head>

	<title>凯盛项目管理系统</title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

	<script type="text/javascript" src="js/jquery.js"></script>

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

				  <li>

					<a href="goal.jspx"><i class="icon-flag"></i>目标</a>

				  </li>

				  <li><a href="data.jspx"><i class="icon-folder-open"></i>资料库</a></li>

				  <li><a href="docshare.jspx"><i class="icon-file"></i>文件共享</a></li>

				  <li><a href="contact.jspx"><i class="icon-user"></i>联系人</a></li>

				  <li class="active"><a href="#"><i class="icon-white icon-fire"></i>想法</a></li>

				  <li><a href="#"><i class="icon-warning-sign"></i>Bug</a></li>

				  <li><a href="#"><i class="icon-cog"></i>项目设置</a></li>

				</ul>

			</div>

		</div>

		<div class="span9">
		
			<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;margin-top:15px">

				<li class="active">

					<a href="#"><i class="icon-fire"></i>想法</a>

				</li>

				<li class="pull-right"><i class="icon-plus"></i><a href="idea.jspx?_m=new" class="link-black">发表想法</a></li>

			</ul>

			<div class="wall" style="margin-bottom:20px;">

		<c:forEach items="${requestScope.ideaList}" var="p">
					<blockquote>
						<h4>
							<a href="idea.jspx?_m=show&id=${p.id}">${p.title }</a>
						</h4>
						<p style="font-size:14px;line-height:1.5;">${p.content }</p>
						<small>${requestScope.username}发布于${p.createTime }</small>
						<a title="编辑" href="idea.jspx?_m=get&id=${p.id }">	
							<i class="icon-pencil"></i>编辑
						</a>
						<a title="删除" href="idea.jspx?_m=del&id=${p.id }">
							<i class="icon-trash"></i>删除
						</a>
					</blockquote>
					
					</c:forEach>

				

				<div class="pagination pull-right">

				  <ul>

					<li><a href="#">Prev</a></li>

					<li class="active">

					  <a href="#">1</a>

					</li>

					<li><a href="#">2</a></li>

					<li><a href="#">3</a></li>

					<li><a href="#">4</a></li>

					<li><a href="#">Next</a></li>

				  </ul>

				</div>

				

				<div class="clear"></div>

			</div>

		</div>

	  </div>

	</div>

</body>

</html>