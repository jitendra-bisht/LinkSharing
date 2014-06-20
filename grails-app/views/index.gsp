<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 9/6/14
  Time: 5:17 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@page defaultCodec="none" %>
<html>
<head>
    <meta name="layout" content="mainLayout">
    <title>LinkSharing</title>
</head>

<body>
    <div class="container" style="margin-top: 60px;">
        <div class="row-fluid">
            <div class="span7">
                ${CONTENT}
            </div>

            <div class="span5">
                <g:render template="/commons/register"></g:render>
            </div>
        </div>
    </div>
</body>
</html>