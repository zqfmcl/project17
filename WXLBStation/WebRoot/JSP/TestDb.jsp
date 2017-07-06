<%@page import="com.lckj.wechat.util.C3p0Util"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
out.println(C3p0Util.queryCountForInt("select count(1) from tuser where userid='admin'"));
out.flush();
%>

