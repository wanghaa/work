 var app=navigator.appName;
  var verStr=navigator.appVersion;
  var flag=false;
  
window.onload=function(){
if(!NiftyCheck())
    return;
	Rounded("div#threadlist","top","#fff","#EBF2F8","border #EBF2F8");
}

	//翻页
	/*
	*userId: 用户名 currentPage 当前页 type 页状态 statue 订单状态
	*/
	function submitPage1(tablename,currentPage,type){
		//var statue=$("#orderStatue")[0].value;
		dwr.engine.setAsync(false);
		
		utildwr.submitPage(tablename,currentPage,"",callback_submitPage);
	}
	//订单状态查找
	function selectOrderByParam(userId,type){
		$("#"+document.getElementById("orderStatue").value)[0].className="no_selectedA";
		document.getElementById("orderStatue").value=type;
		/*var ot=document.getElementsByName("orderType");
		for(var i=0;i<ot.length;i++){
			ot.className="";
		}*/
		$("#"+type)[0].className='selectedA';
		submitPage1(userId,1,'first');
	}
	function callback_submitPage(data){
		$("#threadlist").slideUp("slow");
		document.getElementById("threadlist").innerHTML=data;
		$("#threadlist").slideDown("slow");
	}
	function dateAdd(y,m,d,n)//增加天数
	{
	   var d = new Date(y,m,d);
	   d.setDate(d.getDate()+n);
	   return d;
	}	
	function selectMessageByParam(name,limit,type,obj){
		if(limit>1)name="";
		var nowdt=new Date();
		var date1="";
		var date2="";
		var selectd=$("#diaryStatue").val();
		document.getElementById(selectd).className="no_selectedA";
		var month,day;
		switch(type){
			case 1:
				
				break
			case 2:
			    month=getDate0((nowdt.getMonth()+1));
			 	day=getDate0(nowdt.getDate());
				date1=nowdt.getFullYear()+"-"+month+"-"+day ;
				break
			case 3:
			 	var d = dateAdd(nowdt.getFullYear(),nowdt.getMonth(),nowdt.getDate(),-1);
			 	month=getDate0((d.getMonth()+1));
			 	day=getDate0(d.getDate());
				date1=d.getFullYear()+"-"+month+"-"+day;
				break
			case 4:
				var num = (0-nowdt.getDay());
	            var d = dateAdd(nowdt.getFullYear(),nowdt.getMonth(),nowdt.getDate(),num);
	            month=getDate0((d.getMonth()+1));
			 	day=getDate0(d.getDate());
	            date1 = d.getFullYear()+"-"+month+"-"+day;
	            num = (6-nowdt.getDay());
	            d = dateAdd(nowdt.getFullYear(),nowdt.getMonth(),nowdt.getDate(),num);
	            month=getDate0((d.getMonth()+1));
			 	day=getDate0(d.getDate());
	            date2 = d.getFullYear()+"-"+month+"-"+day;
	            date1=date1+";"+date2; 
				break
		}
		document.getElementById(obj.id).className="selectedA";
		document.getElementById("diaryStatue").value=obj.id;
		$("#param_date").val(date1);
		dwr.engine.setAsync(false);
		utildwr.messageOper_user(name,date1,1,callback_message_find);
	}
	function getDate0(number){
		if(parseInt(number)<10){
			number="0"+number;
		}
		return number;
	}
	//添加订单
	function showDiv(div){
		var divs=document.getElementById("hiddendiv").innerHTML;
		TINY.box.show(divs,0,300,200,1);
	}
	function taobaoSubmit(){
		var userId=$("#userId").val();
		var taobaoCard=$("input[name='taobao']")[1].value;
		if(taobaoCard==""){
			return;
		}
		dwr.engine.setAsync(false);

		utildwr.addTaoBao(userId,taobaoCard,callback_addTaoBao);
	}
	function callback_addTaoBao(data){
		if(data[0]==false){
			alert("订单号重复,请联系管理员");
		}else{
			if(data[1]==true){
				alert("添加成功");
				//订单状态选为全部
				$("#"+document.getElementById("orderStatue").value)[0].className="no_selectedA";
				$("orderStatue").val("all");
				$("#all")[0].className='selectedA';
				document.getElementById("threadlist").innerHTML=data[2];
			}else{
				alert("添加失败，请与管理员联系");
			}
		}
		
	}
	//取消
	function taobaoCancle(){
		TINY.box.hide();
	}
	function changePass(){
	var obj = jQuery("#changpass")[0];
		if(obj.style.display == '' || obj.style.display == 'block'){
			$("#changpass").slideUp("slow");}else{
			$("#changpass").slideDown("slow");
		}
	}
	function begin_pass(userId){
		var userId=$("#userId").val();
		var value=$("#newpass").val();
		var value2=$("#newpass2").val();
		var pattern = /[A-Za-z][0-9]|[0-9][A-Za-z]/i;//数字字母组合
		if(value.length<6 || value.length>9 ||!pattern.test(value)){
			alert("密码必须是6-9位的数字和字母");
			return;
		}
		if(value!=value2){
			alert("两次密码不一致");
			return;
		}
		dwr.engine.setAsync(false);

		utildwr.changePass(userId,value,callback_changePass);
	}
	function callback_changePass(data){
		if(data[0]=="yes"){
			alert("修改成功");
			$("#o_pass").html(data[1]);
			$("#newpass").val("");
			$("#newpass2").val("");
			$("#changpass").slideUp("slow");

		}else{
			alert("修改密码失败，请与管理员联系");
		}
	}
	function submitPage(table,currentPage,statue){
		var param_userName=$("#userName").val();
		var param_date=$("#param_date").val();
		dwr.engine.setAsync(false);
		utildwr.messageOper_user(param_userName,param_date,currentPage,callback_message_find);
	}
	function find_userName(username){
		$("#param_userName").val(username);
		dwr.engine.setAsync(false);
		utildwr.messageOper_user(username,"",1,callback_message_find);
	}
	function find_date(date){
		var username="";
		if($("#limit").val()<=1)username=$("#userName").val();
		$("#param_date").val(date);
		dwr.engine.setAsync(false);
		utildwr.messageOper_user(username,date,1,callback_message_find);
		
	}
	function callback_message_find(data){
		$("#luiyan").slideUp("slow");
		$("#luiyan").html(data);
		
		$("#luiyan").slideDown("slow");
		
	}
	//回复留言
	function huifu_message(taker){
	$("#huifu_taker").val(taker);
		var divs=document.getElementById("hidden_addmessage").innerHTML;
		if (app.indexOf('Netscape') != -1){
			TINY.box.show(divs,0,400,215,1);//火狐、Netscape
		} else if (app.indexOf('Microsoft') != -1) {
			TINY.box.show(divs,0,400,191,1);//IE
		}
	}
	function hidden_huifu_message(){
		var taker=$("#huifu_taker").val();
		var sender=$("#userName").val();
		var content=document.getElementsByName("hidden_add_content")[1].value;
		if(content==""){
			alert("请填写留言信息");return;
		}
		dwr.engine.setAsync(false);
		utildwr.hidden_add_message(sender,content,taker,callback_hidden_huifu_message);
	}
	function callback_hidden_huifu_message(data){
		if(data){
			var limit=$("#limit").val();
			var username="";
			if(limit<=1)username=$("#userName").val();
			
			dwr.engine.setAsync(false);
			utildwr.messageOper_user(username,"",1,callback_message_find);
		}else{
			alert("添加失败，请与管理员联系");
		}
	}
	function send_messge(){
		var sender=$("#userName").val();
		var content=CKEDITOR.instances.send_content.getData();
		var taker=$("#brithday").val();
		if(content=="" || content=="#工作内容#"){
			alert("请填写工作日志");return;
		}
		dwr.engine.setAsync(false);
		utildwr.hidden_add_message(sender,content,taker,callback_hidden_huifu_message);
	}
	function changeHead(){
		var divs=$("#user_head").html();
		if (app.indexOf('Netscape') != -1){
			TINY.box.show(divs,0,400,215,1);//火狐、Netscape
		} else if (app.indexOf('Microsoft') != -1) {
			TINY.box.show(divs,0,420,200,1);//IE
		}
	}
	function js_changeHead(obj){
		dwr.engine.setAsync(false);
		utildwr.updateHead(obj,$("#userId").val(),callback_js_changeHead);
		$("#head").attr("src",obj)
		taobaoCancle();
		
	}
	function callback_js_changeHead(data){
	}
	function deleteDiaryById(id){
		dwr.engine.setAsync(false);
		utildwr.deleteDiaryById(id,callback_deleteDiaryById);
		$("#li_"+id).remove();     
		
	}
	function callback_deleteDiaryById(data){
		
	}
	function foward_topic(id){
		window.location="TopicServlet?user_id="+id;   
	} 