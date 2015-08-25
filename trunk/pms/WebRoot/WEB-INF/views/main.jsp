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
				<a class="brand" href="#">凯盛项目管理系统</a>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="span9">
				<div class="page-header">
					<h2>项目列表</h2>
				</div>
				<a class="btn btn-success" href="project.jspx?_m=save">
					<i class="icon-plus icon-white"></i>
					开始一个新项目
				</a>

				<c:forEach items="${requestScope.projectList }" var="p">
					<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;margin-top:15px">
						<li class="active">
							<a href="project.jspx?_m=trend&id=${p.id }">
								<i class="icon-th"></i>
								${p.name }
							</a>
						</li>
					</ul>
					<div class="wall" style="margin-top:15px;">
						<p>${p.desc }</p>
					</div>
					
					<!--  
					<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0;margin-top:15px">
						<li class="active">
							<a href="javascript:;">
								<i class="icon-th"></i>
								Google IO 2012项目
							</a>
						</li>
					</ul>
					<div class="wall" style="margin-top:15px;">
						<p>北京市公安局有关负责人表示，利用互联网编造、传播谣言的行为严重扰乱社会秩序、影响社会稳定、危害社会诚信，公安机关对此将依法查处。希望广大网民自觉遵守法律法规，不信谣、不传谣，发现谣言及时举报，共同维护健康的网络环境和良好的社会秩序。</p>
					</div>
					-->

				</c:forEach>

			</div>
			<div class="span3"></div>
		</div>
	</div>
</body>
</html>