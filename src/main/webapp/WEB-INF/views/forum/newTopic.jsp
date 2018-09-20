<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 18-9-20
  Time: 上午11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>发表新帖</title>
</head>
<body>

    <sf:form action="/teamwork/forum/${board.id}/topics/new" method="post" modelAttribute="topic">
        <table>
            <tr>
                <td>标题:</td>
                <td><sf:input path="title"/></td>
            </tr>
            <tr>
                <td>内容:</td>
                <td>
                    <sf:textarea path="mainPost.content"/>
                </td>
            </tr>
            <tr>
                <td>主题版块:</td>
                <td>
                    <sf:select path="board.id" items="${boards}" itemLabel="title" itemValue="id">
                    </sf:select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="发表"/>
                </td>
            </tr>
        </table>
    </sf:form>

</body>
</html>
