<%@ page language="java" import="java.util.*,com.work.model.*" pageEncoding="utf-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>瑞草生物科技（管理员管理）</title>

<link rel="stylesheet" type="text/css" href="圆角框.css" />
<style type="text/css" >
<!--
body, ul, li, dl, dd, p, h1, h2, h3, h4, h5, h6, form, fieldset {
    margin: 0;
    padding: 0;
}
body,html{margin:0px auto;
           padding:0px;
		   background-color:#FCFCFC;
		   font-family:Arial, Helvetica, sans-serif;
		   font-size:12px/1.5;
		   text-align:center;
		  	background:url(images/bg_03.jpg) repeat center 0px;

		   }
p{		   background:url(images/reg_02.gif) repeat-x top;
				font-family:Arial, Helvetica, sans-serif;
                font-size:10px;
				color:#929292;
				padding-top:6px;
				padding-bottom:5px;
				padding-left:190px;
				margin-top:0px;
				text-align:left;
				margin-left:auto;
				margin-right:auto;
				margin-bottom:0px;
				height:30px;
			     }


p span{font-weight:bold;
        color:#000000;
		font-size:12px;
		}
#container{ position:relative;
			margin-left:auto;
            margin-right:auto;
			width:930px;
			background:url(images/bg_03.jpg) repeat center;

			}
#banner{margin-left:auto;
          margin-right:auto;
		  	
		  }
.form_tab{margin:0px;
			padding:0px;

			}
 .form_tab .mytab{
		margin:0px auto;
		width:917px;
		border-collapse:collapse;
		border-left:none;
		border-right:none;
		
		

		}
.tabb .form_tab .mytab td{border:1px #e4e4e4 solid;
				vertical-align:middle;
				text-align:center;
				width:83px;
				font-family:Arial, Helvetica, sans-serif;
				font-size:12px;
				height:30px;
				
				}
.tabb .form_tab .mytab td1{border-left:none;}
.tabb .form_tab .mytab td2{border-right:none;}
.list{font-size:12px;
		font-family:Arial, Helvetica, sans-serif;
		color:#D4BF00;
		text-align:left;
		margin-bottom:0px;
		padding-bottom:0px;
		
		}
.find{margin:0px 10px -3px 0px;
		font-family:Arial, Helvetica, sans-serif;
		font-size:12px;
		line-height:17px;
		border-color:#e4e4e4;
		
		}
.find2{margin:0px 10px -3px 0px;
		font-family:Arial, Helvetica, sans-serif;
		font-size:12px;
		line-height:17px;
		border-color:#e4e4e4;
		text-align:left;
		
		}

h4.list2{ text-align:left;
		font-family:Arial, Helvetica, sans-serif;
		font-size:12px;
		padding-left:50px;
		}
.wod{color:#d4bf00;}	
				
#conte{ position:relative;
		margin:0px auto;
		width:930px;}
	
#con_a{ 
	/*width:465px;
	margin:0px 465px 0px 0px;*/
	}
						
#con_b{ position:relative;
		margin:-500px 0px 0px 465px;
		width:465px;}
		
.last_tab{width:452px;
		border:1px #e4e4e4 solid;
        border-collapse:collapse;
		margin:0px;
		border-left:none;
		border-right:none;
		}
.last_tab td3{border-left:none;}
.last_tab td{ border:1px #e4e4e4 solid;
				height:30px;
				width:225px;
				font-family:Arial, Helvetica, sans-serif;
				font-size:12px;
				text-align:center;
				vertical-align:middle;
				}
.last_form{width:465px;
			padding-left:5px;
			
		}
.closenode {
   /* background: url("images/dashline.gif") repeat-x scroll 0 10px transparent;*/
}
.c_header {
   
    overflow: hidden;
}
.c_header h2, .c_header h3 {
    background: none repeat scroll 0 0 #FFFFFF;
    cursor: pointer;
    float: left;
    font-size: 14px;
    padding-right: 15px;
}
.c_header h3 {
   /* background: url("images/arrow_down_big.gif") no-repeat scroll 100% 5px #FFFFFF;*/
    color: #CC9900;
}
.closenode h3 {
    /*background-image: url("images/arrow_right_big.gif");*/
}
.c_header_action {
    float: right;
}
.c_header .c_header_ctrlbtn {
    display: none;
}
.closenode .c_header_ctrlbtn {
    background-color: #FFFFFF;
    color: #666666;
    cursor: pointer;
    display: block;
}		
.one {
    background: url("images/tag1.jpg");
    background-repeat: no-repeat;
    width:120px;
	font-size:12px;
	height:22px;

}
.one div{
	margin:1px 0 0 10px;
	line-height:200%;
}
--></style>

</head>

<body>
		<p><span>您好，欢迎来到瑞草生物科技！</span>请登录免费注册</p>
<div id="container">
	<div id="banner"><img src="images/banner_02.jpg" /></div>
    	<h4 class="list">
    		<div class="c_header" id="list_announce_c" style=";border-bottom:1px dashed #E6E7E1">
				<h3 onclick="toggle_collapse('list_announce', 1, 1);" ><div class="one" ><div>会员列表</div></div></h3>
				<div class="c_header_action">
					<p onclick="toggle_collapse('list_announce', 1, 1);" class="c_header_ctrlbtn">[ 展开 ]</p>
				</div>
			</div>
    	</h4>
			<div id="con_e" class="round">
				<h4><input name="textt" type="text" value=""  class="find"/>杳找</h4>
    				<div class="tabb"><form  name="form1" action="#" method="post" class="form_tab">
                    	<table class="mytab"><tr><td class="td1">姓名</td>
                    	<td>生日</td><td>性别</td><td>邮编</td><td>邮寄地址</td><td>公司职位</td><td>电话</td><td>电子邮箱</td><td>积分</td><td>会员等级</td><td class="td2">常用联系&nbsp;方式</td></tr></table></form>
                        			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;
			border-collapse:collapse;

                    	
              </div>
           			<div class="bot">
            			<p>这是页角版权信息。</p>
            	</div>
  </div>

    	<h4 class="list">订单列表</h4>
			<div id="con_e" class="round">
				<h4 class="list2">杳找&nbsp;&nbsp;<input name="textt" type="text" value=""  class="find2"/>
				  <span class="wod">全部&nbsp;&nbsp;&nbsp;&nbsp;未处理订单&nbsp;&nbsp;&nbsp;&nbsp;已处理订单&nbsp;&nbsp;&nbsp;&nbsp;已完结订单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添加订单</span> </h4>
                <div class="tabb"><form  name="form1" action="#" method="post" class="form_tab">
                    	<table class="mytab"><tr><td>编号</td>
                    	<td>淘宝订单号</td><td>订单积分</td><td>订单日期</td><td>操作员</td><td>操作时间</td><td>状态</td><td>备注</td></tr></table></form>
              </div>
           			<div class="bot">
            			<p>这是页角版权信息。</p>
            	</div>
  </div>
  
  <!-- 留言 -->
  	<h4 class="list">留言列表</h4>
    <div id="cente">
		 <div id="con_a" class="round">
		 <h4></h4>
   				<div class="tabb" style="min-height:350px;margin:0;padding:0">
   				   <div style="float:left;margin-left:20px;width:45%">
                   		<img src="images/pt-010.jpg" height="350px"/>
            	   </div>
            	   <div  style="float:left;margin-left:20px">
                  	<table class="last_tab">
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		<tr><td class="td3">发送人</td><td class="td3">留言内容</td><td class="td4">留言时间</td></tr>
                  		
                  	</table>
           		 </div>
            	</div>
          		<div class="bot">
           		<p style="margin:0;padding:0"></p>
           	</div>
	    </div>
   	</div>	
</div>
</body>
</html>