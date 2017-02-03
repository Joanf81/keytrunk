app.factory("usersService", function($http, apiRoutes) {

    return {
        indexUsers: function(success, error) {
            $http.get(apiRoutes.Users).then(success, error);
        },
        showUsers: function(id_user, success, error) {
            $http.get(apiRoutes.Users+'/'+id_user).then(success, error);
        },
        createUsers: function(user, success, error) {
            $http.post(apiRoutes.Users, user).then(success, error);
        },/*
        updateArtista: function(artista_id, artista, success, error) {
            $http.put(ApiRoutes.Artista+'/'+artista_id, artista).success(success).error(error);
        },
        deleteArtista: function(id_artista, success, error) {
            $http.delete(ApiRoutes.Artista+'/'+id_artista).success(success).error(error);
        }*/
    }
});