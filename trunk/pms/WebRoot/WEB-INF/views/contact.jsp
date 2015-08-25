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
						<li>
							<a href="docshare.jspx">
							<i class="icon-file"></i>
							文件共享
							</a>
						</li>
						<li class="active">
							<a href="#">
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
				<ul class="breadcrumb" style="margin-bottom:0px;border-radius: 3px 3px 0 0">
					<li class="active">
						<a href="http://kaishengitpms.sinaapp.com/task.html">
							<i class="icon-user"></i>
							联系人
						</a>
					</li>
				</ul>
				<div class="wall" style="margin-top:15px;">
					<div class="row">
						<div class="span3">
							<a class="btn span2" href="#">
								<i class="icon-plus"></i>
								添加联系人
							</a>
							<br/>
							<div class="clear"></div>
							<ul class="unstyled" style="margin-top:15px">
								<li style="line-height:30px">
									<i class="icon-list-alt"></i>
									<a href="">艾莉婕</a>
								</li>
								<li style="line-height:30px">
									<i class="icon-list-alt"></i>
									<a href="">乔布斯</a>
								</li>
								<li style="line-height:30px">
									<i class="icon-list-alt"></i>
									<a href="">阿诺施瓦辛格</a>
								</li>
							
								<div class="pagination pull-right">
								<a href="#">更多</a>
								</div>
							</ul>
						
						
						</div>
						<div class="span5" style="min-height:400px;border-left:1px solid #ccc;padding-left:15px">
							<address>
								<h3>艾莉婕</h3>
								<p>焦作凯盛信息技术有限公司</p>
								<small>手机</small>
								13999999999
								<br>
								<small>固话</small>
								0391-3581922
								<br>
								<br>
								<small>邮箱</small>
								fankai@kaishengit.com
								<br>
								<small>地址</small>
								塔南路摩登商业街9号楼
								<br>
								<br>
								<small>主页</small>
								<a href="http://www.kaishengit.com/">http://www.kaishengit.com</a>
								<br>
								<small>微博</small>
								<a href="https://twitter.com/fankay">@fankay</a>
								<br>
								</address>
						
								<div class="line">记录</div>
								<blockquote>
									4月1日开演唱会
									<small>xx发布于 3天前</small>
								</blockquote>
								<blockquote>
									中午一起吃的午饭
									<small>xx发布于 4天前</small>
								</blockquote>
								<blockquote>
									初次见面，不错不错...
									<small>xx发布于 1个月前</small>
								</blockquote>
						
								<a href="http://kaishengitpms.sinaapp.com/contact_note.html">查看所有记录</a>
								<br>
								<br>
								<br>
								<a class="btn btn-primary" href="editcontact.jspx">
									<i class="icon-pencil icon-white"></i>
									编辑
								</a>
								<a class="btn btn-danger">
									<i class="icon-trash icon-white"></i>
									删除
								</a>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>