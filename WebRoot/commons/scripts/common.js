/**
 * 清空查询条件
 * 如个别隐藏的input需要清空参照以下方式添加
 * $("table[name='tjClear'] :input[name='service_sys']").val("");
 */
function clearTj(){ 
	$("table[name='tjClear'] :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");
	$("table[name='tjClear'] :hidden[name='camid']").val("");
}
/**
 * (多个查询条件赋值)
 * @param inputName
 * @param number
 * @param substrLength  要截取的字符长度(可加可不加，不加默认等于20)
 * 如：str="service_code&&1||service_sys&&3&&20"
 */
function dbClickCx(str){
	var strArray;
	if(str!=""&&str!=undefined&&str!=null){
		strArray=str.split("||");
	}
	if(strArray.length>0){
		$(".datagrid tr:not(tr:first) ").dblclick(function(){
		for(var i = 0; i < strArray.length; i++){
	        var strSingleArray=strArray[i].split("&&");
		        if(strSingleArray.length==3){
			            $("#" + strSingleArray[0]).val($.trim(this.children[strSingleArray[1]].innerText).substr(0,strSingleArray[2]));
		        }else if(strSingleArray.length==2){
			            $("#" + strSingleArray[0]).val($.trim(this.children[strSingleArray[1]].innerText).substr(0,20));
		        }
		}
		document.forms[0].submit();
  	  });
	}
}
