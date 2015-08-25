<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
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

				<a class="brand" href="#">凯盛项目管理系统</a>

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

				  <li><a href="project.jspx?_m=trend"><i class="icon-home"></i>最新动态</a></li>

				  <li>

					<a href="goal.jspx"><i class="icon-flag"></i>目标</a>

				  </li>

				  <li><a href="#"><i class="icon-white icon-folder-open"></i>资料库</a></li>

				  <li><a href="docshare.jspx"><i class="icon-file"></i>文件共享</a></li>

				  <li><a href="contact.jspx"><i class="icon-user"></i>联系人</a></li>

				  <li class="active"><a href="idea.jspx"><i class="icon-fire"></i>想法</a></li>

				  <li><a href="#"><i class="icon-warning-sign"></i>Bug</a></li>

				  <li><a href="#"><i class="icon-cog"></i>项目设置</a></li>

				</ul>

			</div>

		</div>

		<div class="span9">

			<form action="idea.jspx?_m=new" method="post" >

        <fieldset>

          <legend>分享新想法</legend>

          <div class="control-group">

            <label class="control-label" for="input01">标题</label>

            <div class="controls">

              <input type="text" class="span9" id="input01" x-webkit-speech="undefined" name="title" style="height:30px;"/>

            </div>

          </div>

		  <div class="control-group">

            <label class="control-label" for="input01">内容</label>

            <div class="controls">

              <textarea name="content" id="" class="span9" rows="15" style="height:100px;"></textarea>

            </div>

          </div>



          <div class="form-actions">

            <button type="submit" class="btn btn-primary">保存</button>

            <button class="btn" onclick="location.back()">返回</button>

          </div>

        </fieldset>

      </form>          

          	

		</div>

		<div class="span3">

			

		</div>

	  </div>

	</div>

</body>

</html>