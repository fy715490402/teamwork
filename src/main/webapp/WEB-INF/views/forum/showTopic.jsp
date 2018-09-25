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
    <style type="text/css">
        #bbs_detail_wrap{
            width: 90%;
            margin: 10px auto;
            /*position: relative;*/
        }

        #topic_title{
            height: 44px;
            line-height: 44px;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            padding: 0 24px;
            margin: 8px 0 1px;
            box-shadow: 0 2px 4px 0 rgba(0,0,0,0.5);
        }

        .mod_fun_wrap{
            margin-top: 20px;
        }

        .post_area{
            border:1px solid gray;
        }

        dt,dd{
            display: table-cell;
        }

        .post_user_info{
            width: 152px;
            background-color: #fafbfc;
            box-shadow: inset -1px 0 0 rgba(0,0,0,.06);
            /*position: relative;*/
            padding-bottom: 5px;
            border-collapse: collapse;
        }

        .post_detail{
            border-bottom: 1px solid gray;
        }

        dl{
            margin: 0 0;
        }


        #editor{
            width: 90%;
            height: 200px;
            margin: 50px auto;
            position: static;
        }

        .buttons{
            position: relative;
            top: 50px;
        }

        .clear_left{
            clear: both;
        }

    </style>
</head>
<body>
<%--<script type="text/javascript" charset="UTF-8" src="/teamwork/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" charset="UTF-8" src="/teamwork/utf8-jsp/ueditor.all.js"></script>
<script type="text/javascript" charset="UTF-8" src="/teamwork/utf8-jsp/lang/zh-cn/zh-cn.js"></script>--%>
<script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/ueditor.config.js"/>"></script>
<script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/ueditor.all.js"/>"></script>
<script type="text/javascript" charset="UTF-8" src="<c:url value="/ueditor/lang/zh-cn/zh-cn.js"/>"></script>
<script type="text/javascript" src="<c:url value="/js/jquery-3.3.1.js"/>"/>

<script type="text/javascript">
</script>


<div id="bbs_detail_wrap">

    <div id="topic_title">${topic.title}</div>
    <div class="mod_fun_wrap clearfix"></div>
    <div class="post_area">
        <c:forEach items="${postPage.list}" var="post">
            <div id="post-${post.id}" class="post_detail">
                <dl>
                    <dt class="post_user_info">${post.user.username}</dt>
                    <dd class="post_content">${post.content}</dd>
                </dl>
            </div>
        </c:forEach>
    </div>
    <div class="page_no">
        <c:forEach begin="1" end="${postPage.pageCount}" step="1" var="i">
            <a href="<c:url value="/forum/topics/${topic.id};pageNo=${i}"/>">${i}</a>
        </c:forEach>
    </div>
</div>

<div class="clear_left"></div>
<%--富文本编辑器--%>
    <script id="editor">
    </script>
    <div class="btns">
    <button onclick="submit_post()">提交回复</button>
    <button onclick="getContent()">获得内容</button>
    </div>
    <input type="hidden" id="topic_id" value="${topic.id}">
    <input type="hidden" id="rootPath" value="${pageContext.servletContext.contextPath}">
    <script>
        var editor = UE.getEditor("editor");
        UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
        UE.Editor.prototype.getActionUrl = function(action) {
            if (action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadimage') {
                return 'http://localhost:8080/teamwork/forum/upload';
            } else if (action == 'uploadvideo') {
                return 'http://a.b.com/video.php';
            } else {
                return this._bkGetActionUrl.call(this, action);
            }
        }
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
