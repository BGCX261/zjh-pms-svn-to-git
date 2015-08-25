<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'task.jsp' starting page</title>
    <link href="../css/application-766336123a9b61bedf26182718c02860.css" media="all" rel="stylesheet" type="text/css">
	<script type="text/javascript" async="" src="js/ga.js"></script><script src="../js/application-e8369d8531953caeeedd0118548cdc1c.js" type="text/javascript"></script>
	<meta content="authenticity_token" name="csrf-param">
<meta content="4NAq56gfzq9IhDJLLR4pUWgQs7xLI5nFWq6+6mYHmUA=" name="csrf-token">
	
	
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
			$('#search').marcoPolo({
			  url: '/search',
			  formatItem: function (data, $item) {
			    return data.icon + data.name;
			  },
			  onSelect: function (data, $item) {
					if (data.url != '#') {
						$('#search').val(data.name);
				    window.location = data.url;
					}
			  }
			});
			
			validate_form('#task_form', true)
			
			$('a.zoom').fancyZoom({scaleImg: true, closeOnClick: true})
			
			$('#search-link').data('tooltip').options.placement = 'bottom';
		});
		
		$(document).scroll(function(){
	    if ($('.back-top').attr('data-top') <= $(this).scrollTop())
        $('.back-top').removeClass('hide');
	    else
        $('.back-top').addClass('hide');
		});
		
	</script>
  </head>
  <body class="crm">
	<div class="navbar navbar-fixed-top">
  	<div class="navbar-inner">
	  	<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="home.action"><img alt="Workxp-logo" src="../img/workxp-logo-68b281b82e899ff436ecf42ebcc1bc58.png"></a>
				<div class="nav-collapse">
		  		<ul class="nav">
						<li class="divider-vertical"></li>
						<li class=""><a href="../main.action">最新动态</a></li>
						<li class=""><a href="../contact/list.action">联系人</a></li>
						<li class="active"><a href="#">任务</a></li>
						
						<li class=""><a href="../deal/list.action">机会</a></li>
			    </ul>
					
					<ul class="nav">
					  <li class="dropdown">
							<a href="https://1344267101.workxp.info/tasks#" class="dropdown-toggle" data-toggle="dropdown">
						    添加
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu new-actions">
						    <li><a href="../contact/addcontact.action"><i class="icon-person"></i> 联系人</a></li>
								<li><a href="../contact/addcompany.action"><i class="icon-company"></i> 公司</a></li>
								<li class="divider"></li>
								<li><a href="addtask.action"><i class="icon-ok"></i> 任务</a></li>
								
								<li><a href="../deal/list.action"><i class="icon-dollar"></i> 机会</a></li>
						  </ul>
						</li>
					</ul>
					<ul class="nav">
						<li class="divider-vertical"></li>
					</ul>
					<form class="navbar-search">
						<input type="text" name="search" id="search" class="search-query mp_input" placeholder="搜索联系人或机会" autocomplete="off" x-webkit-speech="" style="height:30px;"><ul class="typeahead dropdown-menu mp_list" style="display: none; "></ul>
			    </form>
					
					<ul class="nav">
						<li><a href="https://1344267101.workxp.info/notes/search" rel="tooltip" id="search-link" data-original-title="搜索事件"><i class="icon-cog"></i></a></li>
					</ul>
			
					<ul class="nav pull-right">
						<li class=""><a href="https://1344267101.workxp.info/profiles">${sessionScope.user.username }</a></li>
						
								<li class="dropdown">
									<a data-toggle="dropdown" class="dropdown-toggle" href="https://1344267101.workxp.info/tasks#">管理 <b class="caret"></b></a>
									<ul class="dropdown-menu settings">
										<li><a href="https://1344267101.workxp.info/product_users"><i class="icon-user"></i> 同事</a></li>
										<li><a href="https://1344267101.workxp.info/groups"><i class="icon-group"></i> 组</a></li>
										<li class="divider"></li>
										<li><a href="https://1344267101.workxp.info/settings"><i class="icon-cog"></i> 帐号</a></li>
									</ul>
								</li>
						
						<li class="divider-vertical"></li>
						<li class=""><a href="https://1344267101.workxp.info/users/sign_out">退出</a></li>
			    </ul>
				</div>
		  </div>
	  </div>
  </div>

	
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span8">
				<div class="well screen">
					<div class="page-header header">

						
							<div class="right-links">
		<a href="" class="current">待办任务</a> |
		<a href="https://1344267101.workxp.info/tasks?collection=completed">已完成的任务</a>
			| <a href="https://1344267101.workxp.info/tasks?collection=assigned">我分配的任务</a>
	</div>
	待办任务

					</div>
					<div class="live_search_spinner" behavior="spinner" id="parties_loading">
					  <div class="liner">
					    <h3>处理中...</h3>
					    <img src="./task_files/indicator.gif" alt="WorkXP">
					  </div>
					</div>
					<div class="main" id="main">
						


<div id="tasks_div">
	<div id="task_filter">
	 
		分类为
		<select id="filter_task_category_id" name="filter_task_category_id" onchange="window.location=&#39;/tasks?filter=on&amp;page=1&amp;filter_task_category_id=&#39; + $(this).val()"><option value="">所有</option>
<option value="29788">传真</option>
<option value="29790">感谢</option>
<option value="29786">电话</option>
<option value="29791">试用</option>
<option value="29787">邮件</option>
<option value="29789">面谈</option></select>
</div>
	<div id="upcoming_tasks">
			<div class="alert alert-info">
				没有待办任务，或者已经完成了所有任务！
	    </div>
	</div>
</div>
<script>
$(document).ready(function(){
	ContactQuickShow.init();
	$("#context").val("tasks");
	initMoveTo();
});
</script>
					</div>
				</div>
			</div>
			<div class="span4 sidebar">
					<div class="well"><a href="addtask.action">添加任务</a></div>
	<div class="well">
		<div class="title">订阅您的日程安排</div>
		<p>
			您可以使用 Google Calendar, Apple iCal, Mozzila Calendar 等支持 iCalendar 格式的工具来 <a href="https://1344267101.workxp.info/tasks/subscription">订阅您的日程安排</a>。
		</p>
	</div>

			</div>
		</div>
	</div>
	
	<div class="help">
		<a href="https://1344267101.workxp.info/pipe" target="_blank"><strong>在线帮助</strong></a>
	</div>
	<div class="back-top hide" data-top="400">
		<a href="https://1344267101.workxp.info/tasks#">返回顶部</a>
	</div>


<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-8052682-4']);
  _gaq.push(['_setDomainName', '.workxp.info']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
	
</script>
<div id="zoom" style="display:none;">       
         <table id="zoom_table" style="border-collapse:collapse; width:100%; height:100%;">    
		 <tbody>            
		 <tr>               
		 <td class="tl" style="background:url(/assets/fancy_zoom/tl.png) 0 0 no-repeat; width:20px; height:20px; overflow:hidden;"></td>   
		 <td class="tm" style="background:url(/assets/fancy_zoom/tm.png) 0 0 repeat-x; height:20px; overflow:hidden;"></td>                       
		 <td class="tr" style="background:url(/assets/fancy_zoom/tr.png) 100% 0 no-repeat; width:20px; height:20px; overflow:hidden;"></td>         
		 </tr>             
		 <tr>                
         <td class="ml" style="background:url(/assets/fancy_zoom/ml.png) 0 0 repeat-y; width:20px; overflow:hidden;"></td>       
		 <td class="mm" style="background:#fff; vertical-align:top; padding:10px;">                           <div id="zoom_content">      
		 </div>        
		 </td>          
		 <td class="mr" style="background:url(/assets/fancy_zoom/mr.png) 100% 0 repeat-y;  width:20px; overflow:hidden;"></td>   
		 </tr>   
		 <tr>            
		 <td class="bl" style="background:url(/assets/fancy_zoom/bl.png) 0 100% no-repeat; width:20px; height:20px; overflow:hidden;"></td> 
		 <td class="bm" style="background:url(/assets/fancy_zoom/bm.png) 0 100% repeat-x; height:20px; overflow:hidden;"></td>         
		 <td class="br" style="background:url(/assets/fancy_zoom/br.png) 100% 100% no-repeat; width:20px; height:20px; overflow:hidden;"></td>          
		 </tr>         
		 </tbody>     
		 </table>      
		 <a href="https://1344267101.workxp.info/tasks#" title="Close" id="zoom_close" style="position:absolute; top:0; left:0;">    
		 <img src="./task_files/closebox.png" alt="Close" style="border:none; margin:0; padding:0;">        
		 </a> 
		 </div>
		 <div id="quick-show-window">
		 <div class="quick-show-content">
		 </div>
		 </div>
  </body>
</html>
