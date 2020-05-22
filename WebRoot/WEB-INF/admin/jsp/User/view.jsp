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
<div class="rightBorder">
  <div id="divID" class="right leftMenu2Wrap">
    <div class="rightMargin20px">
      <div class="lbbt1"><span>您当前的位置：${navString}</span>${mod_name}</div>
      <div class="listTitleBg1" style="margin-top:10px;">
        <div class="listTitleBg2"></div>
      </div>
      <table border="0" align="center" cellpadding="0" cellspacing="1" class="inputtab1">
		<tr class="tr1">
	      <td width="18%" class="bt">：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.id)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">机构代码：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.depart_id)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">机构名称：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.depart_name)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">行政区划代码：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.district_code)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">经济类型：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.economic_type)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">部门地址：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.depart_addr)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">经度：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.longitude)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">纬度：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.latitude)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">邮编：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.post_code)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">设置/主办单位：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.host_agent)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">隶属关系：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.subord_agent)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">全体职工人数：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.stuff_count)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">是否删除,0:有效 1:废弃：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.is_del)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">排序值：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.order_value)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">添加人：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.add_id)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">添加时间：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.add_time)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">修改人：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.modify_id)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">修改时间：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.modify_time)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">保留字段：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.field1)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">保留字段：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.field2)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">保留字段：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.field3)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">保留字段：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.field4)}" /></td>
	    </tr>
		<tr class="tr1">
	      <td width="18%" class="bt">保留字段：</td>
	      <td align="left"><c:out value="${fn:escapeXml(af.map.field5)}" /></td>
	    </tr>
      </table>
      <table width="190" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="70" align="center" colspan="2"><html-el:button property="" styleClass="button01" styleId="btn_back" value="返 回" onclick="history.back();" /></td>
        </tr>
      </table>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/commons/scripts/scrollbar.js" ></script>
</body>
</html>
