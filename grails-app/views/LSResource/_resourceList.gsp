<g:if test="${lsresource}">
    <table width="100%">
        <tr>
            <th>S. No</th>
            <th>Topic</th>
            <th>Description</th>
            <th>URL</th>
            <th>File</th>
            <th>Uploaded Date</th>
        </tr>
        <g:each in="${lsresource}" var="res" status="index">
            <tr>
                <td>${index+1}</td>
                <td>${res.topic.topicName}</td>
                <td>${res.description}</td>
                <td>
                    %{--<g:if test="${res instanceof com.linkshare.LinkResource}">--}%
                        ${res.url}
                    %{--</g:if>--}%
                </td>
                <td>
                    <g:if test="${res instanceof com.linkshare.DocumentResource}">
                        ${res.path}
                    </g:if>
                </td>
                <td></td>
            </tr>
        </g:each>
    </table>
</g:if>