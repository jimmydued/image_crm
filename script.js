var app=angular.module('single-page-app',['ngRoute']);


app.config(function($routeProvider){
      $routeProvider
          .when('/',{
                templateUrl: 'views/home.html'
          })
          .when('/about',{
                templateUrl: 'views/about.html'
          });
});


app.controller('cfgController',function($scope){

      $scope.message="Hello world";

});
