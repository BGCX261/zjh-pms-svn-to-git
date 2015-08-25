<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="zh-CN">

<head>

	<title>凯盛项目管理系统</title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

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

				  <li><a href="#"><i class="icon-home"></i>最新动态</a></li>

				  <li>

					<a href="#"><i class="icon-flag"></i>目标</a>

				  </li>

				  <li><a href="#"><i class="icon-folder-open"></i>资料库</a></li>

				  <li><a href="#"><i class="icon-file"></i>文件共享</a></li>

				  <li class="active"><a href="#"><i class="icon-white icon-user"></i>联系人</a></li>

				  <li><a href="#"><i class="icon-fire"></i>想法</a></li>

				  <li><a href="#"><i class="icon-warning-sign"></i>Bug</a></li>

				  <li><a href="#"><i class="icon-cog"></i>项目设置</a></li>

				</ul>

			</div>

		</div>

		<div class="span9">

			<form class="form-horizontal">

        <fieldset>

          <legend>编辑联系人</legend>

          <div class="control-group">

            <label class="control-label" for="input01">姓名</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined">

            </div>

          </div>

		   <div class="control-group">

            <label class="control-label" for="input01">公司</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined">

            </div>

          </div>

		  <div class="line"></div>

		   <div class="control-group">

            <label class="control-label" for="input01">手机</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined">

            </div>

          </div>

		   <div class="control-group">

            <label class="control-label" for="input01">固话</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined">

            </div>

          </div>

		  <div class="control-group">

            <label class="control-label" for="input01">邮箱</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined">

            </div>

          </div>

		   <div class="line"></div>

		  <div class="control-group">

            <label class="control-label" for="input01">地址</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined">

            </div>

          </div>

		   <div class="line"></div>

		   <div class="control-group">

            <label class="control-label" for="input01">主页</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" value="">

			  <p class="help-block">http://www.xxx.com</p>

            </div>

          </div>

		   <div class="control-group">

            <label class="control-label" for="input01">微博</label>

            <div class="controls">

				<select class="span2">

					<option></option>

					<option>新浪微博</option>

					<option>腾讯微博</option>

					<option>Twitter</option>

				</select>

				<div class="input-prepend">

					<span class="add-on">@</span><input class="span2" id="prependedInput" size="16" type="text" x-webkit-speech="undefined">

                </div>

				

            </div>

          </div>

		   <div class="control-group">

            <label class="control-label" for="input01">简介</label>

            <div class="controls">

              <textarea class="span5" rows="6"></textarea>

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