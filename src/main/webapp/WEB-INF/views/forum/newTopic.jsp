<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 18-9-20
  Time: 上午11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/ueditor.all.js"/>"></script>
    <script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/lang/zh-cn/zh-cn.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/jquery-3.3.1.js"/>"></script>
    <script>
        function new_topic() {
            $("#mainpost_content").val(UE.getEditor("editor").getContent());
            var action = "/teamwork/forum/"+$("#board_id").val()+"/topics/new";
            $("form").attr("action",action);
            $("form").submit();
        }
    </script>
    <style>

        .content_label{
            vertical-align: top;
        }

        #editor{
            width: 60%;
            height: 200px;
        }
    </style>
    <title>发表新帖</title>
</head>
<body>
    <%--action="/teamwork/forum/${board.id}/topics/new"--%>
    <sf:form onsubmit="new_topic()" method="post" modelAttribute="topic">
    <input type="hidden" id="board_id" value="${board.id}">
        <table>
            <tr>
                <td>标题:</td>
                <td><sf:input path="title"/></td>
            </tr>
            <tr>
                <td>主题版块:</td>
                <td>
                    <sf:select path="board.id" items="${boards}" itemLabel="title" itemValue="id">
                    </sf:select>
                </td>
            </tr>
            <tr>
                <td class="content_label">内容:</td>
                <td>
                    <span id="editor"></span>
                    <input type="hidden" name="mainPost.content" id="mainpost_content">
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <input type="submit" value="发表"/>
                </td>
            </tr>
        </table>
    </sf:form>
<script>
    var editor = UE.getEditor("editor");
</script>
</body>
</html>
