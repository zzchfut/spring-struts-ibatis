<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/commons/pages/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="refresh" content="3;URL=${ctx}/" />
<title>禁止访问</title>
<style type="text/css">
/*<![CDATA[*/
<!--
body, h2 {
	font-size: 14px;
}
h1 {
	font-size: 16px;
}
-->
/*]]>*/
</style>
</head>
<body>
<h1>禁止访问</h1>
<h2>试图访问的网页禁止访问。</h2>
<hr noshade="noshade" size="1px" />
<p>请尝试下列操作：</p>
<ul>
  <li>打开 <a href="${ctx}/">${ctx}/</a> 主页，然后查找与所需信息相关的链接。 </li>
  <li>单击<a href="javascript:location.reload(true);">刷新</a>按钮，或稍后重试。 </li>
</ul>
<p>HTTP 错误 403 - 禁止访问</p>
<hr noshade="noshade" size="1px" />
<span style="font-style:italic;"><a href="${www_url}/">安徽省司法行政管理指挥平台</a>（本页面3秒后自动转到首页）</span>
</body>
</html>
