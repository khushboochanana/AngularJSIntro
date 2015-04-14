var user = {
    userName: "Khushboo Chanana",
    images: [{full: "/assets/spinner.gif"}, {full: "/assets/grails_logo.png"}],
    reviews: [
        {
            stars: "",
            body: "",
            author: ""
        }
    ]
};

var Message = [msg = "How", msg = "Are", msg = "You", msg = "????"];

var Price = [10, 2, 5.0, 3.2, 55];

(function () {

    var app = angular.module('todoApp', []);
    app.factory("data", function () {
        return {message: "hello from service"}
    });

    app.factory("hello", function () {
        return {message: "hello................"}
    });

    app.filter("reverse",function(){
        return function(message){
            return message.split("").reverse().join("");
        }
    });

    app.controller('TodoCtrl', function ($scope,data,hello) {
        $scope.todoName = "Enter Your Name";
        $scope.todoPhone = "Enter Your Phone No.";
        //$scope.data = {message: "hiii"};
        $scope.userName = user.userName;
        $scope.show = true;
        $scope.How = Message;
        $scope.amount = Price;
        $scope.images = user.images;
        //$scope.data=data;
        $scope.data=hello;
        $scope.reverseIt=function(message){
            return message.split("").reverse().join("");
        }
    });

    app.controller('PanelCtrl', function ($scope) {
        $scope.tab = 3;
        $scope.selectTab = function (setTab) {
            $scope.tab = setTab;
        };
        $scope.isSelected = function (check) {
            return $scope.tab === check;
        };
        $scope.reviews = user.reviews;
    });

    app.controller('ReviewCtrl', function ($scope) {
        $scope.review = {};
        $scope.addReview = function (add) {
            user.reviews.push(add);
            $scope.review = {};
        };
    });

})();
