<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>论坛首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/board_list.css"/>">

  </head>
  
  <body>
    <div id="currentLocation">
    	<span>位置:</span>
    </div>
    <div class="clearfloat"></div>
    <div id="buttons">
    	<ul>
			<li><a href="#"><img alt="" src="<c:url value="/images/delete.png"/>"><span>发贴</span></a></li>
			<%--创建论坛版块，管理员可见--%>
			<li><a href="<c:url value="/forum/board/create"/>"><img alt="" src="<c:url value="/images/delete.png"/>"><span>创建论坛版块</span></a></li>
		</ul>
    </div>
    <div class="clearfloat"></div>
    <ul id="board_list">
    	<%--<li>
    		<div class="subjecticon"><img alt="" src="<c:url value="/images/winlogo.png"/>"></div>
    		<div>
    			<span class="subjecttitle">Windows专区</span><br>
    			<span>贴数：120</span><br>
    			<span>
    				<a class="lastarticle" href="#">
    					<span class="lastarticle_title">windows域控之间如何添加域信任</span><br>2小时前 剑缘傲雪
    				</a>
    			</span>
    			<a class="enterButton" href="#">进入</a>
    		</div>
    	</li>
    	<li>
    		<div class="subjecticon"><img alt="" src="<c:url value="/images/linuxlogo.png"/>"></div>
    		<div class="subjectinfo">
    			<span class="subjecttitle">Linux专区</span><br>
    			<span>贴数：120</span><br>
    			<span>
    				<a class="lastarticle" href="#">
    					<span class="lastarticle_title">windows域控之间如何添加域信任</span><br>2小时前 剑缘傲雪
    				</a>
    			</span>
    			<a  class="enterButton" href="#">进入</a>
    		</div>
    	</li>
    	<li>
    		<div class="subjecticon"><img alt="" src="<c:url value="/images/net.png"/>"></div>
    		<div class="subjectinfo">
    			<span class="subjecttitle">网络专区</span><br>
    			<span>贴数：120</span><br>
    			<span>
    				<a class="lastarticle" href="#">
    					<span class="lastarticle_title">windows域控之间如何添加域信任</span><br>2小时前 剑缘傲雪
    				</a>
    			</span>
    			<a  class="enterButton" href="#">进入</a>
    		</div>
    	</li>
    	<li>
    		<div class="subjecticon"><img alt="" src="<c:url value="/images/storage.png"/>"></div>
    		<div class="subjectinfo">
    			<span class="subjecttitle">存储专区</span><br>
    			<span>贴数：120</span><br>
    			<span>
    				<a class="lastarticle" href="#">
    					<span class="lastarticle_title">windows域控之间如何添加域信任</span><br>2小时前 剑缘傲雪
    				</a>
    			</span>
    			<a  class="enterButton" href="#">进入</a>
    		</div>
    	</li>
    	<li>
    		<div class="subjecticon"><img alt="" src="<c:url value="/images/dayang.png"/>"></div>
    		<div class="subjectinfo">
    			<span class="subjecttitle">软件专区</span><br>
    			<span>贴数：120</span><br>
    			<span>
    				<a class="lastarticle" href="#">
    					<span class="lastarticle_title">windows域控之间如何添加域信任</span><br>2小时前 剑缘傲雪
    				</a>
    			</span>
    			<a  class="enterButton" href="#">进入</a>
    		</div>
    	</li>
    	<li>
    		<div class="subjecticon"><img alt="" src="<c:url value="/images/other.png"/>"></div>
    		<div class="subjectinfo">
    			<span class="subjecttitle">其他</span><br>
    			<span>贴数：120</span><br>
    			<span>
    				<a class="lastarticle" href="#">
    					<span class="lastarticle_title">windows域控之间如何添加域信任</span><br>2小时前 剑缘傲雪
    				</a>
    			</span>
    			<a  class="enterButton" href="#">进入</a>
    		</div>
    	</li>--%>
    </ul>
    
    <div class="clearfloat"></div>
  </body>
</html>
