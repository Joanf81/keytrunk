app.controller('UsersIndexController', function($scope, usersService) {

    usersService.indexUsers(
        // success:
        function(response) {
            $scope.users = response.data;
        },
        // error:
        function() {
            $scope.error = "Error indexing users";
        }
    );
});