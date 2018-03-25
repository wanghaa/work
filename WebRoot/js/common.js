/*
收缩折起 效果
*/
function toggle_collapse(objname, noimg, complex, lang) {
	var obj = jQuery("#"+objname)[0];
	if(obj) {
		if(obj.style.display == '' || obj.style.display == 'block' || obj.style.display == 'inline-block'){
			$("#"+objname).slideUp("slow");
			
		}else{
			$("#"+objname).slideDown("slow");
			
		}
	}
	if(complex) {
		var objc = jQuery("#"+objname + '_c')[0];
		objc.className = objc.className == 'c_header' ? 'c_header closenode' : 'c_header';
	}
}
//ȡ��
function hiddenCancle(){
	TINY.box.hide();
}