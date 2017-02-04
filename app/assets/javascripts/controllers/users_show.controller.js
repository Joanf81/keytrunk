app.controller('UsersShowController', function($scope, $routeParams, usersService) {

    usersService.showUsers($routeParams.idUser,
        //success:
        function(response) {
            alert(response.data);
            $scope.user = response.data;
        },

        //error:
        function() {
            alert("error")
            $scope.error = "Error showing user with id= " + $routeParams.idUser;
        });
});