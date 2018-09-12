<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的收藏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="/oa/css/createWorkRecord.css">
	<script type="text/javascript" src="/oa/js/jquery-3.3.1.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			/**
				筛选表格中行数为偶数行的元素，设置其背景色
			*/
			var trs=$("#contentArea table").find("tr");
			trs.each(function(){
				if(trs.index(this)%2==0&&trs.index(this)>0){
					$(this).addClass("evenline");
				}
			});
		});
	</script>

  </head>
  
  <body>
    <div id="currentLocation">
    	<span>位置:</span>
    </div>
    <div id="contentArea">
    	<div id="buttons">
    		<ul>
    			<li><img alt="" src="/oa/images/delete.png"><span>删除</span></li>
    		</ul>
    	</div>
    	<div class="clearfloat"></div>
    	<table id="workRecordTable">
    		<tr><th></th><th>标题</th><th>内容</th><th>作者</th><th>版块</th><th>修改时间</th></tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>2018/01/01</td>
    			<td>2018/01/01</td>
    			<td>合肥</td>
    			<td>安徽省博物院</td>
    			<td>数据库服务器硬盘坏，由于系统盘在raid0上，首先将系统备份，然后更换坏盘，重新还原系统。</td>
			</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    		</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    		</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    		</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    		</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    		</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    			<td>1</td>
    		</tr>
    	</table>
    	<div id="pageinfo">
    		<span id="currentpage">共1256条记录，当前显示第 2 页</span>
    		<ul id="viewpages">
    			<li><a href="#">&lt;</a></li>
    			<li><a href="#">1</a></li>
    			<li><a href="#">2</a></li>
    			<li><a href="#">3</a></li>
    			<li><a href="#">4</a></li>
    			<li><a href="#">&gt;</a></li>
    		</ul>
    	</div>
    </div>
  </body>
</html>
