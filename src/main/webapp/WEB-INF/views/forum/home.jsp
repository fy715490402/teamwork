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

      <script type="text/javascript">
        function x() {
            var var1 = document.getElementById("create_board");
            if (var1.style.display = "none"){
                var1.style.display = "block";
            } else {
                var1.style.display = "none";
            }
        }
      </script>

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
			<li onclick="x()"><a><img alt="" src="<c:url value="/images/delete.png"/>"><span>
                创建论坛版块</span></a></li>
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
    <div id="create_board" style="display: none;position: absolute;float: left">
        <form action="<c:url value="/forum/board/create"/>" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>版块名称:</td>
                    <td><input type="text" name="title" value="123"/></td>
                </tr>
                <tr>
                    <td>版块描述:</td>
                    <td><input type="text" name="description" value="123"/></td>
                </tr>
                <tr>
                    <td>上传头像:</td>
                    <td><input type="file"/></td>
                </tr>
                <tr>
                    <td>设置管理员:</td>
                    <td>
                        <select name="manages" multiple="multiple" onchange="">
                            <c:forEach items="${users}" var="user">
                                <option value="${user.id}">${user.username}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="新建"/>
                        <input type="button" value="退出">
                    </td>
                </tr>
            </table>
        </form>

    </div>
  </body>
</html>
