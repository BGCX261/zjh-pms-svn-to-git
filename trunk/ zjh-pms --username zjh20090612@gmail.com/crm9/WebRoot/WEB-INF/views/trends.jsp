<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>crm</title>
	<!--[if lt IE 9]>
	  <script src="js/html5.js" type="text/javascript"></script>
  <![endif]-->
	<!--[if IE]>
		<script type="text/javascript" charset="utf-8">
			window.onload = function() {
				$('input, textarea').placeholder();
			}
		</script>
	<![endif]-->
	<link href="css/application-766336123a9b61bedf26182718c02860.css" media="all" rel="stylesheet" type="text/css">
	<script type="text/javascript" async="" src="js/ga.js"></script><script src="js/application-e8369d8531953caeeedd0118548cdc1c.js" type="text/javascript"></script>
	<meta content="authenticity_token" name="csrf-param">
<meta content="4NAq56gfzq9IhDJLLR4pUWgQs7xLI5nFWq6+6mYHmUA=" name="csrf-token">
	
	
<style type="text/css" media="screen">
	div.select_access_policy .scope {
		margin:2px 0;
	}
	div.select_access_policy .scope .editor {
		display:none;
	}
	div.select_access_policy .activated .editor {
		display:block;
		margin:2px 15px;
	}
	div.select_access_policy .hide {
		display:none;
	}
</style>

<style type="text/css" media="screen">
	div.new_note_form_basics div.right {
		float: right;
	}
	div.options{
		border-bottom: 1px dashed #CCCCCC;
		padding-bottom: 5px;
		margin-bottom:10px;
	}
	div#email_note_container{
		margin-bottom: 10px;
	}
	.subscribers {
	    list-style: none outside none;
	    margin-left: 0;
	    overflow: hidden;
	}
	.subscribers li {
	    float: left;
	    width: 150px;
	}
</style>

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
				<a class="brand" href="home.action"><img alt="Workxp-logo" src="img/workxp-logo-68b281b82e899ff436ecf42ebcc1bc58.png"></a>
				<div class="nav-collapse">
		  		<ul class="nav">
						<li class="divider-vertical"></li>
						<li class="active"><a href="main.action">最新动态</a></li>
						<li class=""><a href="contact/list.action">联系人</a></li>
						<li class=""><a href="task/task.action">任务</a></li>
						
						<li class=""><a href="deal/list.action">机会</a></li>
			    </ul>
					
					<ul class="nav">
					  <li class="dropdown">
							<a href="https://1344267101.workxp.info/dashboard#" class="dropdown-toggle" data-toggle="dropdown">
						    添加
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu new-actions">
						    <li><a href="contact/addcontact.action"><i class="icon-person"></i> 联系人</a></li>
								<li><a href="contact/addcompany.action"><i class="icon-company"></i> 公司</a></li>
								<li class="divider"></li>
								<li><a href="task/addtask.action"><i class="icon-ok"></i> 任务</a></li>
								<li><a href="deal/adddeal.action"><i class="icon-dollar"></i> 机会</a></li>
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
									<a data-toggle="dropdown" class="dropdown-toggle" href="https://1344267101.workxp.info/dashboard#">管理 <b class="caret"></b></a>
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
	    显示
	      <select id="user" name="user">
	        <option>所有同事</option>
	        <optgroup label="同事"><option value="u-6696">我</option></optgroup>
	      </select>
	      的
				<script type="text/javascript" charset="utf-8">
					$("#user").live('change', function() {
						$('body').addClass('loading');
						$.get('/dashboard?filter=on&amp;page=1', {user: this.value}, function(data) {
							$('#activities').html(data);
							$('body').removeClass('loading');
						}, 'html');
					});
				</script>
	    
	    <select id="type" name="type">
		    <option value="">所有动态</option>
			<option value="schedule">任务动态</option>
			<option value="chance_note">机会动态</option>
			<option value="note">事件动态</option>
			<option value="email">邮件动态</option>
		</select>
			<script type="text/javascript" charset="utf-8">
				$('#type').change(function() {
					$('body').addClass('loading');
					$.get('/dashboard?filter=on&amp;page=1', {type: this.value}, function(data) {
						$('#activities').html(data);
						$('body').removeClass('loading');
					}, 'html');
				});
			</script>
	</div>
	最新动态

					</div>
					<div class="live_search_spinner" behavior="spinner" id="parties_loading">
					  <div class="liner">
					    <h3>处理中...</h3>
					    <img src="img/indicator.gif" alt="WorkXP">
					  </div>
					</div>
					<div class="main" id="main">
						


	<p>你在忙什么？记录与分享工作生活的点滴。</p>
	<div>
	<form accept-charset="UTF-8" action="https://1344267101.workxp.info/notes" class="simple_form new_note" data-remote="true" id="note-form" method="post" novalidate="novalidate"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓" x-webkit-speech=""><input name="authenticity_token" type="hidden" value="4NAq56gfzq9IhDJLLR4pUWgQs7xLI5nFWq6+6mYHmUA=" x-webkit-speech=""></div>
		<input id="from" name="from" type="hidden" value="Dashboard" x-webkit-speech="">
		<input id="note_parent_id" name="note[parent_id]" type="hidden" x-webkit-speech="">
		<input id="note_contact_id" name="note[contact_id]" type="hidden" value="813479" x-webkit-speech="">
		<input id="note_chance_id" name="note[chance_id]" type="hidden" x-webkit-speech="">
		<input id="note_kase_id" name="note[kase_id]" type="hidden" x-webkit-speech="">
		
		<div class="control-group text required"><div class="controls"><textarea class="text required content" cols="40" id="note_content" name="note[content]" rows="20"></textarea></div></div>
		
		<div id="note_options" class="options" style="display: none;">
				<div class="who_can_see_this" style="background:#D54F27;color:white;">
					您使用的是免费版，不能上传文件。
				</div>
    
			<div class="control-group optional">
			</div>
    	
				<div class="control-group date optional"><label class="date optional control-label" for="note_occurred_at_1i"> 什么时候发生的？</label><div class="controls"><select class="date optional" id="note_occurred_at_1i" name="note[occurred_at(1i)]">
<option value="2007">2007</option>
<option value="2008">2008</option>
<option value="2009">2009</option>
<option value="2010">2010</option>
<option value="2011">2011</option>
<option selected="selected" value="2012">2012</option>
<option value="2013">2013</option>
<option value="2014">2014</option>
<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
</select>
<select class="date optional" id="note_occurred_at_2i" name="note[occurred_at(2i)]">
<option value="1">一月</option>
<option value="2">二月</option>
<option value="3">三月</option>
<option value="4">四月</option>
<option value="5">五月</option>
<option value="6">六月</option>
<option value="7">七月</option>
<option selected="selected" value="8">八月</option>
<option value="9">九月</option>
<option value="10">十月</option>
<option value="11">十一月</option>
<option value="12">十二月</option>
</select>
<select class="date optional" id="note_occurred_at_3i" name="note[occurred_at(3i)]">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option selected="selected" value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
</select>
</div></div>
				<input type="hidden" name="note[occurred_at(4i)]" value="13" x-webkit-speech="">
				<input type="hidden" name="note[occurred_at(5i)]" value="12" x-webkit-speech="">
				<input type="hidden" name="note[occurred_at(6i)]" value="58" x-webkit-speech="">
			
			
					<div class="control-group string optional"><label class="string optional control-label" for="note_access_policy"> 哪些同事可以看见？</label><div class="controls">
						
							<div id="select_access_policy_for_Note_" class="select_access_policy">
	<div class="radio scope activated">
		<input checked="checked" id="note_access_policy_attributes_scope_everyone" name="note[access_policy_attributes][scope]" type="radio" value="Everyone" x-webkit-speech=""> 所有同事
	</div>
	<div class="radio scope ">
		<input id="note_access_policy_attributes_scope_owner" name="note[access_policy_attributes][scope]" type="radio" value="Owner" x-webkit-speech=""> 只有我能看见
		<input id="note_access_policy_attributes_owner_id" name="note[access_policy_attributes][owner_id]" type="hidden" value="6696" x-webkit-speech="">
	</div>
	<div class="radio scope  hide">
		<input class="adhoc_group_ids" id="note_access_policy_attributes_user_ids" name="note[access_policy_attributes][user_ids]" type="hidden" x-webkit-speech="">
		<input id="note_access_policy_attributes_scope_adhocgroup" name="note[access_policy_attributes][scope]" type="radio" value="AdhocGroup" x-webkit-speech=""> 选择同事...
		<div class="editor">
			<div class="adhoc_group_member template" style="display: none;">
				<select disabled="disabled" id="user_ids_" name="user_ids[]"></select> 
				<span class="sprite remove" style="display:inline-block;background: url(/assets/workxp_sprites.png) no-repeat scroll -189px -181px transparent; width: 14px; padding-top: 14px;" title="" id=""></span>
				<span class="sprite add" style="display:inline-block;background: url(/assets/workxp_sprites.png) no-repeat scroll -189px -197px transparent; width: 14px; padding-top: 14px;" title="" id=""></span>
			</div>
			<div class="adhoc_group_members"></div>
	  	<select class="new_adhoc_group_member" id="" name=""><option value="" selected="selected">选择一个同事...</option></select> 
		</div>
	</div>
	
</div>

<script>
	var container = $('#select_access_policy_for_Note_');
	$('.scope input[type=radio]', container).live('click', function(event) {
    var activated = $(event.target).parent();
    $('.scope.activated', container).removeClass('activated')
    activated.addClass('activated');
		changePermission()
  });

	$('.scope select.named_group', container).live('change', function() {
		changePermission()
	})

  AdhocGroupMember.menu = $('select.new_adhoc_group_member', container)
	AdhocGroupMember.menu.live('change', function() { AdhocGroupMember.insert() });
	
	function changePermission() {
	  container.trigger('permission:change', [viewers()]);
	}
	
	function viewers() {
	  switch ($('.scope.activated input[type=radio]', container).val()) {
	  case 'Owner':
	    return [];
	  case 'NamedGroup':
	    return namedGroupMembers();
	  case 'AdhocGroup':
	    return adhocGroupMembers();
	  default:
	    return everyone();
	  }
	}
	
	function adhocGroupMembers() {
		return $('.adhoc_group_members .adhoc_group_member select', container).map(function(index, menu){ return $(menu).val() });
	}
	
	function everyone() {
	  return $('option', AdhocGroupMember.menu).map(function(index, option){
	    if ($(option).val()) return $(option).val();
	  });
	}
	
	function namedGroupMembers() {
	  return namedGroups()[$('select.named_group', container).val()] || [];
	}
	
	function namedGroups() {
	  return $.parseJSON($('.named_groups_data', container).attr('data'));
	}
	
	function updateUserIds() {
		var ids = $.makeArray(adhocGroupMembers())
		ids.push('6696')
		ids = ',' +  ids.join(',') + ','
		$('.scope .adhoc_group_ids', container).val(ids)
		changePermission()
	}
	
  function AdhocGroupMember(member) {
		$('select', member).live('change', updateUserIds);
    $('span.sprite.remove', member).live('click', function(){ AdhocGroupMember.remove(member); });
    $('span.sprite.add'   , member).live('click', function(){ AdhocGroupMember.add(member);    });
    return member;
  }

	AdhocGroupMember.remove = function(member) {
    var removed = member.remove()
    var members = $('.adhoc_group_members .adhoc_group_member', container)
    if (members.length === 0) {
      AdhocGroupMember.activateMenu()
    } else {
      if (removed.hasClass('last')) members.last().addClass('last')
    }
		updateUserIds()
  };

  AdhocGroupMember.add = function(lastMember) {
    lastMember.removeClass('last')
    AdhocGroupMember.activateMenu()
  };

  AdhocGroupMember.insert = function() {
    if ($.trim($(AdhocGroupMember.menu).val()) != '' && $.inArray($(AdhocGroupMember.menu).val(), adhocGroupMembers()) < 0) {
      $('.adhoc_group_members .last.adhoc_group_member', container).removeClass('last')
      $('.adhoc_group_members', container).append(AdhocGroupMember.create().addClass('last'))
      AdhocGroupMember.deactivateMenu()
			updateUserIds()
    } else {
      AdhocGroupMember.activateMenu(){
    };
  }

  AdhocGroupMember.create = function() {
    var member = $('.adhoc_group_member.template', container).clone()
    member.removeClass('template').show()
		$('select', member).removeAttr('disabled').val($(AdhocGroupMember.menu).val())
    return AdhocGroupMember(member)
  };

  AdhocGroupMember.activateMenu = function() {
    var ids  = adhocGroupMembers()
    var menu = AdhocGroupMember.menu
    if (ids.length > 0) {
      menu.children().first().html('添加同事...')
    } else {
      menu.children().first().html('选择一个同事...')
    }
    $(menu).val("")
    $(menu).removeAttr('disabled').show()
  };

  AdhocGroupMember.deactivateMenu = function() {
    $(AdhocGroupMember.menu).attr('disabled', 'disabled').hide()
  };
	
	
	changePermission()
</script>


</div></div>				
				<div id="email_note_container_">
					<div class="control-group optional">
				    <label class="string optional control-label" for="note_邮件通知"> 邮件通知</label>
						<p class="help-block">被勾选的同事将会收到邮件通知。</p>
						<input id="check_everyone_" name="check_everyone" type="checkbox" value="1" x-webkit-speech="">
						所有人
						<ul class="subscribers">
						</ul>
					</div>
				</div>
		</div>

		<div class="new_note_form_basics">
			<div class="submit right">
				<input class="btn btn-primary" data-loading-text="处理中.." name="commit" type="submit" value="保存" x-webkit-speech="">
			</div>
			<div class="action">
				<a href="https://1344267101.workxp.info/dashboard#" id="show_options_link" onclick="show_options(); return false;">显示选项</a>
			</div>
		</div>
</form></div>

<script type="text/javascript" charset="utf-8">
	function show_options() {
		$('#note_options').show();
		$('#show_options_link').hide();
		$('.new_note_form_basics .submit').removeClass('right')
	}
  if(!Array.prototype.indexOf) {
		Array.prototype.indexOf = function(needle) {
			for(var i = 0; i < this.length; i++) {
				if(this[i] === needle) {
					return i;
				}
			}
			return -1;
		};
  }
	
		$('#check_everyone_').on("click", function(e){
			if($(e.target).attr('checked')) {
				$('#email_note_container_ .subscriber input').attr('checked', true);
			} else {
				$('#email_note_container_ .subscriber input').removeAttr('checked');
			}
		});
	
		$('#select_access_policy_for_Note_').on('permission:change', function(event, ids){
	    if (ids.length > 0) {
	      render(ids);
	      $('#email_note_container_').show();
	    } else {
	      $('#email_note_container_').hide();
	    }
	  });
	
		function render(ids) {
			$('#email_note_container_ .subscriber').hide();
			$.each($('#email_note_container_ .subscriber'), function(index, subscriber) {
				if($.inArray(subscriber.id.split('_')[1], ids) > -1) {
					$(subscriber).show();
				}
			})
		}
	
	// auto_size_textarea('holder_', 'note_content_');  
	$(document).ready(function() {
		validate_form('#note-form', true);
		PendingAttachments.init(".attachment_container");
		// $('#note_content').focus()
		
	})
</script>



<div id="activities">
			<div class="alert alert-info">
				<p>目前还没有动态</p>
					这里为您展示团队的最新动态，比如与客户有过什么联系，业务机会有什么进展，同事完成了什么工作等。<br>您可以在右侧快速添加一个任务，查看您的日程安排，或者添加一个联系人。
		  </div>
			<img src="img/workxp-sample-dashboard.png" class="bird">
</div>

<style type="text/css" media="screen">
	#active-users {
		margin-top: 10px;
	}
	#active-users .user {
		display: inline-block;
		margin: 0px 5px 5px 0px;
		width: 32px;
		vertical-align: top;
	}
</style>
					</div>
				</div>
			</div>
			<div class="span4 sidebar">
				
		<div class="well">
			<div class="title">最近访问的同事</div>
			<div id="active-users" class="clearfix">
					<div class="user">
						<a rel="tooltip" href="https://1344267101.workxp.info/people/813479" data-original-title="承诺风光好"><span style="display: inline-block;background: url(&#39;/assets/workxp_sprites.png&#39;) no-repeat -112px -148px transparent; width: 32px; padding-top: 32px;font-size:1px"></span></a>
					</div>
			</div>
		</div>
	
	<div id="tasks_div" class="well"><div class="title">
	<span><a data-toggle="modal" href="https://1344267101.workxp.info/dashboard#taskModal" data-backdrop="static">添加任务</a></span>
	您的待办任务
</div>
<div id="upcoming_tasks">
	<div id="screen_body">
	
	
	
	
	
	
</div>


</div>
</div>
	<script type="text/javascript" charset="utf-8">
		$.get('/tasks', function(data) {
			$('#tasks_div').html(data);
			ContactQuickShow.init();
		}, 'html');
		$("#context").val("tasks");
	</script>

			</div>
		</div>
	</div>
	
	<div class="help">
		<a href="https://1344267101.workxp.info/pipe" target="_blank"><strong>在线帮助</strong></a>
	</div>
	<div class="back-top hide" data-top="400">
		<a href="https://1344267101.workxp.info/dashboard#">返回顶部</a>
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
  })()};
	
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
		<div id="zoom_content"></div>          
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
		<a href="https://1344267101.workxp.info/dashboard#" title="Close" id="zoom_close" style="position: absolute; top: 0px; left: 0px; display: none; ">      
		<img src="img/closebox.png" alt="Close" style="border:none; margin:0; padding:0;">  
		</a>        
		</div>
		<div id="quick-show-window"><div class="quick-show-content">
		</div>
	</div>
</body>
</html>