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
					<a href="#" class="brand">Kaishengit PMS</a>
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
						<li>
							<a href="trends.jspx">
							<i class="icon-home"></i>
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
						<li class="active">
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
			<div class="span9">
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;margin-top:15px">
					<li class="active">
						<a href="doclist.jspx">
							<i class="icon-th"></i>
							文件列表
						</a>
					</li>
					<li class="pull-right">
						<i class="icon-plus"></i>
						<a class="link-black" href="docshare.jspx?_m=save">创建文件夹</a>
					</li>
				</ul>
				<div class="wall" style="margin-top:15px;">
					<table class="table table-striped">
						<thead>
							<tr>
								<th width="30px"></th>
								<th width="60%">名称</th>
								<th width="20%">大小</th>
								<th>创建人</th>
							</tr>
						</thead>
						<tbody>
						
						<c:if test="${fn:length(requestScope.ftList) == 0 }">
			        	<tr >
			        		<td colspan="5">暂时没有文件夹</td>
			        	</tr>
			       		 </c:if>
			       		 
						<c:forEach items="${requestScope.ftList }" var="ft">
							<tr>
								<td>
									<img src="./img/folder.png">
								</td>
								<td>
									<a href="file.jspx?&ftid=${ft.id }">${ft.name}</a>
								</td>
								<td>17files at 5.5MB</td>
								<td>${requestScope.user.userName }</td>
							</tr>
						</c:forEach>
						<!--  
							<tr>
								<td>
									<img src="./img/folder.png">
								</td>
								<td>
									<a href="#">客户资料</a>
								</td>
								<td>17files at 5.5MB</td>
								<td>xxx</td>
							</tr>
							<tr>
								<td>
									<img src="./img/folder.png">
								</td>
								<td>
									<a href="#">客户资料</a>
								</td>
								<td>17files at 5.5MB</td>
								<td>xxx</td>
							</tr>
						-->
							
						</tody>
					</table>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>