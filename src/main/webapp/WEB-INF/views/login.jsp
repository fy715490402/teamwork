<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录</title>
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
</head>
<body>
<sf:form modelAttribute="user" method="post">
    <table>
        <tr>
            <td>用户名：</td>
            <td>
                <sf:input path="username"/>
            </td>
        </tr>
        <tr>
            <td>密码:</td>
            <td>
                <sf:password path="password"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="登录"/>&nbsp;
                <input type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</sf:form>
</body>
</html>
