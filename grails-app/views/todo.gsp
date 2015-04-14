


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="layout" content="main"/>
    <title>Dashboard</title>
    <asset:javascript src="angular-1.2.16.js"/>
    <asset:javascript src="todo.js"/>

    <style>

    .strikethrough {
        text-decoration: line-through
    }
    </style>
</head>

<body>
<div id="page-wrapper" ng-app="todoApp">
    <div class="row">
        <div class="col-lg-12">
            <h1>
                {{userName}}
                <small>A Blank Slate</small>
            </h1>
        </div>
    </div>


    <div class="row">

        <div class="col-md-6" ng-controller="TodoCtrl">
            Hello friends
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <input ng-model="data.message">
                    <input class="form-control" ng-model="data.message">


                    <h3 class="panel-title">{{data.message|reverse}}.</h3>
                </div>

                <div class="panel-body">
                    <div class="form-group">
                        <form name="myForm" novalidate>
                            <h2>{{todoName}}</h2>
                            <input name="task" class="form-control" placeholder="Enter text" ng-model="name"
                                   required>
                            {{name}}
                            <h2>{{todoPhone}}</h2>
                            <input name="task" class="form-control" placeholder="Enter text" ng-model="phone"
                                   required>
                            {{phone}}
                            <div ng-init="person={firstName:'Khushboo',lastName:'Chanana'}">
                                <h3 ng-bind="person.firstName"></h3>

                                <h3 ng-bind="person.Name"></h3>
                            </div>
                            <b ng-repeat="i in How">{{i|uppercase|limitTo:2}}</b><br>
                            <b ng-repeat="i in amount|orderBy">{{i|currency}}&nbsp;</b>
                            <img ng-src="{{images[1].full}}"/>
                            <img ng-src="{{images[0].full}}"/>
                            {{}}
                            {{ '13' | date:'MM/dd/yyyy @ h:mma'}}
                            <input type="submit" ng-show="show" class="btn btn-success" value="Create"/>
                        </form>
                    </div>
                </div>

            </div>

        </div>

        <div class="col-md-6" ng-controller="PanelCtrl">
            <ul class="nav nav-pills">
                <li ng-class="{active:isSelected(1)}"><a ng-click="selectTab(1)" href="#">Description</a></li>
                <li ng-class="{active:isSelected(2)}"><a ng-click="selectTab(2)" href="#">Specification</a></li>
                <li ng-class="{active:isSelected(3)}"><a ng-click="selectTab(3)" href="#">Reviews</a></li>
            </ul>

            <div class="panel" ng-show="isSelected(1)">
                <h4>Description</h4>

                <p>None</p>
            </div>

            <div class="panel" ng-show="isSelected(2)">
                <h4>Specifications</h4>
                <blockquote>None yet</blockquote>
            </div>

            <div class="panel" ng-show="isSelected(3)" ng-controller="ReviewCtrl" ng-repeat="review in reviews">
                <h4>Reviews</h4>
                <blockquote>
                    <b>Stars: {{review.stars}}</b>
                    {{review.body}}
                    <cite>by: {{review.author}}</cite>
                </blockquote>
            </div>

            <form name="reviewForm" ng-submit="addReview(user)">
                <select ng-model="review.stars">
                    <option value="1">1 star</option>
                    <option value="5">5 stars</option>
                </select><br>
                <textarea ng-model="review.body"></textarea><br>
                <label>by:</label>
                <input type="email" ng-model="review.author"/>
                <input type="submit" value="Submit"/>
            </form>

        </div>
    </div>
</div><!-- /#page-wrapper -->

</body>
</html>

