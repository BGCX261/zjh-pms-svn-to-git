<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">

<head>

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

					<a href="idea.jspx"><i class="icon-fire"></i>想法</a> > ${idea.title }

				</li>

				

			</ul>

			<div class="wall">

				  <div class="page-header">

					<h3> ${idea.title }&nbsp;&nbsp;<small>${user.userName }发布于  ${idea.createTime } </small></h3>

				  </div>

				  <p> ${idea.content }</p>

				  

				  <div class="line">

					评论

				  </div>

				  <form>

					<textarea name="" id="" class="span8" rows="5"></textarea>

					<br/>

					<button class="btn">发布</button>

				  </form>

				 

				 <blockquote>

				  可以考虑

				  <small>

					樊凯发布于 1个月前

					<a href="" title="编辑"><i class="icon-pencil"></i></a>

				    <a href="" title="删除"><i class="icon-trash"></i></a>

				  </small>

				  

				</blockquote>

				<blockquote>

				  一种老酒装新瓶的技术

				  <small>

					乔布斯发布于 1个月前

					<a href="" title="编辑"><i class="icon-pencil"></i></a>

				    <a href="" title="删除"><i class="icon-trash"></i></a>

				  </small>

				  

				</blockquote>

				<blockquote>

				  还有HTML5哦

				  <small>

					艾莉婕发布于 1个月前

					<a href="" title="编辑"><i class="icon-pencil"></i></a>

				    <a href="" title="删除"><i class="icon-trash"></i></a>

				  </small>

				  

				</blockquote>

				

				<a href="idea.jspx">←返回想法列表</a>

			</div>

		</div>

	  </div>

	</div>

</body>

</html>