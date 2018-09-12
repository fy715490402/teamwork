<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更换主题</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="/oa/css/changetheme.css">


  </head>
  
  <body>
    <div id="currentLocation">
    	<span>位置:</span>
    </div>
    <ul id="themeArea">
    	<li>
    		<span class="themeview"><img alt="" src="/oa/images/theme.png"></span>
    		<span class="themetitle">太空蓝</span>
    		<span class="themechange">
    			<a href="#">预览</a>|
    			<a href="#">更换</a>
    		</span>
    	</li>
    	<li>
    		<span class="themeview"><img alt="" src="/oa/images/theme.png"></span>
    		<span class="themetitle">星空灰</span>
    		<span class="themechange">
    			<a href="#">预览</a>|
    			<a href="#">更换</a>
    		</span>
    	</li>
    	<li>
    		<span class="themeview"><img alt="" src="/oa/images/theme.png"></span>
    		<span class="themetitle">可爱粉</span>
    		<span class="themechange">
    			<a href="#">预览</a>|
    			<a href="#">更换</a>
    		</span>
    	</li>
    </ul>
  </body>
</html>
