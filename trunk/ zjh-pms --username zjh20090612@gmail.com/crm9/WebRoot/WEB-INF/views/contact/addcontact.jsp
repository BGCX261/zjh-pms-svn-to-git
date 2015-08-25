<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/bootstrap-dropdown.js"></script>
	<style type="text/css">
		body{
			margin-top:50px;
		}
		input,
		.page-header{
			background-color:rgb(240, 245, 248);
		}
		
		#beijing{
			width:400px;
			height:100px;
		}
		
		#telsort{
			display : inline;
		}
	</style>
	
</head>
<body>
	<div class="navbar navbar-fixed-top">
	  <div class="navbar-inner">
		<div class="container">
			<a class="brand" href="home.action"><img alt="Workxp-logo" src="../img/workxp-logo-68b281b82e899ff436ecf42ebcc1bc58.png"></a>
			<ul class="nav">
			  <li>
				<a href="../main.action">最新动态</a>
			  </li>
			  <li><a href="list.action">联系人</a></li>
			  <li><a href="../task/task.action">任务</a></li>
			  <li><a href="../deal/list.action">机会</a></li>
			  <li class="dropdown" id="menutest1">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#menutest1">
				  添加
				  <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
				  <li><a href="#"><i class="icon-user"></i>&nbsp;联系人</a></li>
				  <li><a href="addcompany.action"><i class="icon-home"></i>&nbsp;公司</a></li>
				  <li class="divider"></li>
				  <li><a href="../task/addtask.action"><i class="icon-ok"></i>&nbsp;任务</a></li>
				  <li><a href="../deal/adddeal.action"><i class="icon-star-empty"></i>&nbsp;机会</a></li>
				</ul>
			  </li>
			  
			</ul>
			<form class="navbar-search pull-left">
			  <input type="text" class="search-query" placeholder="搜索联系人或机会...">
			</form>
			
			<ul class="nav pull-right" >
			  <li>
				<a href="#">${user.username }</a>
			  </li>
			  <li class="dropdown" id="menutest2">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#menutest2">
				  管理
				  <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
				  <li><a href="#"><i class="icon-user"></i>&nbsp;同事</a></li>
				  <li><a href="#"><i class="icon-list-alt"></i>&nbsp;组</a></li>
				  <li class="divider"></li>
				  <li><a href="#"><i class="icon-asterisk"></i>&nbsp;账号</a></li>
				</ul>
			  </li>
			  <li class="divider-vertical"></li>
			  <li><a href="sign_in.action">退出</a></li>
			</ul>
			
		</div>
	  </div>
	</div>
	
	<div class="container">
		
			<div class="row">
				  <div class="span2"></div>
				  <div class="span8">
					
						<div class="page-header well">
						  <h2><i class="icon-user"></i>&nbsp;添加联系人</h2>	
						</div>	
						
	<div class="page-header well">
		<form id="myform" class="form-horizontal"  action="save.action"  method="post" >
		  <fieldset>
			<legend>完善资料</legend>
			<div class="control-group">
			  <label class="control-label">姓名</label>
			  <div class="controls">
				<input type="text" name="contact.name">
			  </div>
			</div>
			<div class="control-group">
			  <label class="control-label">公司</label>
			  <div class="controls">
				<input type="text" name="contact.companyname">
			  </div>
			</div>
			
			<div class="control-group string optional marco_polo_container">
				<label for="person_phone" class="string optional control-label"> 电话</label>
				<div class="controls">
					<div  id="contact_phone_list_company">
							<div style="" class="contact_methods"></div>
							<div class="addphone" ><a href="javascript:;">添加一个电话...</a></div>
					</div>
				</div>
			</div>
			
			
			  <div class="control-group string optional marco_polo_container">
				<label for="person_phone" class="string optional control-label">邮箱</label>
				<div class="controls">
					<div  id="addemail">
							<div style="" class="contact_methods"></div>
							<div class="addemail" ><a href="javascript:;">添加一个邮箱...</a></div>
					</div>
				</div>
			</div>
			
			
			<div class="control-group string optional marco_polo_container">
				<label for="person_phone" class="string optional control-label">IM</label>
				<div class="controls">
					<div  id="addim">
							<div style="" class="contact_methods"></div>
							<div class="addim" ><a href="javascript:;">添加一个即时聊天工具...</a></div>
					</div>
				</div>
			</div>
			
			<!-- 
			<div class="control-group string optional marco_polo_container">
				<label for="person_phone" class="string optional control-label">网址</label>
				<div class="controls">
					<div  id="addwebsite">
							<div style="" class="contact_methods"></div>
							<div class="addwebsite" ><a href="javascript:;">添加一个网址...</a></div>
					</div>
				</div>
			</div>
			 -->
			
			<div class="control-group">
			  <label class="control-label">地址</label>
			  <div class="controls">
				<input type="text" name="contact.address">
			  </div>
			</div>
			
			
			<div class="control-group">
			  <label class="control-label">新浪微博</label>
			  <div class="controls">
				<input type="text" name="contact.weibo">
				 <p >输入微博名称或ID</p>
			  </div> 
			</div>
			<div class="control-group">
			  <label class="control-label">背景信息</label>
			  <div class="controls">
				<textarea name="contact.content" id="beijing" rows="20"cols="40"></textarea>
				 <p >简介，如何认识的等</p>
			  </div> 
			</div>
			<div class="control-group">
			  <label class="control-label">谁可以看见？</label>
			  <div class="controls">
				
				<input class="nogroup" type="Radio" name="contact.view" value="all" >所有同事<br/>
				<input class="nogroup" type="Radio" name="contact.view" value="me" checked>只有我能看见<br/>
				<input id="checkgroup" type="Radio" name="contact.view" value="grouptype" >选择一个组...<br/>
					
					<div class="grouptype" style="display:none">
						<select name="grouptype" id="grouptype">
							<c:forEach items="${groupList }" var="list">
								<option value="${list.groupname }">${ list.groupname}</option>
							</c:forEach>
							</select>
					</div>
				 
			  </div> 
			</div>
			
			<div class="control-group">
			  <label class="control-label"></label>
			  <div class="controls">
				
				<button id="button1" class="btn btn-primary" type="button" >
				  保存联系人
				</button>
				<button id="button2" class="btn btn-success" type="button">
				  保存并继续添加
				</button>
				<button id="button3" class="btn" type="submit">
				  取消
				</button>
				
			  </div> 
			</div>
			  
			
		  </fieldset>
		</form>					
	</div>	
						
						
						
				  </div>
				  <div class="span4">
						<div class="page-header well">
							<table class="table">
							  <tbody>
							  	<tr>
							  		<td>您还可以通过下面的方式导入/导出联系人</td>
							  	</tr>
								<tr>
								  <td><a href=""><i class="icon-user"></i>&nbsp;添加联系人</a></td>
								</tr>
								<tr>
								  <td><a href=""><i class="icon-home"></i>&nbsp;添加公司</a></td>
								</tr>
								<tr>
								  <td><a href=""><i class="icon-user"></i>&nbsp;导入联系人</a></td>
								</tr>
								<tr>
								  <td><a href=""><i class="icon-user"></i>&nbsp;导出联系人</a></td>
								</tr>
							  </tbody>
							</table>
						</div>	
						
				  </div>
				</div>
			</div>
	
		
	<script type="text/javascript">
		
		
	
		$(document).ready(function(){
			
			$("#button1").click(function(){
					$("#myform").attr("action","save.action");
					$("#myform").submit();
			});
			
			$("#button2").click(function(){
					$("#myform").attr("action","saveadd.action");
					$("#myform").submit();
			});
			
			$("#button3").click(function(){
				$("#myform").attr("action","../main.action");
				$("#myform").submit();
			});
					
			$("#checkgroup").click(function(){
				$(".grouptype").show(500);
			});
			$(".nogroup").click(function(){
				$(".grouptype").hide(500);
			});
			
		
			$("#new_task").click(function(){
				$('#myModal').modal({
					backdrop:true,
					keyboard:true,
					show:false
				});
			});
			
			$(".addphone").click(function(){
				var div = $("<div class='contact_methods'></div>");
				$("#contact_phone_list_company").append(div);
				$("<input type='text' size='30' name='tel' id='addphone' >").appendTo(div);
				var select = $("<select  id='telsort' name='teltype' style='width:90px'>");
				select.append("<option value='company'>公司</option>");
				select.append("<option value='work'>工作</option>");
				select.append("<option value='mobile'>手机</option>");
				select.append("<option value='fax'>传真</option>");
				select.append("<option value='home'>住宅</option>");
				select.append("<option value='other'>其它</option>");
				div.append(select);
				$("<span class='addremove'>&nbsp;&nbsp;<a class='remove' href='javascript:;' onclick='deltelphone(this)'><img style='width:25px' src='../img/closebox.png'/></a></span>").appendTo(div);	
			});
			
			$(".addemail").click(function(){
				var div = $("<div class='contact_methods'></div>");
				$("#addemail").append(div);
				$("<input type='text' size='30' name='mail' id='addmail' >").appendTo(div);
				var select = $("<select  id='telsort' name='mailtype' style='width:90px'>");
				select.append("<option value='company'>公司</option>");
				select.append("<option value='work'>工作</option>");
				select.append("<option value='mobile'>手机</option>");
				select.append("<option value='fax'>传真</option>");
				select.append("<option value='home'>住宅</option>");
				select.append("<option value='other'>其它</option>");
				div.append(select);
				$("<span class='addremove'>&nbsp;&nbsp;<a class='remove' href='javascript:;' onclick='deltelemail(this)'><img style='width:25px' src='../img/closebox.png'/></a></span>").appendTo(div);	
			});
			
			$(".addim").click(function(){
				var div = $("<div class='contact_methods'></div>");
				$("#addim").append(div);
				$("<input type='text' size='30' name='im' id='addim' >").appendTo(div);
				var select = $("<select  id='telsort' name='imtype' style='width:90px'>");
				select.append("<option value='company'>QQ</option>");
				select.append("<option value='work'>MSN</option>");
				div.append(select);
				$("<span class='addremove'>&nbsp;&nbsp;<a class='remove' href='javascript:;' onclick='deltelim(this)'><img style='width:25px' src='../img/closebox.png'/></a></span>").appendTo(div);	
			});
			
			$(".addwebsite").click(function(){
				var div = $("<div class='contact_methods'></div>");
				$("#addwebsite").append(div);
				$("<input type='text' size='30' name='website' id='addwebsite' >").appendTo(div);
				var select = $("<select  id='telsort' name='websitetype' style='width:90px'>");
				select.append("<option value='company'>公司</option>");
				select.append("<option value='work'>工作</option>");
				select.append("<option value='mobile'>手机</option>");
				select.append("<option value='fax'>传真</option>");
				select.append("<option value='home'>住宅</option>");
				select.append("<option value='other'>其它</option>");
				div.append(select);
				$("<span class='addremove'>&nbsp;&nbsp;<a class='remove' href='javascript:;' onclick='deltelwebsite(this)'><img style='width:25px' src='../img/closebox.png'/></a></span>").appendTo(div);	
			});
			
		});
		
		
		
		function deltelphone(obj) {
			var div =  obj.parentNode.parentNode;
			document.getElementById("contact_phone_list_company").removeChild(div);
		}
		function deltelemail(obj) {
			var div =  obj.parentNode.parentNode;
			document.getElementById("addemail").removeChild(div);
		}
		function deltelim(obj) {
			var div =  obj.parentNode.parentNode;
			document.getElementById("addim").removeChild(div);
		}
		function deltelwebsite(obj) {
			var div =  obj.parentNode.parentNode;
			document.getElementById("addwebsite").removeChild(div);
		}
		
		
	</script>
</body>
</html>