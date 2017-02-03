app.controller('UsersNewController', function($scope, usersService) {

    $scope.users_create = function() {

        var formData = {
            user: $scope.user,
            email: $scope.email,
            pass: $scope.pass,
        }

        usersService.createUsers(formData,

            // Success:
            function() {
                window.location = "#/";
            },
            // Error:
            function() {
                alert('Error creating user');
            });
    };

});