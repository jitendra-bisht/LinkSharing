<%@page defaultCodec="none" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="user1Layout">
		<title>Link Sharing</title>
	</head>
	<body>
        <div class="row-fluid">
            <div class="span4">
                <g:include view="commons/post.gsp"></g:include>
            </div>

            <div class="span8 well">
                <g:if test="${CONTENT}">
                    ${CONTENT}
                </g:if>
            </div>
        </div>
	</body>
</html>
