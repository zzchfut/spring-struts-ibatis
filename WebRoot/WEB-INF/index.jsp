<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/commons/pages/taglibs.jsp" %>
<c:url var="index" value="/login.do" />
<c:redirect url="..${index}" />

<!-- use global messages: <bean:message bundle="moreResources" key="some.message.key"/>  -->
<!-- <h1><bean:message key="registration.title" /></h1>
<bean:message key="label.welcome" arg0="Hello" arg1="Kitty"/> -->

