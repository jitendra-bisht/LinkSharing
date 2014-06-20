<div class="panel panel-default">
    <div class="panel-heading">
        <h5 class="panel-title">No Subscription</h5>
    </div>
    <div class="panel-body">
        <div class="row-fluid">
            <div class="span7">
                You are not subscribed to any topic. also you haven't created any topic yet.
                Below are the possible suggestions
                <ul>
                    <li>
                        <a href="${createLink(controller: 'topic',action: 'createTopic')}">Create New Topic</a>
                    </li>
                    <li>
                        <a href="${createLink(controller: 'topic',action: 'listAllTopics')}">List Public Topics</a>
                    </li>
                </ul>
            </div>
            <div class="span5">
            </div>
        </div>
    </div>
</div>
