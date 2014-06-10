<%--
  Created by IntelliJ IDEA.
  User: intelligrape
  Date: 2/6/14
  Time: 10:20 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<div class="post-container">
    <div class="post-box">
        <div class="post-title-bar">
            Recent Shares
        </div>
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
    <div class="post-box">
        <div class="post-title-bar">
            Top Shares
        </div>
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
