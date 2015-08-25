<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>

<html lang="zh-CN">

<head>

	<meta charset="UTF-8">

	<title>凯盛项目管理系统</title>

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />

</head>

<body class="body">

	

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

			<form class="form-horizontal" action="task.jspx?_m=edit" method="post">

        <fieldset>

          <legend>编辑任务</legend>

          <div class="control-group">
			<input type="hidden" name="id" value="${task.id }"/><br/>
			
            <label class="control-label" for="input01">任务名称</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined" name="name" value="${task.name }">

              <p class="help-block">In addition to freeform text, any HTML5 text-based input appears like so.</p>

            </div>

          </div>

          <div class="control-group">

            <label class="control-label" for="input01">开始时间</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined" name="begintime" value="${task.beginTime }">

            </div>

          </div>

          <div class="control-group">

            <label class="control-label" for="input01">截止时间</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined" name="endtime" value="${task.endTime }">

            </div>

          </div>

          <div class="control-group">

            <label class="control-label" for="input01">任务描述</label>

            <div class="controls">

              <textarea class="span5" rows="8" name="desc"> ${task.desc }</textarea>

            </div>

          </div>

          <div class="control-group">

            <label class="control-label" for="multiSelect">状态</label>

            <div class="controls">

              <select id="multiSelect" name="state">

                <option selected="selected">新任务</option>

                <option>进行中</option>

                <option>已完成</option>

              </select>

            </div>

          </div>

          <div class="control-group">

            <label class="control-label" for="multiSelect">级别</label>

            <div class="controls">

              <select id="multiSelect" name="level">

                <option>重要紧急</option>

                <option>重要不紧急</option>

                <option>紧急不重要</option>

                <option>不紧急不重要</option>

              </select>

            </div>

          </div>

          <div class="control-group">

            <label class="control-label" for="multiSelect">负责人</label>

            <div class="controls">

              <select id="multiSelect" name="username">

              	<option></option>

                <option selected="selected">Tom</option>

                <option>Jerry</option>

              </select>

            </div>

          </div>

          <div class="control-group">

            <label class="control-label" for="input01">当前进度</label>

            <div class="controls">

              <input type="text" class="span5" id="input01" x-webkit-speech="undefined" name="rate" value="${task.rate }">

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