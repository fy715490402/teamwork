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
</head>
<body>

    <a href="<c:url value="/forum/${boardId}/topics/new"/>">发帖</a>
    <br>
    <table>
        <tr>
            <th>主题</th>
            <th>作者</th>
            <th>回复数</th>
            <th>最后发表</th>
        </tr>
        <c:if test="${fn:length(topicPage.list)>0}">
            <c:forEach items="${topicPage.list}" var="topic">
                <tr>
                    <td><a href="<c:url value="/forum/topics/${topic.id}"/>">${topic.title}</a></td>
                    <td>${topic.user.username}</td>
                    <td>${fn:length(topic.posts)-1}</td>
                    <td>${topic.posts.iterator().next().content},<fmt:formatDate value="${topic.posts.iterator().next().createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</body>
</html>
