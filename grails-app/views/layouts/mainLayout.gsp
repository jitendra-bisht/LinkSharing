<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title><g:layoutTitle default="Grails"/></title>

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

    <link href="${resource(dir: 'css', file: 'bootstrap.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'datepicker.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css', file: 'bootstrap-responsive.css')}" rel="stylesheet">
    %{--<link href="${resource(dir: 'css', file: 'jquery-ui-1.10.4.min.css')}" rel="stylesheet">--}%
    <link href="${resource(dir: 'css', file: 'desktop.css')}" rel="stylesheet">

    <g:layoutHead/>
</head>

<body>
    <g:render template="/commons/header"></g:render>
    <g:layoutBody/>
    <g:render template="/commons/footer"></g:render>

    <g:javascript src="jquery-1.11.1.min.js"></g:javascript>
    <script src="${resource(dir: 'js', file: 'bootstrap.js')}"></script>
    <script src="${resource(dir: 'js', file: 'bootstrap-datepicker.js')}"></script>
    <script>
    $(function() {
        $( "#datepicker" ).datepicker();
    });
    </script>
</body>
</html>