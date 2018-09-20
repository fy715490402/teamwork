<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 18-9-20
  Time: 下午4:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${topic.title}</title>
</head>
<body>
    <a href="#">回复</a>
    <table border="1px solid gray">
        <tr>
            <td colspan="2">
                ${topic.title}
            </td>
        </tr>
        <c:forEach items="${topic.posts}" var="post">
            <tr>
                <td>${post.user.username}</td>
                <td>${post.content}</td>
            </tr>
        </c:forEach>
    </table>
    <form>

    </form>
</body>
</html>
