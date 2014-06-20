<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 2/6/14
  Time: 10:20 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">Recent Shares</h4>
    </div>
    <div class="panel-body">
     <ul class="media-list">
        <%
            for(int i=1;i<=5;i++){
        %>
            <li class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="${resource(dir: 'images',file: 'apple-touch-icon.png')}"
                         alt="Generic placeholder image">
                </a>
                <div class="media-body">
                    <h5 class="media-heading">Jitendra Singh</h5>
                    <p>This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.</p>
                </div>
            </li>
        <%}%>
        </ul>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">Top Share</h4>
    </div>
    <div class="panel-body">
        <ul class="media-list">
            <%
                for(int i=1;i<=5;i++){
            %>
            <li class="media">
                <a class="pull-left" href="#">
                    <img class="media-object" src="${resource(dir: 'images',file: 'apple-touch-icon.png')}"
                         alt="Generic placeholder image">
                </a>
                <div class="media-body">
                    <h5 class="media-heading">Jitendra Singh</h5>
                    <p>This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.</p>
                </div>
            </li>
            <%}%>
        </ul>
    </div>
</div>