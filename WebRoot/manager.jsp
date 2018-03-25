<%@ page language="java" import="java.util.*,com.work.model.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>瑞草生物科技（管理员管理）</title>
<script language="javascript" src="js/jquery-1.6.1.min.js"></script>
<script language="javascript" src="js/tinybox.js"></script>
<script type='text/javascript' src='dwr/interface/utildwr.js'></script>    
<script type='text/javascript' src='dwr/engine.js'></script>
<script language="javascript" src="js/common.js"></script>
<script language="javascript" src="js/admin.js"></script>
<link rel="stylesheet" type="text/css" href="admin.css" />
<link rel="stylesheet" type="text/css" href="round.css" />




<style>
.zxx_list_title{background:#eeeeee; border:1px solid #cccccc; padding:1em;}
.zxx_list_content{padding:1em;}
#tinybox{position:absolute; display:none;  background:#fff url(images/preload.gif) no-repeat 50% 50%; z-index:2000;}
#tinymask{position:absolute; display:none; top:0; left:0; height:100%; width:100%; background:#000000; z-index:1500;}
#tinycontent{background:#ffffff; font-size:1.1em;}
</style>
</head>

<body>
        <div id="out"></div>

<div id="container">
   <p class="titleP"><span>${admin_name}:您好，欢迎来到瑞草生物科技！</span>请登录免费注册  <a style="cursor:poiniter" href="LevelServlet?admin_name=${admin_name}" >会员级别管理</a></p>
	<div id="banner"><img src="images/banner_02.jpg" /></div>
	
	<h4 class="list">
			    	<div style="border-bottom: 1px solid rgb(230, 231, 225);" id="use_con_c" class="c_header">
						<h3 onclick="toggle_collapse('use_con', 1, 1);"><div class="one"><div>基本信息</div></div></h3>
						<div class="c_header_action">
							<label class="c_header_ctrlbtn" onclick="toggle_collapse('use_con', 1, 1);">[ 展开 ]</label>
						</div>
					</div>
			    </h4>
             	<div id="use_con" style="display:inline-block;">
             		<table style="display:block;">
             			<tr>
             				<td >
			    				<div id="picture">	
									<div id="imgPlayer_xq" style="margin-left:auto;margin-right:auto;display:none;">
									  <a href="http://shop65037127.taobao.com/" target="_blank" title="瑞草会员卡，金*银*普"><img src="images/t-1.jpg" title="瑞草会员卡，金*银*普" /></a>
									  <a href="http://shop65037127.taobao.com/" target="_blank" title="瑞草口服液"><img src="images/t-2.jpg" title="瑞草口服液" /></a>
									  <a href="http://shop65037127.taobao.com/" target="_blank" title="西洋参蜂王浆"><img src="images/西洋参蜂王浆.jpg" title="西洋参蜂王浆" /></a>
									  <a href="http://shop65037127.taobao.com/" target="_blank" title="灵芝孢子"><img src="images/灵芝孢子.jpg" title="灵芝孢子" /></a> 
									</div>
			                    </div>             				
             				</td>
             				<td>
             				  	<div id="user_inf">		
			           				<ul class="right_wd">
			                       		<li class="one_1">${memberModel.user_name}&nbsp;&nbsp;&nbsp;&nbsp;<label class="l1" >(UID:${memberModel.user_id})</label><br/><br/></li>
			           					<li class="two">密码：<label id="o_pass" class="l2" >${memberModel.user_pass}</label><a href="javascript:;" style="cursor:pointer;color:#ccc;margin-left:150px" onclick="changePass()">修改密码</a>
					           				<div id="changpass" name="changepass" style="display:none">
												<table >
													<tr>
														<td>请输入新密码：<br /></td>
														<td><input type="password" class="" name="newPass" id="newpass" /><br /></td>
													</tr>
													<tr>
														<td>密码确认：<br /></td>
														<td><input type="password" name="newPass2" id="newpass2" /><br /></td>
													</tr>
													<tr>
														<td><input type="button" class="findd" value="提交" onclick="begin_pass()" /><br /></td>
														<td><input type="button" class="findd" value="取消"  onclick="$('#changpass').slideUp('slow');" /><br /></td>
													</tr>
												</table>
											</div>
			           					<br/><br/>性别：<label class="l3" >${memberModel.gender}</label><br/><br/>出生日期：<label class="l4" >${memberModel.birthday}</label><br/><br/></li>
			                            <li class="three">联系方式<br/><br/></li>
										<li class="four">电话：<label class="l6" >${memberModel.telphone}</label><br/><br/>E-Mail：<label class="l7" >${memberModel.email}</label><br/><br/>MSN：<label class="l7" >${memberModel.msn}</label><br/><br/></li>
			                 		</ul>
			                  	</div>
             				</td>		
             			</tr>	
             		</table>
                </div><!--end of "use_con"-->
	
	<!-- 会员列表 -->
    <h4 class="list">
    	<div class="c_header" id="list_member_c" style=";border-bottom:1px solid #E6E7E1">
			<h3 onclick="toggle_collapse('list_member', 1, 1);" ><div class="one" ><div>会员列表</div></div></h3>
			<div class="c_header_action">
				<p onclick="toggle_collapse('list_member', 1, 1);" class="c_header_ctrlbtn">[ 展开 ]</p>
			</div>
		</div>
    </h4>
	<div id="list_member" class="con_e round">
		<h4><input name="member_text" type="text" value="" id="member_text"  class="find"/><input name="buto" type="button" value="查找" class="findd" onclick="member_find()" /></h4>
		<div id="div_member" class="tabb">
				<form class="form_tab" method="post" action="#" name="form1">
              	<table class="mytab">
              		<tr id="trone" style="background-color: #EBF2F8"><td>姓名</td><td>生日</td><td>性别</td>
              			<td>电话</td><td>电子邮箱</td><td>积分</td><td>会员等级</td>
              		</tr>
              		<c:if test="${!empty memberall}"> 
		           		<c:forEach items="${memberall}" var="member" varStatus="status" step="1">
							<tr class="memberlist"  ondblclick="checkMember(${member['user_id']})">
								<td>${member['user_name']}</td>
								<td>${member['birthday']}</td>
								<td>${member['gender']}</td>
							    <td>${member['telphone']}</td>
							    <td>${member['email']}</td>
							    <td>${member['score']}</td>
							    <td>${member['memberLevel']}</td>
							 </tr>		           			
		           		</c:forEach>
			        </c:if>	
              	</table>
              	</form>
             	<div id="fenye">
					<div style="float:left" id="tag">
						共有 ${page_member.totalCount } 条记录&nbsp;&nbsp;
						共${page_member.totalPage}页&nbsp;&nbsp;
						
					</div>
					<c:if test="${page_member.totalPage gt 1}">
					<c:if test="${page_member.page gt 1}">
						<a href="javascript:;" onclick="submitPage('member',1,'first')">返回首页</a>
						<a href="javascript:;" onclick="submitPage('member','${page_member.page-1}','pro')">上一页</a>
					</c:if>
					<c:if test="${page_member.page lt page_member.totalPage}">	
						<a href="javascript:;" onclick="submitPage('member','${page_member.page+1}','next')">下一页</a>

						<a href="javascript:;" onclick="submitPage('member','${page_member.totalPage}','end')">尾页</a>
					</c:if>
					</c:if>
				</div>
				<div style="text-align:left;margin: 5px 0 0 5px">
					第${page_member.page}页&nbsp;&nbsp;
				</div>
				
        </div>
        <div class="bot"><p></p></div>
  	</div>
	<!-- 订单列表 -->
    <h4 class="list">
    	<div class="c_header" id="list_order_c" style=";border-bottom:1px solid #E6E7E1">
			<h3 onclick="toggle_collapse('list_order', 1, 1);" ><div class="one" ><div>订单列表</div></div></h3>
			<div class="c_header_action">
				<p onclick="toggle_collapse('list_order', 1, 1);" class="c_header_ctrlbtn">[ 展开 ]</p>
			</div>
		</div>
    </h4>
	<div id="list_order" class="con_e round">
		<h4><span class="word">
				<a href="javascript:;"  onclick="addOrder()" id="addorder" name="addorder" class="orderStatue">添加订单</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<A href="javascript:;" onclick="selectOrderByParam('all')" id="all" name="ordertype" class="selectdA">全部</A>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<A href="javascript:;" onclick="selectOrderByParam('no')" id="no" name="ordertype" class="orderStatue">未处理</A>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<A href="javascript:;" onclick="selectOrderByParam('fahuo')" id="fahuo" name="ordertype" class="orderStatue">已发货</A>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<A href="javascript:;" onclick="selectOrderByParam('yes')" id="yes" name="ordertype" class="orderStatue">已完结</A>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</span>
			<input  type="text" value="" id="order_text" name="order_text"  class="find"/><input name="buto" type="button" value="查找" class="findd2"  onclick="order_find()"/>
		</h4>
		<div id="div_order" class="tabb">
			<form  name="form1" action="#" method="post" class="form_tab2">
	        	<table class="mytab2">
	        		<tr id="trone" style="background-color: #EBF2F8"><td class="td1">编号</td><td class="td2">会员名称</td>
	            		<td class="td3">淘宝订单号</td><td class="td4">订单积分</td>
	            		<td class="td5">订单日期</td><td class="td6">操作时间</td>
	            		<td class="td7">状态</td><td class="td8">备注</td>
	            	</tr>
              		<c:if test="${!empty orderall}"> 
		           		<c:forEach items="${orderall}" var="order" varStatus="status" step="1">
							<tr class="orderlist" ondblclick="checkOrder(${order['orderId']})">
								<td>${status.index +1}</td>
								<td>${order['userName']}</td>
								<td>${order['taobaoCrad']}</td>
							    <td>${order['score']}</td>
							    <td>${order['createDate']}</td>
							    <td>${order['operDate']}</td>
							    <td>${order['statue']}</td>
							    <td>${order['beizhu']}</td>							    
							 </tr>		           			
		           		</c:forEach>
			        </c:if>	
	            </table>
	        </form>
              <div id="fenye">
				<div style="float:left" id="tag">
					共有 ${page_order.totalCount } 条记录&nbsp;&nbsp;
					共${page_order.totalPage}页&nbsp;&nbsp;
					
				</div>
				<c:if test="${page_order.totalPage gt 1}">
				<c:if test="${page_order.page gt 1}">
					<a href="javascript:;" onclick="submitPage('order',1,'first')">返回首页</a>
					<a href="javascript:;" onclick="submitPage('order','${page_order.page-1}','pro')">上一页</a>
				</c:if>
				<c:if test="${page_order.page lt page_order.totalPage}">	
					<a href="javascript:;" onclick="submitPage('order','${page_order.page+1}','next')">下一页</a>

					<a href="javascript:;" onclick="submitPage('order','${page_order.totalPage}','end')">尾页</a>
				</c:if>
				</c:if>
			</div>
			<div style="text-align:left;margin: 5px 0 0 5px">
				第${page_order.page}页&nbsp;&nbsp;
			</div>	
	    </div>
	    <div class="bot"><p></p></div>
    </div>
  	<!-- 留言 -->
  	<h4 class="list">
  		<div class="c_header" id="list_message_c" style="border-bottom:1px solid #E6E7E1;">
			<h3 onclick="toggle_collapse('list_message', 1, 1);" ><div class="one" ><div>留言列表</div></div></h3>
			<div class="c_header_action">
				<p onclick="toggle_collapse('list_message', 1, 1);" class="c_header_ctrlbtn">[ 展开 ]</p>
			</div>
		</div>
  	</h4>
    <div id="list_message" class="cente">
		 <div id="con_a" class="round">
		 <h4 style=""></h4>
   			<div class="tabb" style="min-height:350px;margin:0;padding:0">
	   			<table width="98%">
	   				<tr>
	   					<td >
			  			   <div>
			                  	<img src="images/pt-010.jpg" height="350px" style="margin-left:20px"/>
			           	   </div>   					
	   					</td>
	   					<td width="58%">
	   						<div id="div_message">
			           	   		<a  class="addmessage" onclick="addMessage()" id="addmessage" name="addmessage">添加留言</a>
			                 	<table class="last_tab">
			               			<tr id="trone" style="background-color: #EBF2F8"><td class="td3">发送人</td><td class="td2">留言内容</td><td class="td4">留言时间</td></tr>
			               			<c:if test="${!empty messageall}"> 
					           			<c:forEach items="${messageall}" var="message" varStatus="status" step="1">
											<tr class="messagelist" ondblclick="checkMessage(${message['message_id']})">
												<td>${message['sender']}</td>
												<td>${message['content']}</td>
											    <td>${message['senddate']}</td>						    
											 </tr>		           			
					           			</c:forEach>
				        			</c:if>	 		
			                	</table>
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
								<div style="text-align:left;margin: 5px 0 0 5px">
									第${page_message.page}页&nbsp;&nbsp;
								</div>
			         		</div>
	   					</td>
	   				</tr>
	   			</table>

           	   
            </div>
            
          	<div class="bot"><p style="margin:0;padding:0"></p></div>
	    </div>
   	</div>
   	<!-- 隐藏域 -->
	<input type="hidden" value="" id="key_member" name="key_member"/><!--会员查询条件 -->
	<input type="hidden" value="" id="key_order" name="key_order"/><!--订单查询条件 -->
	<input type="hidden" value="all" id="orderStatue" name="orderStatue"/><!--订单状态查询条件 -->
	<input type="hidden" value="${admin_name}" id="admin_name" name="admin_name"/><!--订单状态查询条件 -->
	<input type="hidden" value="" id="show_oldscore" name="show_oldscore"/><!--订单明细原有积分 -->
	
<div id="hidden_addorder">
	<div id="container1">
	  <div id="code">
	  		<h4 class="add">添加订单</h4>
	  
	  	<label>淘宝订单号</label>
	  		<input  name="hidden_order_taobaocard" id="hidden_order_taobaocard" type="text" value="" class="tao1" />
	  </div>
	    	<div id="code2">
	        	<label>会&nbsp;&nbsp;员&nbsp;名&nbsp;称</label>
	  			<input name="hidden_order_username" id="hidden_order_username" type="text" value=""  class="tao2"/>
	
	  </div>
	      	<div id="code3">
	        	<label>订&nbsp;单&nbsp;积&nbsp;&nbsp;分</label>
	  			<input name="hidden_order_score" id="hidden_order_score" type="text" value="0"  class="tao5"/>
	
	  </div>
	    	<div id="code4">
	        	<label>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态</label>
	  			<select  style="width:200px" id="hidden_order_statue" name="hidden_order_statue">
	  				<option value="未处理" selected>未处理</option>
	  				<option value="已发货">已发货</option>
	  				<option value="已完结">已完结</option>
	  			</select>
	
	  </div>
	    	<div id="code5">
	        	<span class="ready">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</span>
	       			 <textarea name="hidden_order_content" id="hidden_order_content" rows="4" cols="30" class="tao7" ></textarea>
	
	  </div>
	
	  	
	   	<div id="b_pt"> 
	  		<div id="acti">
	 	 <input type="submit" name="submit1" value="提交" onclick="hidden_addOrder()" class="su"/>&nbsp;&nbsp;&nbsp;
	  	<input type="reset" name="res" value="重置" class="su"/>&nbsp;&nbsp;&nbsp;
	  	<input type="button" name="but" value="取消" onclick="hiddenCancle()" class="su"/>
	 	 </div>
	    </div>        
	</div>
</div>
<div id="hidden_addmessage" >
<div id="container2">
	<div id="say">
		<h4 class="a_r_s">添加留言</h4>
    	<label>&nbsp;发&nbsp;&nbsp;送&nbsp;人</label>
    		<input type="text" name="hidden_add_sender" id="hidden_add_sender" value=""  class="tao3"/>
    </div>
   	<div id="ready_cont">
   		<span class="in_con">留言内容</span>
   		<textarea name="hidden_add_content"  rows="4" cols="30" id="hidden_add_content" class="tao4" ></textarea>
    </div>
   	<div id="b_pttt"> 
        <div id="acti_b">
            <input type="submit" name="submit1" value="提交" onclick="hidden_add_message()" class="su2" />&nbsp;&nbsp;&nbsp;
            <input type="reset" name="res" value="重置" class="su2"/>&nbsp;&nbsp;&nbsp;
            <input type="button" name="but" value="取消" onclick="hiddenCancle()" class="su2" />
         </div>
    </div>     
</div>
</div>
<div id="hidden_showmember">
<div id="container3">
 	<div id="ringing">
    	<h4 class="last_h">会员详细信息列表</h4>
        	
            	<div id="text_y">
                	<table class="huiyuan_biao">
                    	<tr>
                        	<td class="hui_in" colspan="4">会员基本信息</td>
                        </tr>  
                        <tr>
                        	<td>姓名：</td> 
                            <td ><label class="xingming" id="show_username" name="show_username"></label></td>
                            <td>用户编码 ：</td>
                            <td class="bianma"><label id="show_userid" name="show_userid"></label></td>
                        </tr>
                         <tr>
                        	<td>生日：</td> 
                            <td class="shengri"><label id="show_birthday" name="show_birthday"></label></td>
                            <td>性别：</td>
                            <td class="xingbie"><label id="show_sex" name="show_sex"></label></td>
                        </tr> 
                         <tr>
                        	<td>公司职位：</td> 
                            <td class="zhiwei"><label id="show_duty" name="show_duty"></label></td>
                            <td>电话：</td>
                            <td class="dianhua"><label id="show_telphone" name="show_telphone"></label></td>
                        </tr>            
                         <tr>
                        	<td>电子邮件：</td> 
                            <td class="youjian"><label id="show_email" name="show_email"></label></td>
                            <td>邮编：</td>
                            <td class="youbian"><label id="show_postcode" name="show_postcode"></label></td>
                        </tr>            
                         <tr>
                        	<td>折返金额：</td> 
                            <td class="jin_e"><label id="show_je" name="show_je"></label></td>
                            <td>常用联系方式：</td>
                            <td class="lianxifanshi"><label id="show_usually" name="show_usually"></label></td>
                        </tr> 
                        <tr>
                            <td >邮寄地址：</td> 
                            <td class="dizhi" colspan="3"><label id="show_adress" name="show_adress"></label></td>
                        </tr>           
                         <tr>
                        	<td>会员积分</td> 
                            <td><label name="show_score" id="show_score" ></label></td>
                            <td>会员等级</td>
                            <td id="show_dwrlevel" name="show_dwrlevel"></td>
                        </tr>                                           
                    
                    </table>
                	
                  </div>

    </div>	
    	<div id="tijiao">
        	<input name="ti" type="button" onclick="update_member()" value="修改" class="ttt"/>
        	<input name="ti" type="button" value="取消" onclick="hiddenCancle()" class="ttt"/>
        </div>
</div>




</div>			
    <div id="footer">Copyright © 2003-2011 Taobao.com 版权所有</div>
</div>
<div id="hidden_showorder">
<div id="container4">
	 	<div id="din_d">
    		<h4 class="last_ding">订单详细信息</h4>
        	
            	<div id="d_d_xiang">
                	<table class="dingdan_biao">
                    	<tr>
                        	<td class="dan_t" colspan="4">订单基本信息</td>
                        </tr>  
                        <tr>
                        	<td>会员名称：</td> 
                            <td class="huiyuanmingcheng" id="show_order_username" name="show_order_username"></td>
                            <td>淘宝订单号：</td> 
                            <td class="taobaodingdanhao" id="show_order_taobao" name="show_order_taobao"></td>
                        </tr>
                        
                        <tr>
                        	<td>订单日期：</td> 
                            <td class="dingdanriqi" id="show_order_createdate" name="show_order_createdate"></td>
                            <td>操&nbsp;作&nbsp;时&nbsp;&nbsp;间：</td>
                            <td class="chaozhuoshijian" id="show_order_operdate" name="show_order_operdate"></td>
                        </tr>            
                        <tr>
                        	<td>订单积分：</td>
                            <td class="dingdanjifen"><input name="show_order_score" id="show_order_score" type="text" value=""  class="d_d_j_fen"/></td>	
                        	<td>状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态&nbsp;：</td> 
                            <td class="zhuangtai" id="dwr_statue" name="dwr_statue"></td>				
                        </tr> 
                  </table>
               		<table class="last_biaoge">
	                   <tr>
							<td class="last_td">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;：</td>
	
	  						<td class="beizhu"><textarea name="show_order_beizhu" id="show_order_beizhu" rows="4" cols="30" class="jieshuo"></textarea></td>
	   					    
						</tr> 
                	</table>      

               </div>
    	   </div>
    	   
    	   	
     <div id="niuzi">
        	<input name="ti" type="button" onclick="update_order()" value="修改" class="t_ni"/>
        	<input name="ti" type="button" onclick="hiddenCancle()" value="取消" class="t_ni"/>
     </div>
</div>

</div>

<div id="hidden_showmessage">
<div id="container5">
	<div id="xian_shi_liu_yan">
    	<h4 class="n_ya_r">留言内容</h4>
        	<div  class="wenbenyu">
            	<textarea name="show_content" id="show_content" rows="4" cols="30" class="liuyanneiyong" disabled scroll="no"></textarea>
            </div>
        <table class="fa_s">
        	<tr>
            	<td class="ha">发送人：</td>
                <td class="f_re"><input name="show_sender" id="show_sender" type="text" value="孟凡永" class="ren_ming"/></td>
            </tr>
            <tr>
            	<td class="shiij">发送时间：</td>
                <td class="h_m_s"><input name="show_senddate" id="show_senddate" type="text" value="2011:2:23:" class="hour"/></td>
            </tr>
        </table>
     </div>
 <div id="hui_fu_liu_yan">
      	<h4 class="zhu_ti">回复留言</h4>
        	<div class="wen_ben">
            	<textarea name="show_content_huifu"  id="show_content_huifu" rows="4" cols="30" class="zhengwen"></textarea>
            </div>
         <table class="huifuren">
         	<tr>
            	<td class="xixi">回复人：</td>
                <td class="fu_1"><input name="teex" type="text" value="${admin_name}"  class="h_f_ring"/></td>
               
            </tr>
         </table>
         <div id="anniu">
         	<input name="co" type="button" onclick="show_huifu()" value="回复" class="fhuo"/>&nbsp;&nbsp;&nbsp;
         	<input name="co" type="button" onclick="hiddenCancle()" value="取消" class="fhuo"/>
         </div>
 </div>
 <div id="tux"></div>
</div>  
</div>
<script type="text/javascript" src="js/jquery.fn.imgplayer.min.js"></script>
<script type="text/javascript">
  var player = $("#imgPlayer_xq").playImgs({
	  imgCSS	: {'width' : '310px', 'height' : '300px'},
	  width	: '310px',
	  height: '300px',
	  time	: '5000',
	  transition : 1,
	  duration : 2000
  }).start();

$("#btn-start").bind("click",player.start);
$("#btn-stop" ).bind("click",player.stop);
</script>
</body>
</html>