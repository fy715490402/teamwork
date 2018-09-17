<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> -->
<html>
  <head>
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
	<script type="text/javascript" src="<c:url value="/js/jquery-3.3.1.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/drawImage.js"/>"></script>
  </head>
  
  <body>
  <script type="text/javascript">
		$(document).ready(
			function(){
				drawTriangle();
				
				$("#leftmenu>dd>.title").click(
					function(){
						//取得被點擊的元素的兄弟元素，且元素標簽為ul
						var $ul=$(this).next("ul");
						//隱藏所有的子菜單
						$("dd").find("ul").slideUp();
						//如果被點擊菜單的子菜單是展開的，則關閉，如果是關閉的，則展開
						if($ul.is(":visible")){
							$ul.slideUp();
						}else{
							$ul.slideDown();
						}
					});
					
				$(".menuson li").click(
					function(){
						$(".menuson").find("li").removeClass("active");
						$(this).addClass("active");
					});
				$("#shortcutButton ul li").click(function(){
					$(this).addClass("selected").siblings().removeClass("selected");
				});
				
				//鼠标移动到用户名时，弹出子菜单
				/* $("#userinfo .username").mouseover(function(){
					if(!$("#exitsonmenu").is(":visible")){
						$("#exitsonmenu").slideDown("slow");
					}
				});
				
				$("#userinfo .username").mouseout(function(){
					if($("#exitsonmenu").is(":visible")){
						$("#exitsonmenu").slideUp("slow");
					}
				}); */
				$("#userinfo .username").hover(
						function(){
							if(!$("#exitsonmenu").is(":visible")){
							$("#viewexitsonmenu").toggleClass("retote");
							$("#exitsonmenu").slideDown("slow");
						}
					},
					function(){
							if($("#exitsonmenu").is(":visible")){
							$("#viewexitsonmenu").toggleClass("retote");
							$("#exitsonmenu").slideUp("slow");
						}
					}
				);
			});
	</script>
    <div id="header">
    	<div id="logo">
    		<a href="<c:url value="/"/>"></a>
    	</div>
    	<div id="shortcutButton">
    		<ul>
    			<li class="selected">
    				<a href="#">
    					<img alt="" src="<c:url value="/images/icon01.png"/>">
    					<span>工作台</span>
    				</a>
    			</li>
    			<li>
    				<a href="#">
    					<img alt="" src="<c:url value="/images/icon02.png"/>">
    					<span>模型管理</span>
    				</a>
    			</li>
    			<li>
    				<a href="#">
    					<img alt="" src="<c:url value="/images/icon03.png"/>">
    					<span>模块设计</span>
    				</a>
    			</li>
    			<li>
    				<a href="#">
    					<img alt="" src="<c:url value="/images/icon04.png"/>">
    					<span>常用工具</span>
    				</a>
    			</li>
    			<li>
    				<a href="#">
    					<img alt="" src="<c:url value="/images/icon05.png"/>">
    					<span>文件管理</span>
    				</a>
    			</li>
    			<li>
    				<a href="#">
    					<img alt="" src="<c:url value="/images/icon06.png"/>">
    					<span>系统设置</span>
    				</a>
    			</li>
    		</ul>
    	</div>
    	<div id="userinfo">
    		<div id="usericon">
    			<img alt="" src="<c:url value="/images/usericon.png"/> ">
    		</div>
    		<span>当前用户：</span>
    		<div class="username">
    			${loginUser.username}
    			<canvas id="viewexitsonmenu" width="10px" height="10px"></canvas>
    			<ul id="exitsonmenu">
    				<li><a>修改密码</a></li>
    				<li><a>安全退出</a></li>
    			</ul>
    		</div>
    	</div>
    </div>
    <div class="clearfloat"></div>
    <div id="body">
    	<!-- <div id="leftmenu"> -->
    		<dl id="leftmenu">
    			<dd>
    				<div class="title"><img alt="" src="<c:url value="/images/workrecord.png"/>">工作记录</div>
    				<ul class="menuson">
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="/oa/jsptemp/createWorkRecord.jsp" target="contentview">添加记录</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="/oa/jsptemp/historyWorkRecord.jsp" target="contentview">往期查询</a>
    						<span class="righttriangle"></span>
    					</li>
    				</ul>
    			</dd>
    			<dd>
    				<div class="title"><img alt="" src="<c:url value="/images/attence.png"/>">考勤管理</div>
    				<ul class="menuson">
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">考勤统计</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">请假/调休</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">加班</a>
    						<span class="righttriangle"></span>
    					</li>
    				</ul>
    			</dd>
    			<dd>
    				<div class="title"><img alt="" src="<c:url value="/images/financial.png"/>">财务管理</div>
    				<ul class="menuson">
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">报销申请</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">借款申请</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">报销审核</a>
    						<span class="righttriangle"></span>
    					</li>
    				</ul>
    			</dd>
    			<dd>
    				<div class="title"><img alt="" src="<c:url value="/images/repository.png"/>">仓库管理</div>
    				<ul class="menuson">
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">入库</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">出库申请</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="#">出库审核</a>
    						<span class="righttriangle"></span>
    					</li>	
    				</ul>
    			</dd>
    			<dd>
    				<div class="title"><img alt="" src="<c:url value="/images/technologychat.png"/>">技术交流</div>
    				<ul class="menuson">
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="<c:url value="/forum/"/>" target="contentview">交流专区</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="<c:url value="/forum/mystore"/>" target="contentview">我的收藏</a>
    						<span class="righttriangle"></span>
    					</li>
    					<!-- <li>
    						<span class="lefttriangle"></span>
    						<a href="#">文档下载</a>
    						<span class="righttriangle"></span>
    					</li> -->
    				</ul>
    			</dd>
    			<dd>
    				<div class="title"><img alt="" src="<c:url value="/images/set.png"/>">系统设置</div>
    				<ul class="menuson">
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="/oa/jsptemp/changeTheme.jsp" target="contentview">更改皮肤</a>
    						<span class="righttriangle"></span>
    					</li>
    					<li>
    						<span class="lefttriangle"></span>
    						<a href="/oa/jsptemp/personalinfo.jsp" target="contentview">个人信息</a>
    						<span class="righttriangle"></span>
    					</li>
    				</ul>
    			</dd>
    		</dl>
    	<!-- </div> -->
    	<div id="contentview">
    		<iframe name="contentview" src="<c:url value="/home"/>"></iframe>
    	</div>
    </div>
    <div class="clearfloat"></div>
    <div id="footer">
    	<div class="clearfloat"></div>
    	<div id="coderInfo">
    		<span>Code By:剑缘傲雪</span><br>
    		<span>QQ:715490402</span><br>
    		<span>email:ahfangyuan2006@163.com</span><br>
    	</div>
    </div>
  </body>
</html>
