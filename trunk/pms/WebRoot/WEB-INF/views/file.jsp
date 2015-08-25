<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



<!DOCTYPE HTML>
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

				  <li><a href="#"><i class="icon-home"></i>最新动态</a></li>

				  <li>
					<a href="#"><i class="icon-flag"></i>目标</a>
				  </li>
				  <li><a href="#"><i class="icon-folder-open"></i>资料库</a></li>
				  <li class="active"><a href="#"><i class="icon-white icon-file"></i>文件共享</a></li>
				  <li><a href="#"><i class="icon-user"></i>联系人</a></li>
				  <li><a href="#"><i class="icon-fire"></i>想法</a></li>
				  <li><a href="#"><i class="icon-warning-sign"></i>Bug</a></li>
				  <li><a href="#"><i class="icon-cog"></i>项目设置</a></li>
				</ul>
			</div>

		</div>

		<div class="span9">
			<!-- <a href="file.jspx?_m=upload&ftid=${ftid }" class="btn btn-primary" style="float:right"><i class="icon-white  icon-share"></i>上传资料</a>  -->
				<a href="#myModal"  data-toggle="modal"  class="btn btn-primary" style="float: right;"><i class="icon-white  icon-share"></i>上传资料</a>
			
			<div class="modal hide" id="myModal"  style="padding-top:10px;">
				<form action="file.jspx?m=upload&id=${requestScope.fileTypeId}">
				  <div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal">×</button>
				    <h3>上传资料</h3>
				  </div>
				  <div class="modal-body">
				     <textarea name="fileType" id="msg" style="width: 415px;" rows="1"  placeholder="#文件名#"  style="width: 400px; height: 75px; overflow: hidden; padding-bottom: 5px;border-radius:8px;"></textarea>
				  </div>
				  <div class="control-group">
					            <label for="fileInput" class="control-label"></label>
					            <div class="controls">
					              <input type="file" id="fileInput" class="input-file" name="myfile" >
					            </div>
					          </div>
				  <div class="modal-footer">
				    <a href="#" class="btn" data-dismiss="modal">关闭</a>
				    <input type="submit" class="btn btn-primary" value="上传"/>
				  </div>
				  </form>
			</div>
			
			<div class="clear"></div>

			<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;margin-top:40px">
				<li class="active">
					<i class="icon-th"></i><a href="file.html">文件共享</a>><a href="task.html">客户资料</a>
				</li>

				<li style="float:right"><a href="edit_goal.html" class="link-black" title="删除该文件夹"><i class="icon-trash"></i></a></li>
			</ul>
			<div class="wall" style="margin-top:15px;">
				<table class="table table-striped">
					<thead>
						<tr>
							<th width="30px"></th>

							<th width="60%">名称</th>

							<th width="20%">大小</th>
							<th>创建人</th>
							<th></th>
						</tr>
					</thead>

					<tbody>
					<c:forEach items="${requestScope.fileList }" var="file">
						<tr>

							<td>
								<img src="./img/file.png"/>
							</td>

							<td><a href="#">${file.name }.${file.fileName }</a></td>

							<td>5.5MB${file.fileSize }</td>

							<td>樊凯 ${sessionScope.user.userName }</td>
							<td><a href=""><i class="icon-trash"></i></a></td>

						</tr>
					</c:forEach>
					
						<tr>
							<td>
								<img src="img/file.png"/>
							</td>
							<td><a href="#">客户报表实例.xls</a></td>

							<td>3456MB</td>

							<td>樊凯</td>
							<td><a href=""><i class="icon-trash"></i></a></td>
						</tr>
						<tr>
							<td>
								<img src="img/file.png"/>
							</td>
							<td><a href="#">广告语文档.pdf</a></td>

							<td>5.5MB</td>
							<td>樊凯</td>
							<td></td>
						</tr>
					</tbody>
				</table>

				<a href="docshare.jspx">←返回</a>

			</div>

		</div>

	  </div>

	</div>

</body>

</html>