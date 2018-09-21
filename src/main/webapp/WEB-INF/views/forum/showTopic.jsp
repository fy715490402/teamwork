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
<%--<script type="text/javascript" charset="UTF-8" src="/teamwork/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="UTF-8" src="/teamwork/utf8-jsp/ueditor.all.js"></script>
<script type="text/javascript" charset="UTF-8" src="/teamwork/utf8-jsp/lang/zh-cn/zh-cn.js"></script>--%>
<script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
<script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/ueditor.all.js"/>"></script>
<script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/lang/zh-cn/zh-cn.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-3.3.1.js"/>"/>
<style type="text/css">
    div {
        width: 100%;
    }
</style>
<script type="text/javascript">
</script>
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

<form method="post" action="">

</form>

<%--富文本编辑器--%>
    <div id="editor" style="width: 80%;height: 400px">
    </div>
    <button onclick="submit_post()">提交回复</button>
    <button onclick="getContent()">获得内容</button>
    <input type="hidden" id="topic_id" value="${topic.id}">
    <input type="hidden" id="rootPath" value="${pageContext.servletContext.contextPath}">
    <script>
        var editor = UE.getEditor("editor");
        function getContent() {
            var arr = [];
            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getContent());
            alert(arr.join("\n"));
        }

        function submit_post() {
            var content = UE.getEditor('editor').getContent();
            var submit_url =$('#rootPath').val()+"/forum/topics/" +$('#topic_id').val()+"/newPost";
            //创建表单
            var form = $("<form></form>");
            form.attr("method","post");
            form.attr("action",submit_url);
            var content_in = $("<textarea name='content' id='content'/>");
            content_in.val(content);
            form.append(content_in);
            form.appendTo("body");
            form.attr("display","none");
            form.submit();
        }
    </script>

</body>
</html>
