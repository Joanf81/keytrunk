var app = angular.module('app', ['ngRoute', 'ngStorage', 'templates']);

app.config(function ($routeProvider) {
    $routeProvider
        .when('/', {
            controller: 'welcomeController',
            templateUrl: 'welcome.template.html'
        })
        .otherwise({
            redirectTo: '/'
        });
});

app.controller('mc', function($rootScope, $location) {

    $rootScope.go = function(url) {

        $location.path(url);
    }
});
