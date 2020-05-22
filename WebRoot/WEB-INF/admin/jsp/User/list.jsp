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
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="marginTop11px">
        <tr>
          <td width="9" class="titleTopleftBg"></td>
          <td class="listTopBg"></td>
          <td width="9" class="titleTopRightBg"></td>
        </tr>
        <tr>
          <td class="listL"></td>
          <td align="left" valign="top" class="listM">
          <html-el:form action="/User">
          <html-el:hidden property="mod_id" styleId="mod_id" />
              <table width="99%" border="0" cellspacing="2" cellpadding="0">
                <tr>
                  <td width="10%" align="right">XXX：</td>
                  <td width="35%"><html-el:text property="" maxlength="40" styleId="" styleClass="input_out" style="width:200px;" />
                  </td>
                  <td width="10%" align="right">XXX：</td>
                  <td width="35%"></td>
                  <td width="10%" align="center"><html-el:button property="Submit" value="查 询" styleClass="but3" styleId="btn_submit"/></td>
                </tr>
              </table>
            </html-el:form>
          </td>
          <td class="listR"></td>
        </tr>
        <tr>
          <td class="titleBottomleftBg"></td>
          <td class="listBottomBg"></td>
          <td class="titleBottomRightBg"></td>
        </tr>
      </table>
      <div class="tjd2 marginTop11px">
        <html-el:button property="add" styleId="add" styleClass="add1" onclick="location.href='RehabEmergencyResource.do?method=add&mod_id=${af.map.mod_id}';" value="添 加"/>
      </div>
      <div class="clear"></div>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="titleTopleftBg"></td>
          <td class="listTopBg"></td>
          <td class="titleTopRightBg"></td>
        </tr>
        <tr>
          <td class="listL"></td>
          <td align="left" valign="top" class="listM"><table border="0" align="center" cellpadding="0" cellspacing="1" class="datagrid">
              <tr>
                <th width="5%" nowrap="nowrap">序号</th>
					    <th nowrap="nowrap"></th>
					    <th nowrap="nowrap">机构代码</th>
					    <th nowrap="nowrap">机构名称</th>
					    <th nowrap="nowrap">行政区划代码</th>
					    <th nowrap="nowrap">经济类型</th>
					    <th nowrap="nowrap">部门地址</th>
					    <th nowrap="nowrap">经度</th>
					    <th nowrap="nowrap">纬度</th>
					    <th nowrap="nowrap">邮编</th>
					    <th nowrap="nowrap">设置/主办单位</th>
					    <th nowrap="nowrap">隶属关系</th>
					    <th nowrap="nowrap">全体职工人数</th>
					    <th nowrap="nowrap">是否删除,0:有效 1:废弃</th>
					    <th nowrap="nowrap">排序值</th>
					    <th nowrap="nowrap">添加人</th>
					    <th nowrap="nowrap">添加时间</th>
					    <th nowrap="nowrap">修改人</th>
					    <th nowrap="nowrap">修改时间</th>
					    <th nowrap="nowrap">保留字段</th>
					    <th nowrap="nowrap">保留字段</th>
					    <th nowrap="nowrap">保留字段</th>
					    <th nowrap="nowrap">保留字段</th>
					    <th nowrap="nowrap">保留字段</th>
	            <th nowrap="nowrap">操作</th>
              </tr>
              <c:forEach var="cur" items="${entityList}" varStatus="vs">
                <tr>
                  <td align="center">${af.map.pager.pageSize *( af.map.pager.currentPage - 1) + vs.count}</td>
						      <td>${cur.id}</td>
						      <td>${cur.depart_id}</td>
						      <td>${cur.depart_name}</td>
						      <td>${cur.district_code}</td>
						      <td>${cur.economic_type}</td>
						      <td>${cur.depart_addr}</td>
						      <td>${cur.longitude}</td>
						      <td>${cur.latitude}</td>
						      <td>${cur.post_code}</td>
						      <td>${cur.host_agent}</td>
						      <td>${cur.subord_agent}</td>
						      <td>${cur.stuff_count}</td>
						      <td>${cur.is_del}</td>
						      <td>${cur.order_value}</td>
						      <td>${cur.add_id}</td>
						      <td>${cur.add_time}</td>
						      <td>${cur.modify_id}</td>
						      <td>${cur.modify_time}</td>
						      <td>${cur.field1}</td>
						      <td>${cur.field2}</td>
						      <td>${cur.field3}</td>
						      <td>${cur.field4}</td>
						      <td>${cur.field5}</td>
                  <td align="center">
                    <span style="cursor:pointer; margin-left:2px;" onclick="doNeedMethod(null, 'RehabEmergencyResource.do', 'view', 'id=${cur.id}&mod_id=${af.map.mod_id}')">查看</span> 
                    <span style="cursor:pointer; margin-left:2px;" onclick="confirmUpdate(null, 'RehabEmergencyResource.do', 'id=${cur.id}&mod_id=${af.map.mod_id}&' + $('#bottomPageForm').serialize())">修改</span> 
                    <span style="cursor:pointer; margin-left:4px;" onclick="confirmDelete(null, 'RehabEmergencyResource.do', 'id=${cur.id}&mod_id=${af.map.mod_id}&' + $('#bottomPageForm').serialize())">删除</span> 
                  </td>
                </tr>
                <c:if test="${vs.last eq true}">
                  <c:set var="i" value="${vs.count}" />
                </c:if>
              </c:forEach>
              <c:forEach begin="${i}" end="${af.map.pager.pageSize - 1}">
              <tr align="center">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
             </c:forEach>
            </table></td>
          <td class="listR"></td>
        </tr>
        <tr>
          <td class="titleBottomleftBg"></td>
          <td class="listBottomBg"></td>
          <td class="titleBottomRightBg"></td>
        </tr>
      </table>
      <div class="Fy">
        <form id="bottomPageForm" name="bottomPageForm" method="post" action="RehabEmergencyResource.do">
          <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td height="40" align="center" valign="middle"><script type="text/javascript" src="${ctx}/commons/scripts/pager.js">;</script>
                <script type="text/javascript">
	            var pager = new Pager(document.bottomPageForm, ${af.map.pager.recordCount}, ${af.map.pager.pageSize}, ${af.map.pager.currentPage});
	            pager.addHiddenInputs("method", "list");
	            pager.addHiddenInputs("mod_id", "${fn:escapeXml(af.map.mod_id)}");
	            pager.addHiddenInputs("id", "${fn:escapeXml(af.map.id)}");
	            pager.addHiddenInputs("depart_id", "${fn:escapeXml(af.map.depart_id)}");
	            pager.addHiddenInputs("depart_name", "${fn:escapeXml(af.map.depart_name)}");
	            pager.addHiddenInputs("district_code", "${fn:escapeXml(af.map.district_code)}");
	            pager.addHiddenInputs("economic_type", "${fn:escapeXml(af.map.economic_type)}");
	            pager.addHiddenInputs("depart_addr", "${fn:escapeXml(af.map.depart_addr)}");
	            pager.addHiddenInputs("longitude", "${fn:escapeXml(af.map.longitude)}");
	            pager.addHiddenInputs("latitude", "${fn:escapeXml(af.map.latitude)}");
	            pager.addHiddenInputs("post_code", "${fn:escapeXml(af.map.post_code)}");
	            pager.addHiddenInputs("host_agent", "${fn:escapeXml(af.map.host_agent)}");
	            pager.addHiddenInputs("subord_agent", "${fn:escapeXml(af.map.subord_agent)}");
	            pager.addHiddenInputs("stuff_count", "${fn:escapeXml(af.map.stuff_count)}");
	            pager.addHiddenInputs("is_del", "${fn:escapeXml(af.map.is_del)}");
	            pager.addHiddenInputs("order_value", "${fn:escapeXml(af.map.order_value)}");
	            pager.addHiddenInputs("add_id", "${fn:escapeXml(af.map.add_id)}");
	            pager.addHiddenInputs("add_time", "${fn:escapeXml(af.map.add_time)}");
	            pager.addHiddenInputs("modify_id", "${fn:escapeXml(af.map.modify_id)}");
	            pager.addHiddenInputs("modify_time", "${fn:escapeXml(af.map.modify_time)}");
	            pager.addHiddenInputs("field1", "${fn:escapeXml(af.map.field1)}");
	            pager.addHiddenInputs("field2", "${fn:escapeXml(af.map.field2)}");
	            pager.addHiddenInputs("field3", "${fn:escapeXml(af.map.field3)}");
	            pager.addHiddenInputs("field4", "${fn:escapeXml(af.map.field4)}");
	            pager.addHiddenInputs("field5", "${fn:escapeXml(af.map.field5)}");
	            document.write(pager.toString());
            </script></td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${ctx}/commons/scripts/jquery.js"></script>
<script type="text/javascript" src="${ctx}/commons/scripts/validator.js"></script>
<script type="text/javascript" src="${ctx}/commons/scripts/scrollbar.js" ></script>
<script type="text/javascript" src="${ctx}/commons/scripts/rowEffect.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btn_submit").click(function(){
	    document.forms[0].submit();
	});
});
</script>
</body>
</html>
