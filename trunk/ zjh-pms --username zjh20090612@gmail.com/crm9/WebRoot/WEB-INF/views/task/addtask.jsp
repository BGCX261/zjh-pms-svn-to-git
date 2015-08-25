<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'addtask.jsp' starting page</title>
	<link href="../css/application-766336123a9b61bedf26182718c02860.css" media="all" rel="stylesheet" type="text/css">
	<script type="text/javascript" async="" src="js/ga.js"></script><script src="../js/application-e8369d8531953caeeedd0118548cdc1c.js" type="text/javascript"></script>
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
  
<body class="crm" >
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="https://1344267101.workxp.info/"><img alt="Workxp-logo" src="../img/workxp-logo-68b281b82e899ff436ecf42ebcc1bc58.png"></a>
				<div class="nav-collapse">
		  		<ul class="nav">
						<li class="divider-vertical"></li>
						<li class=""><a href="../main.action">最新动态</a></li>
						<li class=""><a href="../contact/list.ation">联系人</a></li>
						<li class="active"><a href="task.action">任务</a></li>
						<li class=""><a href="../deal/list.action">机会</a></li>
			    </ul>
					
					<ul class="nav">
					  <li class="dropdown">
							<a href="https://1344267101.workxp.info/people/new#" class="dropdown-toggle" data-toggle="dropdown">
						    添加
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu new-actions">
						    <li><a href="../contact/addcontact.action"><i class="icon-person"></i> 联系人</a></li>
								<li><a href="../contact/addcompany.action"><i class="icon-company"></i> 公司</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="icon-ok"></i> 任务</a></li>
								<li><a href="../deal/adddeal.action"><i class="icon-dollar"></i> 机会</a></li>
						  </ul>
						</li>
					</ul>
					<ul class="nav">
						<li class="divider-vertical"></li>
					</ul>
					<form class="navbar-search">
						<input type="text" name="search" id="search" class="search-query mp_input" placeholder="搜索联系人或机会" autocomplete="off" x-webkit-speech="" style="height:25px;"><ul class="typeahead dropdown-menu mp_list" style="display: none; "></ul>
					</form>
					
					<ul class="nav">
						<li><a href="https://1344267101.workxp.info/notes/search" rel="tooltip" id="search-link" data-original-title="搜索事件"><i class="icon-cog"></i></a></li>
					</ul>
			
					<ul class="nav pull-right">
						<li class=""><a href="https://1344267101.workxp.info/profiles">${sessionScope.user.username}</a></li>
						
								<li class="dropdown">
									<a data-toggle="dropdown" class="dropdown-toggle" href="https://1344267101.workxp.info/people/new#">管理 <b class="caret"></b></a>
									<ul class="dropdown-menu settings">
										<li><a href="https://1344267101.workxp.info/product_users"><i class="icon-user"></i> 同事</a></li>
										<li><a href="https://1344267101.workxp.info/groups"><i class="icon-group"></i> 组</a></li>
										<li class="divider"></li>
										<li><a href="https://1344267101.workxp.info/settings"><i class="icon-cog"></i> 帐号</a></li>
									</ul>
								</li>
						
						<li class="divider-vertical"></li>
						<li class=""><a href="https://1344267101.workxp.info/users/sign_out">退出</a></li>
					</</ul>
				</</div>
		  </div>
	  </div>
  </div>
  
  
	<div class="container-fluid" style="padding-top:20px;">
		<div class="row-fluid">
			<div class="span8">
				<div class="well screen">
					<div class="page-header header">

						
							<table style="margin:0;"><tbody><tr>
		<td width="68">
			<span style="display:inline-block;background: url(/assets/workxp_sprites.png) no-repeat scroll -224px -56px transparent; width: 55px; padding-top: 55px;"></span>
		</td>
		<td>
			添加任务
		</td>
	</tr></tbody></table>

					</div>
					<div class="live_search_spinner" behavior="spinner" id="parties_loading">
					  <div class="liner">
					    <h3>处理中...</h3>
					    <img src="./adddeal_files/indicator.gif" alt="WorkXP">
					  </div>
					</div>
					<div class="main" id="main">
						

						


<div style="padding:0 68px;">
	<form accept-charset="UTF-8" action="save.action" class="simple_form form-vertical" id="chance_form" method="post" novalidate="novalidate"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓" x-webkit-speech=""><input name="authenticity_token" type="hidden" value="TwGNPXGJGh5pkHJmFFpgNbtmbuL8iRYXt+P3WlLkam0=" x-webkit-speech=""></div>
		
		
		<div class="control-group string required"><label class="string required control-label" for="chance_name"><abbr title="required">*</abbr> 任务名称</label><div class="controls"><input class="string required input-xlarge" id="task.name" name="chance[name]" size="50" type="text" x-webkit-speech="" style="height:25px;"></div></div>

		<div class="control-group string optional"><label class="string optional control-label" for="schedule_frame"> 到期时间？</label><div class="controls">
				<select id="task_frame" name="schedule[frame]" onchange="change_task_frame($(this).val())"><option value="today" selected="selected">今天</option>
<option value="tomorrow">明天</option>
<option value="this_week">本周</option>
<option value="next_week">下周</option>
<option value="later">以后</option>
<option value="calendar">设置具体时间 ...</option></select>
				<span id="calendar_date_link" class="hide">
				</span>
</div></div>			
			<span id="calendar_date_select" style="display:none;">
				<div class="control-group datetime optional"><div class="controls"><select class="datetime optional" disabled="disabled" id="schedule_occurred_at_1i" name="schedule[occurred_at(1i)]">
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
<select class="datetime optional" disabled="disabled" id="schedule_occurred_at_2i" name="schedule[occurred_at(2i)]">
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
<select class="datetime optional" disabled="disabled" id="schedule_occurred_at_3i" name="schedule[occurred_at(3i)]">
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
 — <select class="datetime optional" disabled="disabled" id="schedule_occurred_at_4i" name="schedule[occurred_at(4i)]">
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option selected="selected" value="13">13</option>
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
</select>
 : <select class="datetime optional" disabled="disabled" id="schedule_occurred_at_5i" name="schedule[occurred_at(5i)]">
<option value="00">00</option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05</option>
<option value="06">06</option>
<option value="07">07</option>
<option value="08">08</option>
<option value="09">09</option>
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
<option selected="selected" value="21">21</option>
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
<option value="32">32</option>
<option value="33">33</option>
<option value="34">34</option>
<option value="35">35</option>
<option value="36">36</option>
<option value="37">37</option>
<option value="38">38</option>
<option value="39">39</option>
<option value="40">40</option>
<option value="41">41</option>
<option value="42">42</option>
<option value="43">43</option>
<option value="44">44</option>
<option value="45">45</option>
<option value="46">46</option>
<option value="47">47</option>
<option value="48">48</option>
<option value="49">49</option>
<option value="50">50</option>
<option value="51">51</option>
<option value="52">52</option>
<option value="53">53</option>
<option value="54">54</option>
<option value="55">55</option>
<option value="56">56</option>
<option value="57">57</option>
<option value="58">58</option>
<option value="59">59</option>
</select>
</div></div>
			</span>
		
			
		<div class="control-group integer optional"><label class="integer optional control-label" for="chance_category_id"> 分类</label><div class="controls">
			<select data="ChanceCategory" id="chance_category_id" name="chance[category_id]" onchange="changeCategory(this)"><option value="">无</option>
<option value="new">新建分类 ...</option></select>
			<a href="https://1344267101.workxp.info/crm_categories?type=chance">编辑分类</a>
</div></div>		
				<div class="control-group select optional"><label class="select optional control-label" for="chance_assigned_user_id"> 谁负责？</label><div class="controls"><select class="select optional" id="chance_assigned_user_id" name="chance[assigned_user_id]"><option value="">无</option>
<option value="6696">我</option></select></div></div>
				
				<div class="control-group string optional"><label class="string optional control-label" for="chance_access_policy"> 谁可以看见这个机会？</label><div class="controls">
					
					 <div id="select_access_policy_for_Chance_" class="select_access_policy">
	<div class="radio scope activated">
		<input checked="checked" id="chance_access_policy_attributes_scope_everyone" name="chance[access_policy_attributes][scope]" type="radio" value="Everyone" x-webkit-speech=""> 所有同事
	</div>
	<div class="radio scope ">
		<input id="chance_access_policy_attributes_scope_owner" name="chance[access_policy_attributes][scope]" type="radio" value="Owner" x-webkit-speech=""> 只有我能看见
		<input id="chance_access_policy_attributes_owner_id" name="chance[access_policy_attributes][owner_id]" type="hidden" value="6696" x-webkit-speech="">
	</div>
	<div class="radio scope  hide">
		<input class="adhoc_group_ids" id="chance_access_policy_attributes_user_ids" name="chance[access_policy_attributes][user_ids]" type="hidden" x-webkit-speech="">
		<input id="chance_access_policy_attributes_scope_adhocgroup" name="chance[access_policy_attributes][scope]" type="radio" value="AdhocGroup" x-webkit-speech=""> 选择同事...
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
	
	
	
	
	
	
	
	
<!-- 机会 -->
	
	
	
	
	
	
<script>
	var container = $('#select_access_policy_for_Chance_');
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
      AdhocGroupMember.activateMenu()
    }
  };

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
		<div class="form-actions">
			<input class="btn btn-primary" name="commit" onclick="$(&#39;chance_form&#39;).addClassName(&#39;progress&#39;)" type="submit" value="添加这个任务" x-webkit-speech="">
			<a href="https://1344267101.workxp.info/chances" class="btn">取消</a>
		</div>
</form></div>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#contact_name').marcoPolo({
		  url: '/contacts/auto_complete_for_contact_name',
		  formatItem: function (data, $item) {
		    var ns = data.icon + data.name;
				if(data.company) ns = ns + ' [' + data.company + ']';
				return ns;
		  },
		  onSelect: function (data, $item) {
				var ns = data.name;
				if(data.company) ns = ns + ' [' + data.company + ']';
		    $('#contact_name').val(ns);
				$('#chance_contact_id').val(data.id)
		  },
			formatNoResults: function(q, $item) {
				return '';
			}
		});
		
		
		validate_form('#chance_form')
		$('#chance_name').focus()
	});
</script>

					</div>
				</div>
			</div>
			<div class="span4 sidebar">
					<div class="well">
		<div class="title">什么是机会？</div>
		<p></p><p>机会即业务机会或商业机会，比如一笔可能成交的业务或项目。<br><br>机会通常跟一个<strong>联系人</strong>相关，您需要先将这个联系人添加到系统。<br><br>在输入联系人时，系统会根据已输入的内容自动查找联系人，并以下拉列表的形式显示出来，您可以从中选取一个。<br><br>您可以根据自己的业务情况给机会添加分类。比如按产品分类、按重要程度或行业分类。</p><p></p>
	</div>

			</div>
		</div>
	</div>
	
	<div class="help">
		<a href="https://1344267101.workxp.info/pipe" target="_blank"><strong>在线帮助</strong></a>
	</div>
	<div class="back-top hide" data-top="400">
		<a href="https://1344267101.workxp.info/chances/new#">返回顶部</a>
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
   

  </body>
</html>
