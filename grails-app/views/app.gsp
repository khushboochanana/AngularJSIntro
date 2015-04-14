<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<html ng-app="myApp">
<head>
    <style>
    .ng-invalid.ng-dirty {
        border-color: #FA787E;
    }

    .ng-valid.ng-dirty {
        border-color: #78FA89;
    }
    </style>
    <meta name="layout" content="main"/>
    <asset:javascript src="angular-1.2.16.js"/>
    <asset:javascript src="new.js"/>

    <title></title>
</head>

<body>

<div class="row">
    <div class="main" ng-app="todoApp" ng-controller="UserCtrl">

        <div class="col-md-6">
            <h1 ng-include="'/includeIt.html'"></h1>

            <div ng-repeat="user in users" style="border: outset;height:auto">
                <em>{{user.name}}</em>
                <img ng-src="{{user.image}}" style="float: right"/>
                <b ng-repeat="i in amount|orderBy">{{i}}&nbsp;</b>
                {{store}}
                <div ng-controller="PanelCtrl" color>
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


                    <div class="panel" ng-show="isSelected(3)">
                        <h4>Reviews</h4>

                        <div ng-repeat="review in user.reviews">
                            <blockquote>
                                <b>Stars: {{review.stars}}</b>
                                {{review.body}}
                                <cite>by: {{review.author}}</cite>
                            </blockquote>
                        </div>
                        <input ng-model="review.terms" type="checkbox"/> I agree to the terms  {{review.terms}}
                        <form name="reviewForm" ng-controller="ReviewCtrl"
                              ng-submit="reviewForm.$valid && addReview(user)" novalidate>
                            <blockquote>
                                <b>Stars: {{review.stars}}</b>
                                {{review.body}}
                                <cite>by: {{review.author}}</cite>
                            </blockquote>
                            <select ng-model="review.star" required>
                                <option value="1">1 star</option>
                                <option value="2">2 stars</option>
                                <option value="3">3 stars</option>
                                <option value="4">4 stars</option>
                                <option value="5">5 stars</option>
                            </select><br>
                            <textarea ng-model="review.body" required></textarea><br>
                            <label>by:</label>
                            <input type="email" ng-model="review.author" required/>
                            <input type="submit" value="Submit"/>
                            Review form validation{{reviewForm.$valid}}
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
