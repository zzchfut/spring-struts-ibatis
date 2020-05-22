//提交表单时，对form表单做值生成处理
function toHtml(){
	$("input").each(function(){
    	this.setAttribute("value", $(this).val());
	});
	$("textarea").each(function(){
		this.innerHTML=$(this).val();
	});
	$("option").each(function(){
		if(this.selected)
		this.setAttribute('selected', 'selected');
	});
	$(":checkbox").each(function(){
		if(this.checked)
		this.setAttribute('checked', 'checked');
	});
	$(":radio").each(function(){
		if(this.checked)
		this.setAttribute('checked', 'checked');
	});
}
//设置表单中控件不可控
function toDisabled(){
	$("#bodycontent tr:not([showflag]) input").each(function(){
		$(this).attr("disabled","disabled");
	});
	$("#bodycontent tr:not([showflag]) textarea").each(function(){
		$(this).attr("disabled","disabled");
	});
	$("#bodycontent tr:not([showflag]) select").each(function(){
		$(this).attr("disabled","disabled");
	});
	$("#bodycontent tr:not([showflag]) :checkbox").each(function(){
		$(this).attr("disabled","disabled");
	});
	$("#bodycontent tr:not([showflag]) :radio").each(function(){
		$(this).attr("disabled","disabled");
	});
}

//设置表单中控件可控
function removeDisabled(){
	$("#bodycontent input").each(function(){
		$(this).removeAttr("disabled");;
	});
	$("#bodycontent textarea").each(function(){
		$(this).removeAttr("disabled");;
	});
	$("#bodycontent select").each(function(){
		$(this).removeAttr("disabled");;
	});
	$("#bodycontent :checkbox").each(function(){
		$(this).removeAttr("disabled");;
	});
	$("#bodycontent :radio").each(function(){
		$(this).removeAttr("disabled");;
	});
}

//提交审批表初始化表单中html
function editInit(){
//	if($("#id").val()!=""){
//		$("#bodycontent").html($("#apply_content").val());
//	}
	$("#apply_name").blur(function(){
		checkApplyName();
	});
	//提交
	$("#btn_submit").click(function(){
		if(Validator.Validate(this.form, 3)){
			checkApplyName();
            if($("#hidflag").val()=="1"){
	            $("#btn_submit").attr("value", "正在提交...").attr("disabled", "true");
	            $("#btn_reset").attr("disabled", "true");
	            deptTreeSelUser();
            }
		}
	});
}

//审批审批表初始化表单中html
function approvalInit(){
	$("#reject_reason").blur(function(){
		var area=$(this);
		var max=100; //获取maxlength的值
		if(area.val().length>max){ //textarea的文本长度大于maxlength
		area.val(area.val().substr(0,max)); //截断textarea的文本重新赋值
		}
	});
	//提取申请表内容
//	$("#bodycontent").html($("#apply_content").val());
	//锁定输入框
	toDisabled();
	//计算合并列
	mergercells();
	
	//提交
	$("#btn_submit").click(function(){
		if(Validator.Validate(this.form, 3)){
	        $("#btn_submit").attr("value", "正在提交...").attr("disabled", "true");
	        $("#btn_reset").attr("disabled", "true");
	        deptTreeSelUser();
		}
	});

}

//驳回后重新提交
function toEdit(){
	$("#method").val("edit");
	var url=$("form").attr("action");
	var str=url.split("/")[1];
	$("form").attr("action","/"+str+"/admin/PtWorkFlow.do");
	$("form").submit();
}
//部门树选择用户
function deptTreeSelUser(){
	//如果为审核最终节点或者驳回则不需要做下级人员推送
	if($("#isfinished").val()=="1"||$("#is_reject").val()=="1"){
		toHtml();
		removeDisabled();
		$("#apply_content").val($("#bodycontent").html());
		$("form").submit();
	}
	else{//否则做下级人员推送
		var rtnVal=window.showModalDialog("Selector.do?method=deptTreeForUserApproveList&approval_set="+$("#hidapproval").val()+"&ts="+new Date().getTime(),true,
                                 "dialogWidth:900px;dialogHeight:600px;center:yes;resizable:yes;scroll:no");
		//获得人员ID后执行的方法
	    if(null != rtnVal&&rtnVal.ids!=""){
	    	$("#set_id").val(rtnVal.ids);
	    	toHtml();
	    	removeDisabled();//提交前做disabled属性移除操作，否则在某些需要提取包含disabled属性的标签时，form表单无法提取相应标签
		    $("#apply_content").val($("#bodycontent").html());
			$("form").submit();
	    }
	    else{
	    	$("#btn_submit").attr("value", "提 交").removeAttr("disabled");
	    	$("#btn_reset").removeAttr("disabled");
	    }
	}
}

//验证申请表名唯一性
function checkApplyName(){
	var apply_name=$("#apply_name").val();
	if(apply_name.length>0){
		$.ajax({
			type : "POST",
			url : "PtWorkFlow.do",
			data: {method: "checkApplyName" , id : $("#id").val(),apply_name:apply_name,flow_id:$("#flow_id").val()},
			dataType : "json",
			error : function() {
				$("#hidflag").val("0");
				return false;
			},
			success : function(oper) {
				if (oper.result){
					$("#spanapply_name").remove();
					$("#hidflag").val("1");
					return true;
				}
				else{
					if($("#spanapply_name").length<=0){
						$("#apply_name").after("<span id=\"spanapply_name\" style=\"color:red;\">该申请名称已存在</span>");
					}
					$("#hidflag").val("0");
					return false;
				}
			}
		});
	}
}
//通过驳回按钮控制
function chktxtarea(id){
	var isfinished=$("#isfinished").val();
	if(id==0){//通过
		$("#reject_reason").val("");
		$("#trreject").hide();
		$("#reject_reason").removeAttr("dataType").removeAttr("msg");
		$("#is_reject").val("0");
		$("#isfinished").val(isfinished);
	}
	if(id==1){//驳回
		$("#trreject").show();
		$("#reject_reason").attr("dataType" , "Require").attr("msg" , "驳回原因不可为空");
		$("#is_reject").val("1");
		$("#isfinished").val("0");
	}
}
//根据<tr>属性showflag做权限设置; 例如：showflag设置为'1,2'，则在1级和2级审批节点，该模块为可控制，其他级别为不可控
function showFlag(){
	var flag=false;
	if($("#isapproval").length==0){//提交审批表状态
		flag=true;
	}
	else{
		if($("#isapproval").val()=="1"){//审批状态
			flag=true;
		}
	}
	if(flag==true){//读写权限设置只在提交申请和审批状态下，查看时权限为只读
		//获取显示
		$("tr[showflag]").each(function(){
			var showflag=$(this).attr("showflag");
			var flagcontain=","+showflag+",";
			var thislevel=","+$("#approve_status").val()+",";
			if(flagcontain.indexOf(thislevel) >= 0){//说明当前审批级别在设置显示级别中
				$("tr[showflag='"+showflag+"'] input").each(function(){
					$(this).removeAttr("disabled");
				});
				$("tr[showflag='"+showflag+"'] textarea").each(function(){
					$(this).removeAttr("disabled");
				});
				$("tr[showflag='"+showflag+"'] select").each(function(){
					$(this).removeAttr("disabled");
				});
				$("tr[showflag='"+showflag+"'] :checkbox").each(function(){
					$(this).removeAttr("disabled");
				});
				$("tr[showflag='"+showflag+"'] :radio").each(function(){
					$(this).removeAttr("disabled");
				});
			}
			else{
				$("tr[showflag='"+showflag+"'] input").each(function(){
					$(this).attr("disabled","disabled");
				});
				$("tr[showflag='"+showflag+"'] textarea").each(function(){
					$(this).attr("disabled","disabled");
				});
				$("tr[showflag='"+showflag+"'] select").each(function(){
					$(this).attr("disabled","disabled");
				});
				$("tr[showflag='"+showflag+"'] :checkbox").each(function(){
					$(this).attr("disabled","disabled");
				});
				$("tr[showflag='"+showflag+"'] :radio").each(function(){
					$(this).attr("disabled","disabled");
				});
				flag=false;
			}
		});
	}
	else{
		$("tr[showflag] input").each(function(){
			$(this).attr("disabled","disabled");
		});
		$("tr[showflag] textarea").each(function(){
			$(this).attr("disabled","disabled");
		});
		$("tr[showflag] select").each(function(){
			$(this).attr("disabled","disabled");
		});
		$("tr[showflag] :checkbox").each(function(){
			$(this).attr("disabled","disabled");
		});
		$("tr[showflag] :radio").each(function(){
			$(this).attr("disabled","disabled");
		});
	}
	return flag;
}
//计算表单最大列数，不同表单列数不同，审批行第二列做合并计算
function mergercells(){
	var rows=$("#bodycontent").children("tr").length;
	var cells=0;
	for(var i=0;i<rows;i++){
		var cell = document.getElementById("bodycontent").rows.item(i).cells.length; 
		cells=cells<cell?cell:cells;
	}
	if(cells-2>0){
		cells=cells-1;
		$("tr td[name='cols']").each(function(){
			$(this).attr("colspan",cells);
		});
	}
}

//部门树选择用户
function deptTreeGroupUser(namesID,idsID){
 var rtnVal=window.showModalDialog("Selector.do?method=deptTree&ts="+new Date().getTime(),true,
                                 "dialogWidth:900px;dialogHeight:600px;center:yes;resizable:yes;scroll:no");
    if(null != rtnVal){
    	if(idsID=='caseadminstratorid'){
    		if(rtnVal.ids.indexOf(',')>0){
                alert('只能选择一位负责人！');
                return;
          	}
    	}
    	$("#"+namesID).val(rtnVal.names);
    	$("#"+idsID).val(rtnVal.ids);
    }
}