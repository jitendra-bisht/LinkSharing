<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 9/6/14
  Time: 5:17 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title></title>
</head>

<body>

<div class="container" style="margin-top: 60px;">
    <div class="row-fluid">
        <div class="span7">
            <g:include view="commons/post.gsp"></g:include>
        </div>
        <div class="span5 well">
            <g:render template="/commons/register"></g:render>
        </div>
    </div>
</div>

</body>
</html>