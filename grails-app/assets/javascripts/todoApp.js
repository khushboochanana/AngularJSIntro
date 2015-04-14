var MyApp = angular.module('todoApp', []);


MyApp.controller("TodoCtrl", ['$scope', '$http', '$interval', function ($scope, $http, $interval) {

    var TodoList = function () {
        $http.get('http://localhost:8080/rest/api/todo.json').success(function (data) {
            $scope.todo = (data);
            return $scope.todo
        }).error(function () {
            alert("Some Error Occurred")
        });
    };


    $scope.userName = "Khushboo Chanana";

    $scope.addTodo = function (data, priority, collection) {
        var item = {
            task: data,
            completed: false,
            priority: priority,
            collection: collection
        };
        $http.post('http://localhost:8080/rest/api/todo.json', item).success(function (data) {
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
        $http.post('http://localhost:8080/rest/api/abcd.json', {name: data, todos: []}).success(function (data) {

            $scope.groups.push(data);
        }).error(function () {
            alert("Some Error Occurred")
        });
    };


    $http.get('http://localhost:8080/rest/api/abcd.json').success(function (data) {
        $scope.groups = (data);
    }).error(function () {
        alert("Some Error Occurred")
    });


    $scope.deleteTodo = function (data, collection) {
        $http.delete('http://localhost:8080/rest/api/todo/' + data.id + '.json').then(function () {
            for (var i = 0; i < $scope.groups.length; i++) {
                if ($scope.groups[i].id == collection.id) {
                    $scope.groups[i].todos.splice($scope.groups[i].todos.indexOf(data), 1)
                }
            }
            //$scope.groups[collection.id - 1].todos.splice($scope.groups[collection.id - 1].todos.indexOf(data), 1)
        });
    };

    $scope.deleteTodoGroup = function (data) {
        $http.delete('http://localhost:8080/rest/api/abcd/' + data.id + '.json').then(function () {
            $scope.groups.splice($scope.groups.indexOf(data), 1)
        });
    };


    $scope.checkBoxClick = function (check) {
        $http.put('http://localhost:8080/rest/api/todo/' + check.id + '.json', {
            completed: !(check.completed)
        }).success(function () {
            console.log(check.completed);
        }).error(function () {
            alert("Some Error Occurred")
        });
    };

    $scope.getTodo = function (item) {
        $http.get('http://localhost:8080/rest/api/todo/' + item.id + '.json').success(function (data) {
            console.log(JSON.stringify(data));
            alert(data.id);
            alert(data.task);
            $scope.todo = data;
        });
    };



}]);


MyApp.directive("color", function () {
    return {
        restrict: 'A',
        link: function (scope, element) {
            var colors = ['#10E8C6', '#D5FF48', '#FFFF7D', '#FFCFDD', '#FFD548',"#AEFAF8"];
            element.css('background-color', colors[Math.floor((Math.random() * 6))]);
        }
    }
});
//MyApp.filter('matchIt', ['$http', function ($http) {
//    alert("outside");
//    return function (item) {
//        alert(item.id);
//        alert("inside return");
//        $http.get('http://localhost:8080/rest/api/todo/' + item.id + '.json').success(function (data) {
//            alert("inside http");
//            alert(data);
//            return data
//        });
//    };
//
//
//}]);