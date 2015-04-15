<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Angular TODO - <g:layoutTitle/></title>

    <!-- Bootstrap core CSS -->
    <asset:stylesheet src="bootstrap.css"/>

    <!-- Add custom CSS here -->
    <asset:stylesheet src="sb-admin.css"/>
    <asset:stylesheet src="font-awesome.min.css"/>
    <!-- JavaScript -->
    <asset:javascript src="jquery-1.10.2.js"/>

    <asset:javascript src="bootstrap.js"/>
    <g:layoutHead/>
</head>

<body ng-app="todoApp">

<div id="wrapper">

    <!-- Sidebar -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index.html">IntelliMeet TODO App</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li class="active">
                    <a href="/index.html">
                        <i class="fa fa-check-square-o"></i> Todo's
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa-tasks"></i> Collection's
                    </a>
                </li>
                <li>
                    <g:link controller="logout" class="fa fa-tasks">Logout</g:link>
                </li>
            </ul>

        </div><!-- /.navbar-collapse -->
    </nav>

    <g:layoutBody/>

</div><!-- /#wrapper -->

</body>
</html>
