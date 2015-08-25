<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta charset="UTF-8">
    <title>My JSP 'newgoal.jsp' starting page</title>
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
		<div class="span9">
			<form class="form-horizontal" action="goal.jspx" method="post">
				
        		<fieldset>
         		 <legend>添加一个新目标</legend>
				<input type="hidden" name="_m" value="save"/>
	          	<div class="control-group">
				
	            <label class="control-label" for="input01">目标名称 </label>
					
	            <div class="controls">
	            
	              <input type="text" class="span5" id="input01" x-webkit-speech="undefined" name="name" style="height:30px;"/>
	
	              <p class="help-block">In addition to freeform text, any HTML5 text-based input appears like so.</p>
	
	            </div>

          </div>

          <div class="control-group">
            <label class="control-label" for="input01">目标描述</label>
            <div class="controls">
              <textarea class="span5" rows="8" name="desc"></textarea>
            </div>
          </div>
          
		 <div class="control-group">
            <label class="control-label" for="input01">目标进度率</label>
            <div class="controls">
            	<input type="text" name="state" />
            </div>
          </div>
          
          <div class="form-actions">
            <button type="submit" class="btn btn-primary" >保存</button>
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
