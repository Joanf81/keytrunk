var app = angular.module('app', ['ngRoute', 'ngStorage', 'templates']);

app.config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            controller: 'welcomeController',
            templateUrl: 'welcome.template.html'
        })
        .when('/users', {
            controller: 'UsersIndexController',
            templateUrl: 'users_index.template.html'
        })
        .when('/users/new', {
            controller: 'UsersNewController',
            templateUrl: 'users_new.template.html'
        })
        .otherwise({
            redirectTo: '/'
        });
});

app.controller('mainController', function($rootScope, $location) {

    $rootScope.go = function(url) {

        $location.path(url);
    }
});
