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
<script language="javascript" src="js/level.js"></script>

<link rel="stylesheet" type="text/css" href="round.css" />
<link rel="stylesheet" type="text/css" href="admin.css" />
<link rel="stylesheet" type="text/css" href="css6.css" />
<style>
.zxx_list_title{background:#eeeeee; border:1px solid #cccccc; padding:1em;}
.zxx_list_content{padding:1em;}
#tinybox{position:absolute; display:none;  background:#fff url(images/preload.gif) no-repeat 50% 50%; z-index:2000;}
#tinymask{position:absolute; display:none; top:0; left:0; height:100%; width:100%; background:#000000; z-index:1500;}
#tinycontent{background:#ffffff; font-size:1.1em;}

#hidden_show_level,#hidden_addlevel{
	display:none;
}
</style>
<script>
$(document).ready(function () {   
    $(".levellist").hover(function() {  

		 $(this).css("background-color","#F0F0F0");  
		
		 $(this).css("cursor","pointer");  
	
	 },function(){  
	
		 $(this).css("background-color","#FFFFFF");  
		
		 $(this).css("cursor","pointer");   
	
	 });  

});   

  var app=navigator.appName;
  var verStr=navigator.appVersion;
  var flag=false;
function addLevel(){
	//弹出详细信息窗口
	var divs=document.getElementById("hidden_addlevel").innerHTML;
	if (app.indexOf('Netscape') != -1){
		TINY.box.show(divs,0,400,222,1);//火狐、Netscape
	} else if (app.indexOf('Microsoft') != -1) {
		TINY.box.show(divs,0,400,243,1);//IE
	}		
}
function submit_addLevel(){debugger;
	//验证
	var levelname=$("input[name='add_levelname']")[1].value;//名称
	var level=$("input[name='add_level']")[1].value;//级别
	var minscore=$("input[name='add_minscore']")[1].value;//升级积分
	var returnvalue=$("input[name='add_returnvalue']")[1].value;//折返金额
	if(levelname=="" || level=="" ||minscore=="" ||returnvalue==""){
		alert("请保证数据填写完整");
		return;
	}
	var c_score=/^[0-9]*[1-9][0-9]*$/;
	if(!c_score.test(level)&&level!=0){
		alert("会员等级必须是大于等于0的整数");return;
	}
	if(!c_score.test(minscore)&&minscore!=0){
		alert("升级积分必须是大于等于0的整数");return;
	}
	if(!c_score.test(returnvalue)&&returnvalue!=0){
		alert("折返金额必须是大于等于0的整数");return;
	}
	//名称查重
	dwr.engine.setAsync(false);
	utildwr.checkLevelName(levelname,callback_checkLevelName);
	if(flag){
		alert("会员级别名称重复");
		return;
	}
	//提交
	dwr.engine.setAsync(false);
	utildwr.addLevel(levelname,minscore,level,returnvalue,callback_addLevel);
	
	
}
function callback_addLevel(data){
	if(data){
		alert("添加成功");
		dwr.engine.setAsync(false);
		utildwr.levelOper(1,callback_levelOper);
	}else{
		alert("添加失败,请与管理员联系")
	}
}
function  callback_checkLevelName(data){
	flag=data;
}
function submitPage(table,currentPage ,statue){
	dwr.engine.setAsync(false);
	utildwr.levelOper(currentPage,callback_levelOper);
}
function callback_levelOper(data){
	$("#con_e").slideUp("slow");
	$("#div_level").html(data);
	$("#con_e").slideDown("slow");
}
//查看详细
function checkLevel(levelId){
	dwr.engine.setAsync(false);
	utildwr.selectlevelById(levelId,callback_selectlevelById);



}
function 	callback_selectlevelById(data){
       
	$("#update_id").html(data.levelId);
	$("#update_createdate").html(data.creataDate);
	$("#update_levelname").val(data.levelName);
	$("#update_level").val(data.level);
	$("#update_minscore").val(data.minscore);
	$("#update_returnvalue").val(data.returnValue);
 
 //赋值原有 old_levelname
 	$("#old_levelname").val(data.levelName);
	var divs=document.getElementById("hidden_show_level").innerHTML;
	if (app.indexOf('Netscape') != -1){
		TINY.box.show(divs,0,600,232,1);//火狐、Netscape
	} else if (app.indexOf('Microsoft') != -1) {
		TINY.box.show(divs,0,600,253,1);//IE
	}	
}
function update_Level(){
	//只修改名称和折返金额
	var levelId=document.getElementsByName("update_id")[1].innerHTML;
	var levelname=$("input[name='update_levelname']")[1].value;
	var level=$("input[name='update_level']")[1].value;
	var minscore=$("input[name='update_minscore']")[1].value;
	var returnvalue=$("input[name='update_returnvalue']")[1].value;
	
	//原有名称
	var old_levelname=$("#old_levelname").val();
	var c_score=/^[0-9]*[1-9][0-9]*$/;
	if(!c_score.test(level)&&level!=0){
		alert("会员等级必须是大于等于0的整数");return;
	}
	if(!c_score.test(minscore)&&minscore!=0){
		alert("升级积分必须是大于等于0的整数");return;
	}
	if(!c_score.test(returnvalue)&&returnvalue!=0){
		alert("折返金额必须是大于等于0的整数");return;
	}
	
		//名称查重
	if(levelname!=old_levelname){
		dwr.engine.setAsync(false);
		utildwr.checkLevelName(levelname,callback_checkLevelName);
		if(flag){
			alert("会员级别名称重复");
			return;
		}
	}
	dwr.engine.setAsync(false);
	utildwr.updateLevel(levelname,level,minscore,returnvalue,levelId,old_levelname,callback_updateLevel);
}
function callback_updateLevel(data){
	if(data){
		 alert("修改成功");
		 dwr.engine.setAsync(false);
		utildwr.levelOper(1,callback_levelOper);
	}else{
		alert("修改失败,请与管理员联系");
	}
}
</script>

</head>

<body>
<div id="out"></div>

<div id="container">
	<p class="page_h"><span> ${admin_name}:您好，欢迎来到瑞草生物科技！</span>请登录免费注册</p>

  	<div id="banner"><img src="images/banner_02.jpg" /></div>
    	<h4 class="list">		
           <div style="border-bottom: 1px solid rgb(230, 231, 225); " id="con_e_c" class="c_header">
				<h3 onclick="toggle_collapse('con_e', 1, 1);"><div class="one"><div>会员列表</div></div></h3>
				<div class="c_header_action">
					<p class="c_header_ctrlbtn" onclick="toggle_collapse('con_e', 1, 1);">[ 展开 ]</p>
				</div>
		   </div>
        </h4>
		<div id="con_e" class="round" >
		  <h4 class="tianjia"><a href="javascript:;" onclick="addLevel()" class="la_la">添加级别</a></h4>	  
		  <div id="div_level" class="tabb">
          		<form  name="form1" action="#" method="post" class="form_tab">
      			  <table class="mytab">
                		<tr style="background-color: #EBF2F8;">
      				  		<td class="bianhao">编号</td>
						<td class="mingcheng">名称</td>
                           <td class="jibie">级别</td>
						<td class="shengjijifen">升级积分</td>
						<td class="zhefanjine">折返金额</td>
                           <td class="chuangjianshijian">创建时间</td>
                                
                        </tr>
                        <c:if test="${!empty levelall}"> 
			           		<c:forEach items="${levelall}" var="level" varStatus="status" step="1">
								<tr class="levellist" ondblclick="checkLevel(${level.levelId})">
		      				  	<td class="bianhao">${status.index +1}</td>
								<td class="mingcheng">${level.levelName}</td>
		                        <td class="jibie">${level.level}</td>
								<td class="shengjijifen">${level.minscore}</td>
								<td class="zhefanjine">${level.returnValue}</td>
		                        <td class="chuangjianshijian">${level.creataDate}</td>
		                                
		                        </tr>		           			
			           		</c:forEach>
			        	</c:if>	
	                 </table>
             	</form>
             	<div id="fenye">
					<div style="float:left" id="tag">
						共有 ${page_level.totalCount } 条记录&nbsp;&nbsp;
						共${page_level.totalPage}页&nbsp;&nbsp;
						
					</div>
					<c:if test="${page_level.totalPage gt 1}">
						<c:if test="${page_level.page gt 1}">
							<a href="javascript:;" onclick="submitPage('order',1,'first')">返回首页</a>
							<a href="javascript:;" onclick="submitPage('order','${page_level.page-1}','pro')">上一页</a>
						</c:if>
						<c:if test="${page_level.page lt page_level.totalPage}">	
							<a href="javascript:;" onclick="submitPage('order','${page_level.page+1}','next')">下一页</a>
		
							<a href="javascript:;" onclick="submitPage('order','${page_level.totalPage}','end')">尾页</a>
						</c:if>
					</c:if>
				</div>
				<div style="text-align:left;margin: 5px 0 0 5px">
					第${page_level.page}页&nbsp;&nbsp;
				</div>	
			</div>
            	
        <div class="bot"><p></p></div>
        
        <input type="hidden" name="old_levelname" id="old_levelname" value=""/>
   </div>
   <div id="footer">Copyright © 2003-2011 Taobao.com 版权所有</div>
</div>
</body>
</html>
<div id="hidden_addlevel">
<div id="container1">
  <div id="code">
  		<h4 class="add">添加会员级别</h4>
  
  		<label>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
  		<input name="add_levelname" id="add_levelname" type="text" value="" class="tao1"/>
  </div>
    		<div id="code2">
        		<label>等&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label>
  				<input name="add_level" id="add_level" type="text" value=""  class="tao2"/>

  			</div>
  <div id="code3">
        	<label>升级积分</label>
  			<input name="add_minscore" id="add_minscore"  type="text" value=""  class="tao5"/>

  </div>
    	<div id="code4">
        	<label>折返金额</label>
  			<input name="add_returnvalue" id="add_returnvalue" type="text" value=""  class="tao6"/>

  		</div>

  	
  <div id="b_pt"> 
  		<div id="acti">
 	 			<input type="button" onclick="submit_addLevel()" value="提交" class="su"/>&nbsp;&nbsp;&nbsp;
  				<input type="reset" name="res" value="重置" class="su"/>&nbsp;&nbsp;&nbsp;
  				<input type="button" name="but" onclick="hiddenCancle()" value="取消" class="su"/>
 	 	</div>
  </div>        
</div>
</div>
<div id="hidden_show_level">
<div id="container4">
	 	<div id="din_d">
    		<h4 class="last_ding">会员级别详细信息</h4>
        	
            	<div id="d_d_xiang">
                	<table class="dingdan_biao">
                    	<tr>
                        	<td class="dan_t" colspan="4">会员级别基本信息</td>
                        </tr>  
                        <tr>
                        	<td>编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td> 
                            <td class="bianhao" id="update_id" name="update_id"></td>
                            <td>创建时间：</td> 
                            <td class="chuangjianshijian" id="update_createdate" name="update_createdate"></td>
                        </tr>
                       
                        <tr>
                        	<td>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td> 
                            <td class="mingcheng"><input name="update_levelname" id="update_levelname" type="text" value=""  class="d_d_j_fen"/>
                            </td>
                            <td>级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                            <td class="shengjijifen"><input name="update_level" id="update_level" type="text" value="" disabled  class="d_d_j_fen"/>
                             </td>
                        </tr>            
                        <tr>
                        	<td>升级积分：</td>
                            <td class="shengjijifen"><input name="update_minscore" id="update_minscore" disabled type="text" value=""  class="d_d_j_fen"/>
                            </td>	
                        	<td>折返金额：</td> 
                            <td class="zhefanjine"><input name="update_returnvalue" id="update_returnvalue"  type="text" value=""  class="d_d_j_fen"/>
                            </td>				
                        </tr> 
                  </table>

               </div>
    	   </div>	
     <div id="niuzi">
        	<input name="ti" type="button" onclick="update_Level()" value="修改" class="t_ni"/>&nbsp;&nbsp;&nbsp;&nbsp;
            <input style="display:none" type="button" name="shangcu" value="删除" class="t_ni"/>&nbsp;&nbsp;&nbsp;&nbsp;
  			<input type="button" onclick="hiddenCancle()" name="but" value="取消" class="t_ni"/>
     </div>
</div>
</div>