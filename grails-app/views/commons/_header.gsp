<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container" style="padding-top: 10px;padding-bottom: 10px;">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-th-list"></span></a>
            <a href="${createLink(controller: "login",action: "index")}" class="brand">
                LinkSharing
            </a>
            <g:if test="${session.USER_DETAIL}">
                <div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                        <g:render template="/admin/adminMenu"></g:render>
                        <g:render template="/user/userMenu"></g:render>
                        <li>
                            <g:link controller="login" action="logout">Logout</g:link>
                        </li>
                    </ul>
                </div>
            </g:if>
            <g:else>
                <div class="nav-collapse collapse">
                    <ul class="nav pull-right">
                           <g:render template="/commons/login"></g:render>
                    </ul>
                </div>
            </g:else>
        </div>
    </div>
</div>