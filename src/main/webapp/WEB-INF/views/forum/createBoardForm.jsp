<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 18-9-17
  Time: 下午3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>创建版块</title>
</head>
<body>
<sf:form method="post" modelAttribute="board" enctype="multipart/form-data">
    <table>
        <tr>
            <td>版块名称:</td>
            <td><sf:input path="title"/></td>
        </tr>
        <tr>
            <td>版块描述:</td>
            <td><sf:textarea path="description"/></td>
        </tr>
        <tr>
            <td>上传头像:</td>
            <td><input type="file"/></td>
        </tr>
        <tr>
            <td>设置管理员:</td>
            <td>
              <sf:select path="manages">
                  <sf:options items="${users}" itemLabel="username" itemValue="id"/>
              </sf:select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="新建"/>
                <input type="button" value="退出">
            </td>
        </tr>
    </table>
</sf:form>
</body>
</html>
