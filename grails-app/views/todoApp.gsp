<!DOCTYPE html>
<%@ page import="com.intelligrape.intellimeet.Todo; com.intelligrape.intellimeet.TodoGroup; com.intelligrape.intellimeet.Priority" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Dashboard</title>
    <meta name="layout" content="main"/>
    <asset:javascript src="angular-1.2.16.js"/>
    <asset:javascript src="todoApp.js"/>
    <style>
    .ng-invalid.ng-dirty {
        border-color: #FA787E;
    }

    .ng-valid.ng-dirty {
        border-color: #78FA89;
    }

    .strikethrough {
        text-decoration: line-through
    }
    </style>
</head>

<body>
<script>

    var userId=${sec.loggedInUserInfo(field:"id")};
</script>
<div id="page-wrapper" ng-controller="TodoCtrl">
    <div class="row">
        <div class="col-lg-12">
            <h1>${sec.loggedInUserInfo(field:"username")}  TODO's
                <small>A Blank Slate</small>
            </h1>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <a href="javascript:void(0)" ng-click='tab=2' style="color: #e1edf7">+NewTodo</a>
                    <a href="javascript:void(0)" ng-click='tab=1' style="float: right;color: #e1edf7">+NewTodoGroup</a>
                </div>

                <div class="panel-body">

                    <div class="form-group" ng-show="tab===1">
                        <form name="createTodo" ng-submit="addTodoGroup(group.name)" invalidate>

                            <label>TODO Group Name</label>
                            <input name="task" class="form-control" placeholder="Enter text" ng-model="group.name"
                                   name-unique
                                   required><br>
                            <input type="submit" class="btn btn-success" value="CreateGroup"/>
                        </form>

                    </div>


                    <div class="form-group" ng-hide="tab===1">
                        <form name="createTodo" ng-submit="addTodo(item.task,priority,collection)" invalidate>
                            <label>TODO NAME</label>
                            <input name="task" class="form-control" placeholder="Enter text" ng-model="item.task"
                                   name-unique
                                   required>
                            <br>
                            <label>SELECT PRIORITY</label>
                            <g:select name="priority" from="['HIGH', 'LOW']" ng-model="priority"/>
                            <label>TODO GROUP</label>
                            <select ng-model='collection' ng-options="group .id as group.name for group in groups"
                                    required>
                                <option value=''>-- chose TodoGroup --</option>
                            </select>

                            <h2>{{item.task}}</h2>
                            <input type="submit" class="btn btn-success" value="Create"/>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        %{--<div ng-repeat="group in groups| filter:group"></div>--}%



        <div class="col-md-6">
            <div ng-repeat="group in groups" color>
                <h1>{{group.name}}
                    <a href="javaScript:void(0)" ng-click="deleteTodoGroup(group)"><asset:image
                            style="float: right;width:20px;height:20px" src="del.png"/></a>
                </h1>

                <div>Not Done
                    <hr>
                </div>
                <ul ng-repeat="item in group.todos ">

                    <li class="list-group-item" ng-show="!(item.completed)==true"
                        style="height: auto" color>
                        <form ng-submit="deleteTodo(item,group)">

                            <div ng-class="{strikethrough: item.completed}">
                                <span><input ng-model="item.completed" type="checkbox"
                                             ng-click="checkBoxClick(item,group)"/>
                                    {{item.id}}

                                    {{item.task}}
                                    <span style="float:right; margin-right:10px">
                                        <input type="submit" value="DELETE" class="btn btn-xs btn-danger">
                                    </span>
                                </span>
                            </div>
                        </form>
                    </li>

                </ul>

                <div>Done
                    <hr>

                </div>

                <ul ng-repeat="item in group.todos">
                    <li class="list-group-item" ng-show="item.completed==true" style="height: auto" color>

                        <form ng-submit="deleteTodo(item,group)">

                            <div ng-class="{strikethrough: item.completed}">
                                <span><input ng-model="item.completed" type="checkbox"
                                             ng-click="checkBoxClick(item,group)"/>
                                    {{item.id}}
                                    {{item.task}}


                                    <span style="float:right; margin-right:10px">
                                        <input type="submit" value="DELETE" class="btn btn-xs btn-danger">
                                    </span>
                                </span>
                            </div>
                        </form>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>
</body>
</html>
