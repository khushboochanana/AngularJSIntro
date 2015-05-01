var MyApp = angular.module('todoApp', ['ui.router']).config(['$stateProvider', function ($stateProvider) {
    $stateProvider
        .state('login', {
            views: {
                "modal": {
                    templateUrl: "/todoLogin/todoApp",
                    controller: 'TodoCtrl'
                }
            }
        });
}]);

/*.config(['$routeProvider', '$locationProvider',

 function ($routeProvider, $locationProvider) {
 $routeProvider
 .when('/', {
 templateUrl: '/todoLogin/login',
 controller: 'LoginCtrl'
 })
 .when('/todoLogin/login', {
 templateUrl: '/todoLogin/todoApp',
 controller: 'TodoCtrl'
 });
 $locationProvider.html5Mode(true);
 }]);*/


MyApp.controller("LoginCtrl", ['$scope', '$http', '$location', '$state', function ($scope, $http, $location, $state) {
    $scope.getToken = function (username, password) {
        $http.post("http://localhost:8080/rest/login", {
            username: username,
            password: password
        }).success(function (data) {
            console.log(JSON.stringify(data));
            console.log(data.access_token);
            localStorage["authToken"] = data.access_token;
            localStorage['username'] = data.username;
            $state.go("login")
        }).error(function () {
            alert("Error h Error")
        });

        $http.get('http://localhost:8080/rest/user/?access_token=' + localStorage["authToken"]).success(function (data) {
            console.log(JSON.stringify(data));
            for (var i = 0; i < data.length; i++) {
                if (data[i].username == localStorage['username']) {
                    localStorage['userId'] = data[i].id;
                }
            }
        });
    };
}]);

function getLocalToken() {
    return localStorage["authToken"];
}

function getUserName() {
    return localStorage["username"];
}
function getUserId() {
    return localStorage["userId"];
}

MyApp.controller("TodoCtrl", ['$scope', '$http', function ($scope, $http) {
    $scope.userName = getUserName();
    //var TodoList = function () {
    //
    //    $http.get('http://localhost:8080/rest/todo?access_token=' + getLocalToken()).success(function (data) {
    //        $scope.todo = (data);
    //        return $scope.todo
    //    }).error(function () {
    //        alert("Some Error Occurred")
    //    });
    //};


    $scope.addTodo = function (data, priority, collection) {
        var item = {
            task: data,
            completed: false,
            priority: priority,
            collection: collection
        };
        $http.post('http://localhost:8080/rest/todo?access_token=' + getLocalToken(), item).success(function (data) {
            for (var i = 0; i < $scope.groups.length; i++) {
                if ($scope.groups[i].id == collection) {
                    $scope.groups[i].todos.push(data);
                    return
                }
            }
        }).error(function () {
            alert("Some Error Occurred")
        });
    };

    $scope.addTodoGroup = function (data) {
        alert("oyeeee");
        $http.post('http://localhost:8080/rest/abcd?access_token=' + getLocalToken(), {
                name: data,
                todoUser: getUserId(),
                todos: []
            }
        ).
            success(function (data) {
                $scope.groups.push(data);
            }).error(function () {
                alert("Some Error Occurred")
            });
    };
    $http.get('http://localhost:8080/rest/user/' + getUserId() + '?access_token=' + getLocalToken()).success(function (data) {
        $scope.groups = (data).todoGroup;
        console.log(JSON.stringify($scope.todoUser));
    }).error(function () {
        alert("Some Error Occurred")
    });


    $scope.deleteTodo = function (data, collection) {
        $http.delete('http://localhost:8080/rest/todo/' + data.id + '?access_token=' + getLocalToken()).then(function () {
            for (var i = 0; i < $scope.groups.length; i++) {
                if ($scope.groups[i].id == collection.id) {
                    $scope.groups[i].todos.splice($scope.groups[i].todos.indexOf(data), 1)
                }
            }
        });
    };

    $scope.deleteTodoGroup = function (data) {
        $http.delete('http://localhost:8080/rest/abcd/' + data.id + '?access_token=' + getLocalToken()).then(function () {
            $scope.groups.splice($scope.groups.indexOf(data), 1)
        });
    };


    $scope.checkBoxClick = function (check) {
        $http.put('http://localhost:8080/rest/todo/' + check.id + '?access_token=' + getLocalToken(), {
            completed: !(check.completed)
        }).success(function () {
            console.log(check.completed);
        }).error(function () {
            alert("Some Error Occurred")
        });
    };

    //$scope.getTodo = function (item) {
    //    $http.get('http://localhost:8080/rest/todo/' + item.id + '?access_token=' + getLocalToken()).success(function (data) {
    //        console.log(JSON.stringify(data));
    //        alert("or sab badhiya");
    //        $scope.todo = data;
    //    });
    //};
}]);


MyApp.directive("color", function () {
    return {
        restrict: 'A',
        link: function (scope, element) {
            var colors = ['#10E8C6', '#D5FF48', '#FFFF7D', '#FFCFDD', '#FFD548', "#AEFAF8"];
            element.css('background-color', colors[Math.floor((Math.random() * 6))]);
        }
    }
});
