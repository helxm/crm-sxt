<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>adderro.jsp</title>
  </head>
  
  <body>
     <h2>添加用户失败</h2> <br>
     <a href="userAction!findAll">回到上次页面重新输入</a><br>
     <a href="userAction!homePage?admin=admin">主页</a>
  </body>
</html>
