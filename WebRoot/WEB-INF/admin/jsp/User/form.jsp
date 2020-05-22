<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/pages/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理系统</title>
<link rel="stylesheet" type="text/css" href="${ctx}/skin/darkBlue/css/global.css" />
</head>
<body onload="Resize();">
<html-el:form action="/User">
  <html-el:hidden property="id" />
  <html-el:hidden property="mod_id" styleId="mod_id" />
  <html-el:hidden property="method" value="save" />
  <html-el:hidden property="queryString" />
  <div class="rightBorder">
    <div id="divID" class="right leftMenu2Wrap">
      <div class="rightMargin20px">
        <div class="lbbt1"><span>您当前的位置：${navString}</span>${mod_name}</div>
        <div class="listTitleBg1 marginTop11px"></div>
        <table border="0" cellpadding="0" cellspacing="1" class="inputtab1">
			 <tr class="tr1">
	            <td width="18%" class="bt">：</td>
	            <td align="left"><html-el:text property="id" styleClass="input_out" styleId="id" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">机构代码：</td>
	            <td align="left"><html-el:text property="depart_id" styleClass="input_out" styleId="depart_id" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">机构名称：</td>
	            <td align="left"><html-el:text property="depart_name" styleClass="input_out" styleId="depart_name" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">行政区划代码：</td>
	            <td align="left"><html-el:text property="district_code" styleClass="input_out" styleId="district_code" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">经济类型：</td>
	            <td align="left"><html-el:text property="economic_type" styleClass="input_out" styleId="economic_type" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">部门地址：</td>
	            <td align="left"><html-el:text property="depart_addr" styleClass="input_out" styleId="depart_addr" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">经度：</td>
	            <td align="left"><html-el:text property="longitude" styleClass="input_out" styleId="longitude" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">纬度：</td>
	            <td align="left"><html-el:text property="latitude" styleClass="input_out" styleId="latitude" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">邮编：</td>
	            <td align="left"><html-el:text property="post_code" styleClass="input_out" styleId="post_code" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">设置/主办单位：</td>
	            <td align="left"><html-el:text property="host_agent" styleClass="input_out" styleId="host_agent" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">隶属关系：</td>
	            <td align="left"><html-el:text property="subord_agent" styleClass="input_out" styleId="subord_agent" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">全体职工人数：</td>
	            <td align="left"><html-el:text property="stuff_count" styleClass="input_out" styleId="stuff_count" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">是否删除,0:有效 1:废弃：</td>
	            <td align="left"><html-el:text property="is_del" styleClass="input_out" styleId="is_del" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">排序值：</td>
	            <td align="left"><html-el:text property="order_value" styleClass="input_out" styleId="order_value" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">添加人：</td>
	            <td align="left"><html-el:text property="add_id" styleClass="input_out" styleId="add_id" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">添加时间：</td>
	            <td align="left"><html-el:text property="add_time" styleClass="input_out" styleId="add_time" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">修改人：</td>
	            <td align="left"><html-el:text property="modify_id" styleClass="input_out" styleId="modify_id" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">修改时间：</td>
	            <td align="left"><html-el:text property="modify_time" styleClass="input_out" styleId="modify_time" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">保留字段：</td>
	            <td align="left"><html-el:text property="field1" styleClass="input_out" styleId="field1" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">保留字段：</td>
	            <td align="left"><html-el:text property="field2" styleClass="input_out" styleId="field2" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">保留字段：</td>
	            <td align="left"><html-el:text property="field3" styleClass="input_out" styleId="field3" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">保留字段：</td>
	            <td align="left"><html-el:text property="field4" styleClass="input_out" styleId="field4" style="width:200px;"/></td>
	          </tr>
			 <tr class="tr1">
	            <td width="18%" class="bt">保留字段：</td>
	            <td align="left"><html-el:text property="field5" styleClass="input_out" styleId="field5" style="width:200px;"/></td>
	          </tr>
        </table>
        <table width="290" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
          <tr>
            <td><html-el:button property="btn_submit" styleClass="button01" styleId="btn_submit" value="提 交" /></td>
            <td><html-el:button property="btn_reset" styleClass="button01" styleId="btn_reset" value="重 置" onclick="this.form.reset();" /></td>
            <td><html-el:button property="btn_back" styleClass="button01" styleId="btn_back" value="返 回" onclick="history.back();" /></td>
          </tr>
        </table>
      </div>
    </div>
  </div>
</html-el:form>
<script type="text/javascript" src="${ctx}/commons/scripts/jquery.js"></script>
<script type="text/javascript" src="${ctx}/commons/scripts/validator.js"></script>
<script type="text/javascript" src="${ctx}/commons/scripts/scrollbar.js" ></script>
<script type="text/javascript">
  $(document).ready(function(){	
	  $("#id").attr("dataType" , "Require").attr("msg" , "");
	  $("#depart_id").attr("dataType" , "Require").attr("msg" , "机构代码");
	  $("#depart_name").attr("dataType" , "Require").attr("msg" , "机构名称");
	  $("#district_code").attr("dataType" , "Require").attr("msg" , "行政区划代码");
	  $("#economic_type").attr("dataType" , "Require").attr("msg" , "经济类型");
	  $("#depart_addr").attr("dataType" , "Require").attr("msg" , "部门地址");
	  $("#longitude").attr("dataType" , "Require").attr("msg" , "经度");
	  $("#latitude").attr("dataType" , "Require").attr("msg" , "纬度");
	  $("#post_code").attr("dataType" , "Require").attr("msg" , "邮编");
	  $("#host_agent").attr("dataType" , "Require").attr("msg" , "设置/主办单位");
	  $("#subord_agent").attr("dataType" , "Require").attr("msg" , "隶属关系");
	  $("#stuff_count").attr("dataType" , "Require").attr("msg" , "全体职工人数");
	  $("#is_del").attr("dataType" , "Require").attr("msg" , "是否删除,0:有效 1:废弃");
	  $("#order_value").attr("dataType" , "Require").attr("msg" , "排序值");
	  $("#add_id").attr("dataType" , "Require").attr("msg" , "添加人");
	  $("#add_time").attr("dataType" , "Require").attr("msg" , "添加时间");
	  $("#modify_id").attr("dataType" , "Require").attr("msg" , "修改人");
	  $("#modify_time").attr("dataType" , "Require").attr("msg" , "修改时间");
	  $("#field1").attr("dataType" , "Require").attr("msg" , "保留字段");
	  $("#field2").attr("dataType" , "Require").attr("msg" , "保留字段");
	  $("#field3").attr("dataType" , "Require").attr("msg" , "保留字段");
	  $("#field4").attr("dataType" , "Require").attr("msg" , "保留字段");
	  $("#field5").attr("dataType" , "Require").attr("msg" , "保留字段");
	  
		$("#btn_submit").click(function(){
			if(Validator.Validate(this.form, 3)){
        $("#btn_submit").attr("value", "正在提交...").attr("disabled", "true");
        $("#btn_reset").attr("disabled", "true");
        $("#btn_back").attr("disabled", "true");
				this.form.submit();
			}
		});
  });
</script>
</body>
</html>



