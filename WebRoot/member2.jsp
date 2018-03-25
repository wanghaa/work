<%@ page language="java" import="java.util.*,com.work.model.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>瑞草生物科技</title>
<script language="javascript" src="js/jquery-1.6.1.min.js"></script>
<script language="javascript" src="js/tinybox.js"></script>
<script language="javascript" src="js/nifty.js"></script>
<script type='text/javascript' src='dwr/interface/utildwr.js'></script>    
<script type='text/javascript' src='dwr/engine.js'></script>
<script language="javascript" src="js/common.js"></script>
<script language="javascript" src="js/member.js"></script>
<link href="member.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="round.css" />
<link rel="stylesheet" type="text/css" href="js/niftyCorners.css" />
<style type="text/css">
.zxx_list_title{background:#eeeeee; border:1px solid #cccccc; padding:1em;}
.zxx_list_content{padding:1em;}
#tinybox{position:absolute; display:none;  background:#fff url(images/preload.gif) no-repeat 50% 50%; z-index:2000;}
#tinymask{position:absolute; display:none; top:0; left:0; height:100%; width:100%; background:#000000; z-index:1500;}
#tinycontent{background:#ffffff; font-size:1.1em;}
</style>
</head>

<body style="overflow-y:scroll">
<div id="out"></div>
<center>

<div  style="margin-top:0;width:930px" class="wrap">
		<p class="titleP"><span>${memberModel.user_name}:您好，欢迎来到瑞草生物科技！</span>请登录免费注册</p>
	<div id="banner"><img height="100px" width="100%" src="images/banner_02.jpg" /></div>
	<div>

		<div class="content" id="profilecontent">
			<div class="c_header" id="list_announce_c" style="margin-left:20px;border-bottom:1px dashed #E6E7E1">
				<h3 onclick="toggle_collapse('list_announce', 1, 1);" ><div class="one" ><div>人员信息</div></div></h3>
				<div class="c_header_action">
					<p onclick="toggle_collapse('list_announce', 1, 1);" class="c_header_ctrlbtn">[ 展开 ]</p>
				</div>
			</div>
			<div id="list_announce" style="display:block">
				
				<div  style="width:50%;float:right">
					<div class="itemtitle s_clear">
						<h1>${memberModel.user_name}</h1>
						<ul><li></li></ul>
						<ul><li>(UID: ${memberModel.user_id})</li></ul>
					</div>
					<div id="baseprofile">
						<table cellpadding="0" style="table-layout: fixed;" class="formtable">
							<tr>
								<th width="70">密码:</th>
								<td><span id="o_pass">${memberModel.user_pass}</span></td>
								<td><a href="javascript:;" style="cursor:pointer;color:#ccc" onclick="changePass()">修改密码</a></td>
							</tr>
							<tr >
								<td colspan="2">
									<div id="changpass" name="changepass" style="display:none">
										<table >
											<tr>
												<td>请输入新密码：</td>
												<td><input type="password" class="" name="newPass" id="newpass" /></td>
											</tr>
											<tr>
												<td>密码确认：</td>
												<td><input type="password" name="newPass2" id="newpass2" /></td>
											</tr>
											<tr>
												<td><input type="button" class="findd" value="提交" onclick="begin_pass()" /></td>
												<td><input type="button" class="findd" value="取消"  onclick="$('#changpass').slideUp('slow');" /></td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<th width="70">性别:</th>
								<td>${memberModel.gender}</td>
							</tr>
							<tr>
								<th width="70">出生日期:</th>
								<td>${memberModel.birthday}</td>
							</tr>
							<tr>
								<th width="70">公司职位:</th>
								<td>${memberModel.occupation}</td>
							</tr>
						</table>
					</div>
					<hr class="dashline" />
					<h3 class="blocktitle lightlink"> 联系方式<span style="font-size:12px">（${memberModel.usuallyMethod}）</span></h3>
					<table cellpadding="0" style="table-layout: fixed;" class="formtable">
						<tr>
							<th width="70">电话:</th>
							<td>${memberModel.telphone}</td>
						</tr>
						<tr>
							<th width="70">E-mail:</th>
							<td>${memberModel.email}</td>
						</tr>
						<tr>
							<th width="70">邮编:</th>
							<td>${memberModel.postcode}</td>
						</tr>
						<tr>
							<th width="70">邮寄地址:</th>
							<td>${memberModel.adress}</td>
						</tr>
					</table>
					<hr class="dashline" />
					
					<h3 class="blocktitle lightlink">积分 &nbsp;&nbsp;${memberModel.score}</h3>
					<table cellpadding="0" style="table-layout: fixed;" class="formtable">
						<tr>
							<th width="70">瑞草会员级别:</th>
							<td>${memberModel.memberLevel}</td>
							<th width="70">折返金额:</th>
							<td>${memberModel.returnValue}</td>
						
					</table>
				</div>
				<div id="picture">
					<div id="imgPlayer_xq" style="margin-left:auto;margin-right:auto;display:none;">
					  <a href="http://shop65037127.taobao.com/" target="_blank" title="瑞草会员卡，金*银*普"><img src="images/t-1.jpg" title="瑞草会员卡，金*银*普" /></a>
					  <a href="http://shop65037127.taobao.com/" target="_blank" title="瑞草口服液"><img src="images/t-2.jpg" title="瑞草口服液" /></a>
					  <a href="http://shop65037127.taobao.com/" target="_blank" title="瑞草口服液，源生绿色"><img src="images/t-3.jpg" title="瑞草口服液，源生绿色" /></a> 
</div>
				</div>
			</div>
			<!-- 订单列表 -->
			<div class="c_header" id="list_order_c" style="margin:10px 0 0 6px;border-bottom:1px dashed #E6E7E1">
				<h3 onclick="toggle_collapse('list_order', 1, 1);"><div class="one" ><div>订单列表</div></div></h3>
				<div class="c_header_action">
					<p onclick="toggle_collapse('list_order', 1, 1);" class="c_header_ctrlbtn">[ 展开 ]</p>
				</div>
			</div>
			<div id="list_order" style="margin-left:10px;border-bottom: 2px solid #E6E7E1;">				
				<DIV class=threadtype>
					<A style="float:right" style="display:none" href="javascript:;" onclick="showDiv('thisdiv');" id="add" name="ordertype">添加订单</A>
					<A href="javascript:;" onclick="selectOrderByParam('${memberModel.user_id}','all')" id="all" name="ordertype" class="selectedA">全部</A>
					<A href="javascript:;" onclick="selectOrderByParam('${memberModel.user_id}','no')" id="no" name="ordertype">未处理</A>
					<A href="javascript:;" onclick="selectOrderByParam('${memberModel.user_id}','fahuo')" id="fahuo" name="ordertype">已发货</A>
					<A href="javascript:;" onclick="selectOrderByParam('${memberModel.user_id}','yes')" id="yes" name="ordertype">已完结</A>
				</DIV>

				<div style="position: relative;margin-bottom:13px;" class="threadlist datalist" id="threadlist">
					<table>
						<thead>
							<tr style="background-color: #EBF2F8" id="oneline">
								<td class="td1 thead">编号</td>
								<td class="td2 thead">淘宝订单号</td>
								<td class="td3 thead">订单积分</td>
								<td class="td4 thead">订单日期</td>
								<td class="td5 thead">操作员</td>
								<td class="td6 thead">操作时间</td>
								<td class="td6 thead">订单状态</td>
								<td class="td7 thead">备注</td>
							</tr>
						</thead>
						<c:if test="${!empty requestScope.orderall}"> 
			           		<c:forEach items="${requestScope.orderall}" var="om" varStatus="status" step="1">
								<tr class="orderList">
									<td class="td1">${status.index +1}</td>
									<td class="td2">${om.taobaoCrad}</td>
									<td class="td3">${om.score}</td>
									<td class="td4">${om.createDate}</td>
									<td class="td5">${om.operName}</td>
									<td class="td6">${om.operDate}</td>
									<td class="td6">${om.statue}</td>
									<td class="td7">${om.beizhu}</td>
								</tr>			           			
			           		</c:forEach>
			           	</c:if>	
					</table>
					
					<div id="fenye">
						<div style="float:left" id="tag">
							共有 ${page.totalCount } 条记录&nbsp;&nbsp;
							共${page.totalPage}页&nbsp;&nbsp;
							
						</div>
						<c:if test="${page.totalPage gt 1}">
						<c:if test="${page.page gt 1}">
							<a href="javascript:;" onclick="submitPage1('${memberModel.user_id}',1,'first')">返回首页</a>
							<a href="javascript:;" onclick="submitPage1('${memberModel.user_id}','${page.page-1}','pro')">上一页</a>
						</c:if>
						<c:if test="${page.page lt page.totalPage}">	
							<a href="javascript:;" onclick="submitPage1('${memberModel.user_id}','${page.page+1}','next')">下一页</a>
	
							<a href="javascript:;" onclick="submitPage1('${memberModel.user_id}','${page.totalPage}','end')">尾页</a>
						</c:if>
						</c:if>
					</div>
					<div style="margin-top:5px">
						第${page.page}页&nbsp;&nbsp;
					</div>
				</div>
			</div>
			<div height="5px" width="100%">&nbsp;</div>
			<!--留言列表 -->
			<div class="c_header" id="message_list_c" style="margin:10px 0 0 6px;border-bottom:1px dashed #E6E7E1">
				<h3 onclick="toggle_collapse('message_list', 1, 1);"><div class="one" ><div>留言信息</div></div></h3>
				<div class="c_header_action">
					<p onclick="toggle_collapse('message_list', 1, 1);" class="c_header_ctrlbtn">[ 展开 ]</p>
				</div>
			</div>		
			<div class="listWrap" id="message_list">
				<c:if test="${!empty requestScope.messageall}"> 
					<ul class="LC clear" id="talkList">
			           	<c:forEach items="${requestScope.messageall}" var="m" varStatus="status" step="1">
							<li>  
								<div class="msgBox">
									<div class="">
										<div class="userName">
											<strong>
												<a href="javascript:;">${m['sender']}</a>:
										   	</strong>
										</div>
										<div class="msgCnt">
											 ${m['content']}
										</div>
									</div>
									<div class="pubInfo">
										<span class="left">
											<a target=""  href="javascript:;" class="time"  title="${m['senddate']}">${m['senddate']}</a> 
										</span>
										<div class="funBox">
											<a onclick="huifu_message('${m.sender}')" class="relay" href="javascript:;">回复</a>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>	
					</ul>
					<div id="fenye">
							<div style="float:left" id="tag">
								共有 ${page_message.totalCount } 条记录&nbsp;&nbsp;
								共${page_message.totalPage}页&nbsp;&nbsp;
								
							</div>
							<c:if test="${page_message.totalPage gt 1}">
							<c:if test="${page_message.page gt 1}">
								<a href="javascript:;" onclick="submitPage('message',1,'first')">返回首页</a>
								<a href="javascript:;" onclick="submitPage('message','${page_message.page-1}','pro')">上一页</a>
							</c:if>
							<c:if test="${page_message.page lt page_message.totalPage}">	
								<a href="javascript:;" onclick="submitPage('message','${page_message.page+1}','next')">下一页</a>
		
								<a href="javascript:;" onclick="submitPage('message','${page_message.totalPage}','end')">尾页</a>
							</c:if>
							</c:if>
						</div>
						<div style="margin-top:5px;margin-left:10px">
							第${page.page}页&nbsp;&nbsp;
						</div>
					</c:if>		
					<div id="talkBox">
						<div class="cntBox">
							<textarea onblur="this.className='txtShadow'" onfocus="this.className='focus'" id="send_content" tabindex="1"  name="send_content"  class="txtShadow">#添加留言内容#</textarea>	
						</div>
						<div class="funBox">
							<input type="button" tabindex="2" title="快捷键 Ctrl+Enter" value="发送" onclick="send_messge()" class="findd"/>	
						</div>
					</div>
				
			</div>
			
		</div>	
	</div>
	
	<div style="display:none" id="hiddendiv">
		<div id="thisdiv" style="margin-top:30px;"><center>
		
			<div style="margin:5px" id="tagT">请输入您的淘宝订单号：</div>
			<input type="text" id="taobao" name="taobao" value="" /><br/>
			<input   type="button" value="提交" onclick="taobaoSubmit()"/>
			<input   type="button" value="取消" onclick="taobaoCancle()"/>
		
		</center></div>
	</div>
 	<div id="footer">Copyright © 2003-2011 Taobao.com 版权所有</div>
	<input type="hidden" value="all" id="orderStatue" name="orderStatue"/>
	<input type="hidden" value="${memberModel.user_id}" id="userId" name="userId"/>
	<input type="hidden" value="${memberModel.user_name}" id="userName" name="userName"/>
	<input type="hidden" value="" id="huifu_taker" name="huifu_taker"/>	
</div>
<script type="text/javascript" src="js/jquery.fn.imgplayer.min.js"></script>
<script type="text/javascript">
  var player = $("#imgPlayer_xq").playImgs({
	  imgCSS	: {'width' : '410px', 'height' : '400px'},
	  width	: '410px',
	  height: '400px',
	  time	: '5000',
	  transition : 1,
	  duration : 2000
  }).start();

$("#btn-start").bind("click",player.start);
$("#btn-stop" ).bind("click",player.stop);
</script>
</center>

<div id="hidden_addmessage" >
<div id="container2">
	<div id="say">
		<h4 class="a_r_s">添加留言</h4>
    </div>
   	<div id="ready_cont">
   		<span class="in_con">留言内容</span>
   		<textarea name="hidden_add_content"  rows="4" cols="30" id="hidden_add_content" class="tao4" ></textarea>
    </div>
   	<div id="b_pttt"> 
        <div id="acti_b">
            <input type="submit" name="submit1" value="提交" onclick="hidden_huifu_message()" class="su2" />&nbsp;&nbsp;&nbsp;
            <input type="reset" name="res" value="重置" class="su2"/>&nbsp;&nbsp;&nbsp;
            <input type="button" name="but" value="取消" onclick="hiddenCancle()" class="su2" />
         </div>
    </div>     
</div>
</div>
</body>
</html>