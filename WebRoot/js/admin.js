  var app=navigator.appName;
  var verStr=navigator.appVersion;
  var flag=false;
	//查找会员
	function member_find(){
		var member_text=$("#member_text").val();
		$("#key_member").val(member_text);
		dwr.engine.setAsync(false);
		utildwr.memberOper(member_text,1,callback_member_find);
	}
	//会员翻页
	function submitPage(table,currentPage ,statue){
		if(table=="member"){
			var member_text=$("#key_member").val();
			$("#member_text").val(member_text);
			dwr.engine.setAsync(false);
			utildwr.memberOper(member_text,currentPage,callback_member_find);
		}else if(table=="order"){
			//查找条件
			var order_text=$("#order_text").val();
			//订单状态
			var orderStatue=$("#orderStatue").val();
			$("#key_order").val(order_text);
			dwr.engine.setAsync(false);
			utildwr.orderOper(order_text,orderStatue,currentPage,"first",callback_order_find);
		}else if(table=="message"){
			var keyword="";
			dwr.engine.setAsync(false);
			utildwr.messageOper(keyword,currentPage,callback_message_find);
			
		}
		
	}
	//留言操作
	function callback_message_find(data){
		$("#list_message").slideUp("slow");
		$("#div_message").html(data);
		$("#list_message").slideDown("slow");
	}
	function callback_member_find(data){
				$("#list_member").slideUp("slow");
		$("#div_member").html(data);
		$("#list_member").slideDown("slow");
	}
	//订单操作
	function order_find(){
		//查找条件
		var order_text=$("#order_text").val();
		//订单状态
		var orderStatue=$("#orderStatue").val();
		$("#key_order").val(order_text);
		dwr.engine.setAsync(false);
		utildwr.orderOper(order_text,orderStatue,1,"first",callback_order_find);
	}
	function selectOrderByParam(orderStatue){
		//find条件 赋值
		var order_text=$("#key_order").val();
		$("#order_text").val(order_text);
		/*if("all"==orderStatue){
			$("#key_order").val("");
			$("#order_text").val("");
		}*/
		//状态赋值
		$("#"+$("#orderStatue").val())[0].className="orderStatue";
		$("#"+orderStatue)[0].className="selectdA";
		$("#orderStatue").val(orderStatue);
		//dwr
		dwr.engine.setAsync(false);
		utildwr.orderOper(order_text,orderStatue,1,"first",callback_order_find);
		
	}
	function callback_order_find(data){
		$("#list_order").slideUp("slow");
		$("#div_order").html(data);
		$("#list_order").slideDown("slow");
	}

	//添加留言
	function addMessage(){
		var divs=document.getElementById("hidden_addmessage").innerHTML;
		if (app.indexOf('Netscape') != -1){
			TINY.box.show(divs,0,400,240,1);//火狐、Netscape
		} else if (app.indexOf('Microsoft') != -1) {
			TINY.box.show(divs,0,400,220,1);//IE
		}
	}
	function hidden_add_message(){
		var sender=$("input[name='hidden_add_sender']")[1].value;
		var content=document.getElementsByName("hidden_add_content")[1].value;
		if(sender=="" || content==""){
			alert("请填写发送人或信息内容");
		}
		//验证发送人是否存在
		dwr.engine.setAsync(false);
		utildwr.checkname(sender,callback_checkname);
		if(!flag){
			flag="false";alert("不存在的发送人");return;
		}else{
			flag="false";
			var taker=$("#admin_name").val();
			dwr.engine.setAsync(false);
			utildwr.hidden_add_message(sender,content,taker,callback_hidden_add_message);
		}
	}
	function callback_checkname(data){
		flag=data;
	}
	function callback_hidden_add_message(data){
		if(data){
			alert("添加成功");
			var keyword="";
			dwr.engine.setAsync(false);
			utildwr.messageOper(keyword,1,callback_message_find);
		}else{
			alert("添加失败，请与管理员联系");
		}
	}
	//添加订单
	function addOrder(){
		var divs=document.getElementById("hidden_addorder").innerHTML;
		if (app.indexOf('Netscape') != -1){
			TINY.box.show(divs,0,400,338,1);//火狐、Netscape
		} else if (app.indexOf('Microsoft') != -1) {
			TINY.box.show(divs,0,400,318,1);//IE
		}
	}
	function hidden_addOrder(){
		//验证
		var taobaoCard=$("input[name='hidden_order_taobaocard']")[1].value;
		var username=$("input[name='hidden_order_username']")[1].value;
		var score=$("input[name='hidden_order_score']")[1].value;
		var statue=document.getElementsByName("hidden_order_statue")[1].value;
		var content=document.getElementsByName("hidden_order_content")[1].value;
		var oper_name=$("#admin_name").val();
		if(taobaoCard=="" ||username=="" || score==""){
			alert("请保证数据的完整性");
			return;
		}
		var c_score=/^[0-9]*[1-9][0-9]*$/;
		if(!c_score.test(score)&&score!=0){
			alert("积分必须是大于等于0的整数");return;
		}
		//验证订单号是否重复
		dwr.engine.setAsync(false);
		utildwr.checkTaoBaoCard(taobaoCard,callback_checkname);
		if(flag){
			alert("重复的订单号");flag=false;return;
		}
		//验证会员是否存在
		dwr.engine.setAsync(false);
		utildwr.checkname(username,callback_checkname);
		if(!flag){flag=false;alert("用户名称不存在");return;}
		//验证通过--添加订单
		utildwr.hidden_addOrder(taobaoCard,username,score,statue,content,oper_name,callback_checkname);
		if(flag){			
			$("#"+$("#orderStatue").val())[0].className="orderStatue";
			$("#all")[0].className="selectdA";
			$("#order_text").val("");
			//订单状态
			$("#orderStatue").val("all");
			$("#key_order").val("");
			dwr.engine.setAsync(false);
			utildwr.orderOper("","all",1,"first",callback_order_find);
			alert("添加成功");
		}else{
			alert("添加失败");
		}
		flag=false;
		
	}
	//双击查看详细信息
	//会员
	function checkMember(memberId){
		//根据ID查找详细信息
		if(memberId){
			dwr.engine.setAsync(false);
			utildwr.findMemberById(memberId,callback_findMemberById);
		}
	}
	function callback_findMemberById(data){
		//赋值
		$("#show_username").html(data[0].user_name);
		$("#show_userid").html(data[0].user_id);
		$("#show_birthday").html(data[0].birthday);
		$("#show_sex").html(data[0].gender);
		$("#show_duty").html(data[0].occupation);
		$("#show_telphone").html(data[0].telphone);
		$("#show_email").html(data[0].email);
		$("#show_postcode").html(data[0].postcode);
		$("#show_je").html(data[0].returnValue);
		$("#show_usually").html(data[0].usuallyMethod);
		$("#show_adress").html(data[0].adress);
		$("#show_score").html(data[0].score);
		$("#show_dwrlevel").html(data[1]);
		//弹出详细信息窗口
		var divs=document.getElementById("hidden_showmember").innerHTML;
		if (app.indexOf('Netscape') != -1){
			TINY.box.show(divs,0,400,372,1);//火狐、Netscape
		} else if (app.indexOf('Microsoft') != -1) {
			TINY.box.show(divs,0,400,387,1);//IE
		}
	}
	function update_member(){
		//修改提交
		var levelname=document.getElementsByName("show_dwrlevel")[3].value
		var userid=document.getElementsByName("show_userid")[1].innerHTML;
		dwr.engine.setAsync(false);
		utildwr.updateMember(levelname,userid,callback_updateMember);
	}
	function callback_updateMember(data){
		//修改成功
		if(data){
			alert("修改成功");
			$("#member_text").val("");
			$("#key_member").val("");
			dwr.engine.setAsync(false);
			utildwr.memberOper("",1,callback_member_find);
		}else{
			alert("修改失败,请与管理员联系");
		}
	}
	//留言
	function checkMessage(messageId){
		if(messageId){
			dwr.engine.setAsync(false);
			utildwr.findMessageById(messageId,callback_findMessageById);
		}
	}
	function callback_findMessageById(data){
		document.getElementById("show_content").innerHTML=data[0].content;
		$("#show_sender").val(data[0].sender);
		$("#show_senddate").val(data[0].senddate);
		//弹出详细信息窗口
		var divs=document.getElementById("hidden_showmessage").innerHTML;
		if (app.indexOf('Netscape') != -1){
			TINY.box.show(divs,0,800,332,1);//火狐、Netscape
		} else if (app.indexOf('Microsoft') != -1) {
			TINY.box.show(divs,0,800,367,1);//IE
		}		
	}
	function show_huifu(){
		var content=document.getElementsByName("show_content_huifu")[1].value;
		var sender=$("#admin_name").val();
		var taker=$("input[name='show_sender']")[1].value;
		
		dwr.engine.setAsync(false);
		utildwr.addMessage(sender,content,taker,callback_addMessage);
		
	}
	function callback_addMessage(data){
		if(data){
			alert("添加成功");
			var keyword="";
			dwr.engine.setAsync(false);
			utildwr.messageOper(keyword,1,callback_message_find);
		}else{
			alert("添加失败，请与管理员联系");
		}
	}
	//订单明细
	function checkOrder(orderId){
		//根据ID查找详细
		if(orderId){
			dwr.engine.setAsync(false);
			utildwr.findOrderById(orderId,callback_findOrderById);
		}
	}
	function callback_findOrderById(data){
		//回填数据--窗口显示    
		$("#show_order_username").html(data[0].userName);
		$("#show_order_taobao").html(data[0].taobaoCrad);
		$("#show_order_createdate").html(data[0].createDate);
		$("#show_order_operdate").html(data[0].operDate);
		$("#show_order_score").val(data[0].score);
		$("#show_order_beizhu").val(data[0].beizhu);
		$("#dwr_statue").html(data[1]);
		
		//给原有积分赋值
		$("#show_oldscore").val(data[0].score);
				//弹出详细信息窗口
		var divs=document.getElementById("hidden_showorder").innerHTML;
		if (app.indexOf('Netscape') != -1){
			TINY.box.show(divs,0,600,312,1);//火狐、Netscape
		} else if (app.indexOf('Microsoft') != -1) {
			TINY.box.show(divs,0,600,345,1);//IE
		}
	}
	function update_order(){
		var c_score=/^[0-9]*[1-9][0-9]*$/;
		//积分
		var score=$("input[name='show_order_score']")[1].value;
		if(!c_score.test(score)&&score!=0){
			alert("积分必须是大于等于0的整数");return;
		}debugger;
		//状态
		var statue=document.getElementsByName("show_statue")[1].value
		//备注
		var beizhu=document.getElementsByName("show_order_beizhu")[1].value;
		//操作员
		var opername=$("#admin_name").val();
		//订单号
		var taobao=document.getElementsByName("show_order_taobao")[1].innerHTML
		//会员名称
		var username=document.getElementsByName("show_order_username")[1].innerHTML
		//积分的差值
		var oldscore=$("#show_oldscore").val();
		var score_chazhi=score-oldscore;
		//修改
		dwr.engine.setAsync(false);
		utildwr.updateOrder(score,statue,beizhu,score_chazhi,opername,taobao,username,callback_updateOrder);
	}
	function callback_updateOrder(data){
		if(data){
			$("#"+$("#orderStatue").val())[0].className="orderStatue";
			$("#all")[0].className="selectdA";
			$("#order_text").val("");
			//订单状态
			$("#orderStatue").val("all");
			$("#key_order").val("");
			dwr.engine.setAsync(false);
			utildwr.orderOper("","all",1,"first",callback_order_find);
			alert("修改成功");
		}else{
			alert("修改失败");
		}
	}