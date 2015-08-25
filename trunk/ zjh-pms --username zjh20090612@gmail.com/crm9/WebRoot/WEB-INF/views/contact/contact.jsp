<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'contact.jsp' starting page</title>
    <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen, projection">
	<!--[if IE]>
	  <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen, projection">
	<![endif]-->
	<link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection">
	<link href="../css/application-766336123a9b61bedf26182718c02860.css" media="all" rel="stylesheet" type="text/css">
	<script type="text/javascript" async="" src="../js/ga.js"></script><script src="../js/application-e8369d8531953caeeedd0118548cdc1c.js" type="text/javascript"></script>
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
  
  <body>
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
						<li class="active"><a href="list.action">联系人</a></li>
						<li class=""><a href="../task.action">任务</a></li>
						
						<li class=""><a href="../deal/list.action">机会</a></li>
			    </ul>
					
					<ul class="nav">
					  <li class="dropdown">
							<a href="https://1344267101.workxp.info/tasks#" class="dropdown-toggle" data-toggle="dropdown">
						    添加
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu new-actions">
						    <li><a href="addcontact.action"><i class="icon-person"></i> 联系人</a></li>
								<li><a href="addcompany.action"><i class="icon-company"></i> 公司</a></li>
								<li class="divider"></li>
								<li><a href="https://1344267101.workxp.info/tasks#taskModal"><i class="icon-ok"></i> 任务</a></li>
								
								<li><a href="../deal/adddeal.action"><i class="icon-dollar"></i> 机会</a></li>
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

						
								<select id="type" name="type">
			<optgroup label="所有..."><option value="All">所有的联系人</option>
<option value="Person">所有的个人</option>
<option value="Company">所有的公司</option>
<option value="Mine">我创建的联系人</option></optgroup><optgroup label="最近..."><option value="RecentlyAdded">最近添加的联系人</option></optgroup><optgroup label="过滤..."><option value="NoTagged">未打标签的联系人</option>
<option value="NoRecentNotes">最近30天未跟进的联系人</option></optgroup>
		</select>

					</div>
					<div class="live_search_spinner" behavior="spinner" id="parties_loading">
					  <div class="liner">
					    <h3>处理中...</h3>
					    <img src="./contact_files/indicator.gif" alt="WorkXP">
					  </div>
					</div>
					<div class="main" id="main">
						


<div class="alert alert-success" style="display:none">
	<a class="close" data-dismiss="alert" href="https://1344267101.workxp.info/contacts#">×</a>
  <span></span>
</div>
<div class="filter-desc">
	可以通过以下条件来过滤联系人:
</div>
<div class="meta">
	<ul class="nav nav-pills contact-filter">
			<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown" href="https://1344267101.workxp.info/contacts#">
		    	名称<b class="caret"></b>
		    </a>
		    <ul class="dropdown-menu">
					<div class="dropdown-box">
						<form class="form-search contacts-search" action="findByName.action" method="post">
			      	<input type="text" class="input-small search-query" name="contact.name" x-webkit-speech="" style="height:25px;">
							<button type="submit" class="btn" data-loading-text="处理中..">搜索</button>
			      </form>
					</div>
		    </ul>
		  </li>
			<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown" href="https://1344267101.workxp.info/contacts#">
		    	职位<b class="caret"></b>
		    </a>
		    <ul class="dropdown-menu">
					<div class="dropdown-box">
						<form class="form-search contacts-search">
			      			<input type="text" class="input-small search-query" name="title" x-webkit-speech="" style="height:25px;">
							<button type="submit" class="btn" data-loading-text="处理中..">搜索</button>
			     		</form>
					</div>
		    </ul>
		  </li>
			<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown" href="https://1344267101.workxp.info/contacts#">
		    	邮箱<b class="caret"></b>
		    </a>
		    <ul class="dropdown-menu">
					<div class="dropdown-box">
						<form class="form-search contacts-search">
			      	<input type="text" class="input-small search-query" name="ContactEmail" x-webkit-speech="" style="height:25px;">
							<button type="submit" class="btn" data-loading-text="处理中..">搜索</button>
			      </form>
					</div>
		    </ul>
		  </li>
			<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown" href="https://1344267101.workxp.info/contacts#">
		    	电话<b class="caret"></b>
		    </a>
		    <ul class="dropdown-menu">
					<div class="dropdown-box">
						<form class="form-search contacts-search">
			      	<input type="text" class="input-small search-query" name="ContactPhone" x-webkit-speech="" style="height:25px;">
							<button type="submit" class="btn" data-loading-text="处理中..">搜索</button>
			      </form>
					</div>
		    </ul>
		  </li>
			<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown" href="https://1344267101.workxp.info/contacts#">
		    	地址<b class="caret"></b>
		    </a>
		    <ul class="dropdown-menu">
					<div class="dropdown-box">
						<form class="form-search contacts-search">
			      	<input type="text" class="input-small search-query" name="ContactAddress" x-webkit-speech="" style="height:25px;">
							<button type="submit" class="btn" data-loading-text="处理中..">搜索</button>
			      </form>
					</div>
		    </ul>
		  </li>
			<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown" href="https://1344267101.workxp.info/contacts#">
		    	背景信息<b class="caret"></b>
		    </a>
		    <ul class="dropdown-menu">
					<div class="dropdown-box">
						<form class="form-search contacts-search">
			      	<input type="text" class="input-small search-query" name="others" x-webkit-speech="" style="height:25px;">
							<button type="submit" class="btn" data-loading-text="处理中..">搜索</button>
			      </form>
					</div>
		    </ul>
		  </li>
		  
		  
			<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown" href="https://1344267101.workxp.info/contacts#">
		    	微博<b class="caret"></b>
		    </a>
		    <ul class="dropdown-menu">
					<div class="dropdown-box">
						<form class="form-search contacts-search">
			      	<input type="text" class="input-small search-query" name="contact.weibo" x-webkit-speech="" style="height:25px;">
							<button type="submit" class="btn" data-loading-text="处理中..">搜索</button>
			      </form>
					</div>
		    </ul>
		  </li>
		  
		   
		   
			<li class="dropdown">
	    	<a class="dropdown-toggle" data-toggle="dropdown" href="https://1344267101.workxp.info/contacts#">
		    	IM<b class="caret"></b>
		    </a>
		    <ul class="dropdown-menu">
					<div class="dropdown-box">
						<form class="form-search contacts-search">
			      	<input type="text" class="input-small search-query" name="ContactIm" x-webkit-speech="" style="height:25px;">
							<button type="submit" class="btn" data-loading-text="处理中..">搜索</button>
			      </form>
					</div>
		    </ul>
		  </li>
	</ul>
</div>
<div class="filter-container" data="{}"></div>
<div class="filter-template" data="{&quot;name&quot;:&quot;\u540d\u79f0&quot;,&quot;others&quot;:&quot;\u80cc\u666f\u4fe1\u606f&quot;,&quot;title&quot;:&quot;\u804c\u4f4d&quot;,&quot;ContactAddress&quot;:&quot;\u5730\u5740&quot;,&quot;ContactWebsite&quot;:&quot;\u7f51\u7ad9&quot;,&quot;ContactPhone&quot;:&quot;\u7535\u8bdd&quot;,&quot;ContactEmail&quot;:&quot;\u90ae\u7bb1&quot;,&quot;ContactIm&quot;:&quot;IM&quot;}">
	<a class="filter" name="" data="" href="https://1344267101.workxp.info/contacts#"><strong></strong></a>
</div>

<!-- 
<div id="table">
			<div class="alert alert-info">
				没有联系人。<a href="https://1344267101.workxp.info/people/new">添加一个联系人</a> 或者 <a href="https://1344267101.workxp.info/contact_imports">导入联系人</a>
			</div>
			<img src="../img/workxp-sample-contacts.png" class="bird">
</div>
 -->

<div class="main">
	<div id="innerwapper">
		<div id="pager">
				<!--
					当没有边栏(pageside)的时候，使用pageall样式
				-->
				<div class="pagebody">
					
					<div class="pagecontent">
						<table>
							<c:forEach items="${contactList }" var="contact">
								<tr>
									<td width="20px">
										<input type="checkbox"/>
									</td>
									<td width="30px">
										<span class="manpic"></span>
									</td>
									<td width="50%">
										${contact.name }<br/>
										010-88998899
									</td>
									<td>
										${contact.companyname }
									</td>
								</tr>
							</c:forEach>
							
							<!-- 
								<tr>
									<td width="20px">
										<input type="checkbox"/>
									</td>
									<td width="30px">
										<span class="company"></span>
									</td>
									<td width="50%">
										美国苹果公司
									</td>
									<td>
										
									</td>
								</tr>
								<tr>
									<td width="20px">
										<input type="checkbox"/>
									</td>
									<td width="30px">
										<span class="manpic"></span>
									</td>
									<td width="50%">
										乔布斯CEO<br/>
										010-88998899
									</td>
									<td>
										美国苹果公司
									</td>
								</tr>
							 -->
							 
						</table>
					</div>
				</div>	
			</div>
		</div>
	</div>
	



<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$.get('/contacts/tags', function(data) {
			$('#tags_container').html(data);
		}, 'html');
		
		$.get('/contacts/recent_imports', function(data) {
			$('#recent_imports').html(data);
			$("#recent_imports").has("div.title").addClass("well");
		}, 'html');
		
		$.get('/contacts/tags.json', function(data) {
			$('#tag').typeahead({ source: data })
		});
		
		init_contacts_action();
		
		ContactQuickShow.init();
		new ContactsFilter();
		
		$('#type').change(function() {
			$('body').addClass('loading');
			var filters = $(".filter-container").data("filters");
			var filter_str = '';
			if(filters) {
				filter_str = $.param(filters);
			}
			$.get('/contacts?filter=on&page=1&' + filter_str, {type: this.value}, updateContacts, 'html');
		});
		
		$("a.export").click(function(e) {
			e.preventDefault();
			var url = $(this).attr("href");
			window.location.href = url + '?c=' + $("#contact_num").val();
		})
	});
</script>

					</div>
				</div>
			</div>
			<div class="span4 sidebar">
					<div class="well">
		<ul id="inout">
			<li><a href="addcontact.action">添加联系人</a></li>
			<li><a href="addcompany.action">添加公司</a></li>
			<li><a href="https://1344267101.workxp.info/contact_imports">导入联系人</a></li>
			
		</ul>
	</div>
	<div id="recent_imports" class=""><ul class="unstyled">
</ul>
</div>
	<div id="tags_container"> </div>

			</div>
		</div>
	</div>
	
	<div class="help">
		<a href="https://1344267101.workxp.info/pipe" target="_blank"><strong>在线帮助</strong></a>
	</div>
	<div class="back-top hide" data-top="400">
		<a href="https://1344267101.workxp.info/contacts#">返回顶部</a>
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
			 <td class="mm" style="background:#fff; vertical-align:top; padding:10px;">                          
				 <div id="zoom_content">                           
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
	 <a href="https://1344267101.workxp.info/contacts#" title="Close" id="zoom_close" style="position:absolute; top:0; left:0;">                    
		<img src="./contact_files/closebox.png" alt="Close" style="border:none; margin:0; padding:0;">                 
	 </a>                
 </div>
 <div id="quick-show-window"><div class="quick-show-content"></div>
 </div>
 </body>
  </body>
</html>
