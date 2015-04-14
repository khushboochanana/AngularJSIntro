var user = {
    users: [
        {
            name: 'a',
            image: "/assets/spinner.gif",
            reviews: [
                {
                    stars: 5,
                    body: "It's nice",
                    author: "K@a.com"
                },
                {
                    stars: 4,
                    body: "It's cool",
                    author: "Kjjj@lll.com"
                }
            ]
        },
        {
            name: 'b',
            image: "/assets/grails_logo.png",
            reviews: [
                {
                    stars: 5,
                    body: "It's nice",
                    author: "K@a.com"
                },
                {
                    stars: 4,
                    body: "It's cool",
                    author: "Kjjj@lll.com"
                }
            ]
        },
        {
            name: 'c',
            image: "/assets/spinner.gif",
            reviews: [
                {
                    stars: 5,
                    body: "It's nice",
                    author: "K@a.com"
                },
                {
                    stars: 4,
                    body: "It's cool",
                    author: "Kjjj@lll.com"
                }
            ]

        }
    ]
};
var Price = [10, 2, 5.0, 3.2, 55];

(function () {
    var MyApp = angular.module('todoApp', []);

    MyApp.controller("UserCtrl", ['$scope','$http', function ($scope,$http) {
        var store = $scope;
        $scope.users = user.users;

        alert("hiii");
        $http.get('http://localhost:8080/api/todo.json').success(function (data) {
           $scope.store=(data[0].id);
        }).error(function () {
            alert("Some Error Ocuured")
        });
        $scope.amount = Price
    }]);
    MyApp.controller('PanelCtrl', function ($scope) {
        //$scope.tab = 3;
        $scope.selectTab = function (setTab) {
            $scope.tab = setTab;
        };
        $scope.isSelected = function (check) {
            return $scope.tab === check;
        };
        //$scope.reviews = user.reviews;
    });

    MyApp.directive("color", function () {
        return {
            restrict: 'A',
            link: function (scope, element) {
                var colors = ['yellow', 'blue', 'green'];
                element.css('background-color', colors[Math.floor((Math.random() * 3) + 1)]);
            }
        }
    });

    MyApp.directive("bindIt", function () {
        return function (scope, element) {

        }
    });

    MyApp.controller("ReviewCtrl", function ($scope) {
        $scope.review = {};
        $scope.addReview = function (user1) {
            user1.reviews.push($scope.review);
            $scope.review = {};
        };
    });


})();
