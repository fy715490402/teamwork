<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'historyWorkRecord.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="/oa/css/historyWorkRecord.css">
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
			
			$("#searchitembutton").click(function(){
				$("ul#searchitem").toggleClass("view");
			});
			
		});
	</script>

  </head>
  
  <body>
  	<div id="currentLocation">
    	<span>位置:</span>
    </div>
    <div id="searchkey">
    	<span>综合查询</span><input type="text" id="fulltextretrieval"><span id="searchitembutton">更多</span><span id="searchbutton">查询</span>
    	<ul id="searchitem">
    		<li><span>开始时间</span><input type="text" id="starttime_search"/></li>
    		<li><span>结束时间</span><input type="text" id="endtime_search"/></li>
    		<li><span>服务对象</span><input type="text" id="customer_search"/></li>
    		<li><span>完成情况</span>
    			<select id="iscomplete_search">
    				<option value="1">完成</option>
					<option value="0">未完成</option>
    			</select>
    		</li>
    	</ul>
    </div>
    <div class="clearfloat"></div>
    <div id="contentArea">
    	<table id="workRecordTable">
    		<tr><th></th><th>开始时间</th><th>结束时间</th><th>工作地点</th><th>服务对象</th><th>工作内容</th><th>完成情况</th><th>说明</th></tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>2018/01/01</td>
    			<td>2018/01/01</td>
    			<td>合肥</td>
    			<td>安徽省博物院</td>
    			<td>数据库服务器硬盘坏，由于系统盘在raid0上，首先将系统备份，然后更换坏盘，重新还原系统。</td>
    			<td>完成</td>
    			<td></td>
    		</tr>
    		<tr>
    			<td><input type="checkbox"></td>
    			<td>1</td>
    			<td>1</td>
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
