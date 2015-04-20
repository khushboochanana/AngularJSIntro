var MyApp = angular.module('todoApp', []);


MyApp.controller("LoginCtrl", ['$scope', '$http', function ($scope, $http) {

    $scope.getToken = function (username, password) {

        alert(username);
        $http.post("http://localhost:8080/rest/login", {
            username: username,
            password: password
        }).success(function (data) {
            console.log(JSON.stringify(data));
            console.log(data.access_token);
            localStorage["authToken"] = data.access_token;
            $scope.goBack = function () {
                $location.path("/login");
            }
        }).error(function () {
            alert("Error h Error")
        });
    };
}]);
function getLocalToken() {
    return localStorage["authToken"];
}
MyApp.controller("TodoCtrl", ['$scope', '$http', function ($scope, $http) {

    var TodoList = function () {

        $http.get('http://localhost:8080/rest/todo?access_token=' + getLocalToken()).success(function (data) {
            $scope.todo = (data);
            return $scope.todo
        }).error(function () {
            alert("Some Error Occurred")
        });
    };


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
        $http.post('http://localhost:8080/rest/abcd?access_token=' + getLocalToken(), {
                name: data,
                todoUser: userId,
                todos: []
            }
        ).
            success(function (data) {

                $scope.groups.push(data);
            }).error(function () {
                alert("Some Error Occurred")
            });
    };
    $http.get('http://localhost:8080/rest/user/' + userId + '?access_token=' + getLocalToken()).success(function (data) {
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

    $scope.getTodo = function (item) {
        $http.get('http://localhost:8080/rest/todo/' + item.id + '?access_token=' + getLocalToken()).success(function (data) {
            console.log(JSON.stringify(data));
            alert(data.id);
            alert(data.task);
            $scope.todo = data;
        });
    };
}])
;


MyApp.directive("color", function () {
    return {
        restrict: 'A',
        link: function (scope, element) {
            var colors = ['#10E8C6', '#D5FF48', '#FFFF7D', '#FFCFDD', '#FFD548', "#AEFAF8"];
            element.css('background-color', colors[Math.floor((Math.random() * 6))]);
        }
    }
});
