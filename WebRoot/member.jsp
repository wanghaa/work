<%@ page language="java" import="java.util.*,com.work.model.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>磊元科技科技-工作日志</title>
<link href="css5.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/jquery-1.6.1.min.js"></script>
<script language="javascript" src="js/tinybox.js"></script>
<script language="javascript" src="js/nifty.js"></script>
<script type='text/javascript' src='dwr/interface/utildwr.js'></script>    
<script type='text/javascript' src='dwr/engine.js'></script>
<script language="javascript" src="js/common.js"></script>
<script language="javascript" src="js/member.js"></script>
<script language="javascript" src="ckeditor/ckeditor.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script>
$(document).ready(function () {  
    $(".orderList").hover(function() {  

		 $(this).css("background-color","#F0F0F0");  
		
		 $(this).css("cursor","pointer");  
	
	 },function(){  
	
		 $(this).css("background-color","#FFFFFF");  
		
		 $(this).css("cursor","pointer");   
	
	 }); 
	 var d=new Date(); 
	 var year=d.getFullYear();
	 var month=d.getMonth()+1;
	 var day=d.getDate();
	 if(parseInt(month)<10)month="0"+month;
	 if(parseInt(day)<10)day="0"+day;
	 document.getElementById("brithday").value=d.getFullYear()+"-"+month+"-"+day;

});
</script>
<style type="text/css">
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
		<p class="p"><span>${memberModel.user_name}:您好，欢迎来到磊元科技！</span></p>
			<div id="banner">
            	<img src="images/banner_02.jpg"/>
             </div>
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
             				<td valign="top">
			    				<div id="picture">
									  <img id="head" style="width:180px;height:180px" src="${memberModel.head}" title="" />
										<a href="javascript:;"  onclick="changeHead()">[更换]</a>
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
			                 			<!-- <li class="three" onclick="foward_topic(${memberModel.user_id})">交流中心<br/><br/></li> -->
			                 		</ul>
			                  	</div>
             				</td>		
             			</tr>	
             		</table>
                </div><!--end of "use_con"-->
                <c:if test="${memberModel.limits>1}">
                <h4 class="list">
			    	<div style="border-bottom: 1px solid rgb(230, 231, 225);" id="indent_c" class="c_header">
						<h3 onclick="toggle_collapse('indent', 1, 1);"><div class="one"><div>职工列表</div></div></h3>
						
						<div class="c_header_action">
							<a target=”_black” href="register.html" class="c_header_ctrlbtn" >[ 添加 ]</a>
						</div>
					</div>
			    </h4>
				<div id="indent" style="display:inline-block;width:100%;border-bottom:2px solid #E6E7E1;">
	
					<div id="threadlist">
					<table>
							<tr style="background-color: #EBF2F8" id="oneline">
								<td class="td1 thead">编号</td>
								<td class="td2 thead">姓名</td>
								<td class="td3 thead">性别</td>
								<td class="td4 thead">出生日期</td>
								<td class="td5 thead">联系电话</td>
								<td class="td6 thead">E-Mail</td>
								<td class="td6 thead">MSN</td>
								<td class="td7 thead">创建日期</td>
							</tr>
						<c:if test="${!empty requestScope.emp_list}"> 
			           		<c:forEach items="${requestScope.emp_list}" var="om" varStatus="status" step="1">
								<tr class="orderList">
									<td class="td1">${status.index +1}</td>
									<td class="td2"  onclick="find_userName('${om.user_name}')" title="点击查看${om.user_name}的日志"><a href="javascript:;">${om.user_name}</a></td>
									<td class="td3">${om.gender}</td>
									<td class="td4">${om.birthday}</td>
									<td class="td5">${om.telphone}</td>
									<td class="td6">${om.email}</td>
									<td class="td6">${om.msn}</td>
									<td class="td7">${om.create_date}</td>
								</tr>			           			
			           		</c:forEach>
			           	</c:if>	
					</table>
					<div id="fenye">
						<div style="float:left" id="tag">
							共有 ${emp_page.totalCount } 条记录&nbsp;&nbsp;
							共${emp_page.totalPage}页&nbsp;&nbsp;
							
						</div>
						<c:if test="${emp_page.totalPage gt 1}">
						<c:if test="${emp_page.page gt 1}">
							<a href="javascript:;" onclick="submitPage1('Empolyess',1,'first')">返回首页</a>
							<a href="javascript:;" onclick="submitPage1('Empolyess','${emp_page.page-1}','pro')">上一页</a>
						</c:if>
						<c:if test="${emp_page.page lt emp_page.totalPage}">	
							<a href="javascript:;" onclick="submitPage1('Empolyess','${emp_page.page+1}','next')">下一页</a>
	
							<a href="javascript:;" onclick="submitPage1('Empolyess','${emp_page.totalPage}','end')">尾页</a>
						</c:if>
						</c:if>
					</div>
					<div style="margin-top:5px;margin-left:5px">
						第${emp_page.page}页&nbsp;&nbsp;
					</div>
					</div>
	              </div>
	             </c:if> 
	              	
             	<h4 class="list">
			    	<div style="border-bottom: 1px solid rgb(230, 231, 225);" id="luiyan_c" class="c_header">
						<h3 onclick="toggle_collapse('luiyan', 1, 1);"><div class="one"><div>工作日志</div></div></h3>
						<div class="c_header_action">
							<label class="c_header_ctrlbtn" onclick="toggle_collapse('luiyan', 1, 1);">[ 展开 ]</label>
						</div>
					</div>
			    </h4>
				<DIV class="threadtype_liuyan">
					<A href="javascript:;" onclick="selectMessageByParam('${memberModel.user_name}',${memberModel.limits},1,this)" id="all" name="all" class="selectedA">全部</A>
					<A href="javascript:;" onclick="selectMessageByParam('${memberModel.user_name}',${memberModel.limits},2,this)" id="today" name="today" class="no_selectedA">今天</A>
					<A href="javascript:;" onclick="selectMessageByParam('${memberModel.user_name}',${memberModel.limits},3,this)" id="pro_day" name="pro_day" class="no_selectedA">昨天</A>
					<A href="javascript:;" onclick="selectMessageByParam('${memberModel.user_name}',${memberModel.limits},4,this)" id="week" name="week" class="no_selectedA">一周</A>
				</DIV>	 
				<div id="luiyan" style="display:inline-block;">			
					<c:if test="${!empty requestScope.diary_list}">
						<ul class="list_liu">
							<c:forEach items="${requestScope.diary_list}" var="m" varStatus="status" step="1">
				    			<li id="li_${m['dia_id']}">
				    				<b>	
				    					<a href="javascript:;" onclick="find_userName('${m['user_name']}')">${m['user_name']}：</a>
				    				</b>
				    				<div class="contet_div">
				    					${m['content']}
				    				</div>
				    				<span class="hui">
				    					<a href="javascript:void();" onclick="find_date('${m['dia_date']}')">${m['dia_date']}</a>&nbsp;&nbsp;
				    					<a href="javascript:void();" onclick="deleteDiaryById('${m['dia_id']}')">[ 删除]</a>
				    					
				    				</span>
				    			</li>
				    		</c:forEach>
				    	</ul>
				    	<div id="fenye">
							<div style="float:left" id="tag">
								共有 ${diary_page.totalCount } 条记录&nbsp;&nbsp;
								共${diary_page.totalPage}页&nbsp;&nbsp;
								
							</div>
							<c:if test="${diary_page.totalPage gt 1}">
							<c:if test="${diary_page.page gt 1}">
								<a href="javascript:;" onclick="submitPage('message',1,'first')">返回首页</a>
								<a href="javascript:;" onclick="submitPage('message','${diary_page.page-1}','pro')">上一页</a>
							</c:if>
							<c:if test="${diary_page.page lt diary_page.totalPage}">	
								<a href="javascript:;" onclick="submitPage('message','${diary_page.page+1}','next')">下一页</a>
		
								<a href="javascript:;" onclick="submitPage('message','${diary_page.totalPage}','end')">尾页</a>
							</c:if>
							</c:if>
						</div>
						<div style="margin-top:5px;margin-left:10px">
							第${diary_page.page}页&nbsp;&nbsp;
						</div>
			    	</c:if>
	
				</div>
				<div style="margin-top:10px">  
			    	<textarea id="send_content"   name="send_content"  rows="4" cols="30"  >#工作内容#</textarea>
			    	<div>
			        <input type="text"  name="brithday" id="brithday" value="" class="Wdate" style="margin-left:750px" readonly onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"/>
			        <input name="fa" type="submit" value=" 发送" onclick="send_messge()" class="son"/>
			        </div>
			    <script type="text/javascript">
					var editor = CKEDITOR.replace( 'send_content',{skin:'kama',lamguage:'zh-ch'} );
				</script> 		
			    </div>
 	<div id="footer">
    	Copyright © 2003-2011 Taobao.com 版权所有
    </div>
    <input type="hidden" value="all" id="diaryStatue" name="diaryStatue"/>
    <input type="hidden" value="blog_taker" id="messageStatue" name="messageStatue"/>
    
	<input type="hidden" value="${memberModel.user_id}" id="userId" name="userId"/>
	<input type="hidden" value="${memberModel.user_name}" id="userName" name="userName"/>
	<input type="hidden" value="${memberModel.limits}" id="limit" name="limit"/>
	<input type="hidden" value="" id="huifu_taker" name="huifu_taker"/>	
	
	<input type="hidden" value="" id="param_userName" name="param_userName"/>
	<input type="hidden" value="" id="param_date" name="param_date"/>
</div>

<div id="hidden_addmessage" style="display:none">
<div id="container2">
	<div id="say">
		<h4 class="a_r_s">添加留言</h4>
    </div>
   	<div id="ready_cont">
   		<span class="in_con">留言内容</span>
   		<textarea name="hidden_add_content"  rows="4" cols="30" id="hidden_add_content" class="tao4" >
   		
   		</textarea>
 
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
<div id="user_head" style="display:none">
<table width="200" border="1" style="background-color:#FFF">
  <tr>
    <td><img class="image_h" src="emp_image/pic_077.jpg" onclick="js_changeHead('emp_image/pic_077.jpg')"/><label class="label_h">经理</label></td>
    <td><img class="image_h" src="emp_image/pic_102.jpg" onclick="js_changeHead('emp_image/pic_102.jpg')"/><label class="label_h">财务</label></td>
    <td><img class="image_h" src="emp_image/pic_085.jpg" onclick="js_changeHead('emp_image/pic_085.jpg')"/><label class="label_h">程序</label></td>
  </tr>
  <tr>
    <td><img class="image_h" src="emp_image/pic_103.jpg" onclick="js_changeHead('emp_image/pic_103.jpg')"/><label class="label_h">商务</label></td>
    <td><img class="image_h" src="emp_image/pic_036.jpg" onclick="js_changeHead('emp_image/pic_036.jpg')"/><label class="label_h">设计</label></td>
	<td><img class="image_h" src="emp_image/pic_101.jpg" onclick="js_changeHead('emp_image/pic_101.jpg')"/><label class="label_h">前台</label></td>
  </tr>
</table>
</div> 
</body>
</html>
            	

