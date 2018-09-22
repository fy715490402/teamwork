<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 18-9-20
  Time: 上午9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>主题</title>
    <style>
        .topics_table{
            width: 90%;
            margin-left: 20px ;
            margin-top: 50px;
            border-collapse: collapse;
            border-spacing: 0;
        }
        .topics_table th{
            background-color: #4788c7;
            color: white;
            text-align: left;
            padding: 10px;
            font-size: 12px ;
        }

        .topics_table thead .margin_id{
            height: 8px;
        }

        .topics_table tbody{
            font-size: 14px;
            color: #333;
            text-align: left;
        }

        .topics_table tbody td{
            padding: 10px;
            border-bottom: 1px solid #7274A7;
        }

    </style>
</head>
<body>

    <a href="<c:url value="/forum/${boardId}/topics/new"/>">发帖</a>
    <br>
    <table class="topics_table">
        <thead>
        <tr>
            <th width="50%">主题</th>
            <th width="10%">作者</th>
            <th width="5%">回复数</th>
            <th width="35%">最后发表</th>
        </tr>
        <tr>
            <td colspan="4" class="margin_id"></td>
        </tr>
        </thead>
        <tbody>
        <c:if test="${fn:length(topicPage.list)>0}">
            <c:forEach items="${topicPage.list}" var="topic">
                <tr>
                    <td><a href="<c:url value="/forum/topics/${topic.id}"/>">${topic.title}</a></td>
                    <td>${topic.user.username}</td>
                    <td>${fn:length(topic.posts)-1}</td>
                    <td>${topic.posts.iterator().next().user.username}
                        <br>
                        <fmt:formatDate value="${topic.posts.iterator().next().createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</body>
</html>
