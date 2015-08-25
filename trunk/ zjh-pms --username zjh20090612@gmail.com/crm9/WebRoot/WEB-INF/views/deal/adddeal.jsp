<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'adddeal.jsp' starting page</title>
    <link href="../css/application-766336123a9b61bedf26182718c02860.css" media="all" rel="stylesheet" type="text/css">
	<script type="text/javascript" async="" src="../js/ga.js"></script><script src="../js/application-e8369d8531953caeeedd0118548cdc1c.js" type="text/javascript"></script>
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
  
  <body class="crm">
    <div class="navbar navbar-fixed-top">
  	<div class="navbar-inner">
	  	<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="home.action/"><img alt="Workxp-logo" src="../img/workxp-logo-68b281b82e899ff436ecf42ebcc1bc58.png"></a>
				<div class="nav-collapse">
		  		<ul class="nav">
						<li class="divider-vertical"></li>
						<li class=""><a href="../main.action">最新动态</a></li>
						<li class=""><a href="../contact/list.action">联系人</a></li>
						<li class=""><a href="../task/task.action">任务</a></li>
						
						<li class="active"><a href="list.action">机会</a></li>
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
								<li><a href="..task/addtask.action"><i class="icon-ok"></i> 任务</a></li>
								<li><a href="#"><i class="icon-dollar"></i> 机会</a></li>
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

						
							<table style="margin:0;"><tbody><tr>
		<td width="68">
			<span style="display:inline-block;background: url(/assets/workxp_sprites.png) no-repeat scroll -224px -56px transparent; width: 55px; padding-top: 55px;"></span>
		</td>
		<td>
			添加机会
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
		
		<div class="control-group string optional  marco_polo_container"><label class="string optional control-label" for="chance_contact"> 联系人</label><div class="controls">
			<input class="input-xlarge mp_input" id="contact_name" name="contact_name" type="text" autocomplete="off" x-webkit-speech="" style="height:30px;"><ul class="typeahead dropdown-menu mp_list" style="display: none; "></ul>
			<input id="chance_contact_id" name="chance[contact_id]" type="hidden" x-webkit-speech="">
<p class="help-block">输入联系人姓名或公司名称（并从下拉提示列表中选取一个）</p></div></div>
		<div class="control-group string required"><label class="string required control-label" for="chance_name"><abbr title="required">*</abbr> 机会名称</label><div class="controls"><input class="string required input-xlarge" id="chance_name" name="deal.title" size="50" type="text" x-webkit-speech="" style="height:30px;"></div></div>

		<div class="control-group text optional"><label class="text optional control-label" for="chance_description"> 机会描述或背景信息</label><div class="controls"><textarea class="text optional content" cols="40" id="chance_description" name="deal.content" rows="20"></textarea></div></div>
		
		<div class="control-group float optional"><label class="float optional control-label" for="chance_price"> 金额</label><div class="controls"><div class="input-prepend">
			<span class="add-on">元</span>
			<input class="numeric float optional price" id="chance_price" name="deal.money" type="text" x-webkit-speech="" style="height:30px;">
			<input id="chance_price_type" name="chance[price_type]" type="hidden" value="fixed" x-webkit-speech="">
			<select id="price_type_pulldown" name="type_pulldown" onchange="Deals.selectBidType(this)"><option value="fixed" selected="selected">固定价</option>
<option value="hour">每小时</option>
<option value="month">每月</option>
<option value="year">每年</option></select>
			<span id="special_bid" style="display:none;">
				共
				<input id="chance_duration" name="chance[duration]" size="30" style="width:50px;" type="text" x-webkit-speech="">
				<span id="time_unit"></span>
			</span>
</div></div></div>		
		<div class="control-group integer optional"><label class="integer optional control-label" for="chance_category_id"> 分类</label><div class="controls">
			<select data="ChanceCategory" id="chance_category_id" name="chance[category_id]" onchange="changeCategory(this)"><option value="">无</option>
<option value="new">新建分类 ...</option></select>
			<a href="https://1344267101.workxp.info/crm_categories?type=chance">编辑分类</a>
</div></div>		
				<div class="control-group select optional"><label class="select optional control-label" for="chance_assigned_user_id"> 谁负责？</label><div class="controls"><select class="select optional" id="chance_assigned_user_id" name=""><option value="">无</option>
<option value="6696">我</option></select></div></div>
				
				<div class="control-group string optional"><label class="string optional control-label" for="chance_access_policy"> 谁可以看见这个机会？</label><div class="controls">
					
					 <div id="select_access_policy_for_Chance_" class="select_access_policy">
	<div class="radio scope activated">
		<input checked="checked" id="chance_access_policy_attributes_scope_everyone" name="deal.view" type="radio" value="all" x-webkit-speech=""> 所有同事
	</div>
	<div class="radio scope ">
		<input id="chance_access_policy_attributes_scope_owner" name="deal.view" type="radio" value="me" x-webkit-speech=""> 只有我能看见
		<input id="chance_access_policy_attributes_owner_id" name="chance[access_policy_attributes][owner_id]" type="hidden" value="6696" x-webkit-speech="">
	</div>
	<div class="radio scope  hide">
		<input class="adhoc_group_ids" id="chance_access_policy_attributes_user_ids" name="chance[access_policy_attributes][user_ids]" type="hidden" x-webkit-speech="">
		<input id="chance_access_policy_attributes_scope_adhocgroup" name="deal.view" type="radio" value="group" x-webkit-speech=""> 选择同事...
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
  }

  AdhocGroupMember.add = function(lastMember) {
    lastMember.removeClass('last')
    AdhocGroupMember.activateMenu()
  }

  AdhocGroupMember.insert = function() {
    if ($.trim($(AdhocGroupMember.menu).val()) != '' && $.inArray($(AdhocGroupMember.menu).val(), adhocGroupMembers()) < 0) {
      $('.adhoc_group_members .last.adhoc_group_member', container).removeClass('last')
      $('.adhoc_group_members', container).append(AdhocGroupMember.create().addClass('last'))
      AdhocGroupMember.deactivateMenu()
			updateUserIds()
    } else {
      AdhocGroupMember.activateMenu()
    }
  }

  AdhocGroupMember.create = function() {
    var member = $('.adhoc_group_member.template', container).clone()
    member.removeClass('template').show()
		$('select', member).removeAttr('disabled').val($(AdhocGroupMember.menu).val())
    return AdhocGroupMember(member)
  }

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
  }

  AdhocGroupMember.deactivateMenu = function() {
    $(AdhocGroupMember.menu).attr('disabled', 'disabled').hide()
  }
	
	
	changePermission()
</script>


</div></div>		
		<div class="form-actions">
			<input class="btn btn-primary" name="commit" onclick="$(&#39;chance_form&#39;).addClassName(&#39;progress&#39;)" type="submit" value="添加这个机会" x-webkit-speech="">
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
        <a href="https://1344267101.workxp.info/chances/new#" title="Close" id="zoom_close" style="position: absolute; top: 0px; left: 0px; display: none; ">                    
       <img src="./adddeal_files/closebox.png" alt="Close" style="border:none; margin:0; padding:0;">                  
 </a>                
 </div>
	
  </body>
</html>
