(function () {
    'use strict';

    angular
        .module('imageCrmApp')
        .factory('AuthenticationService', AuthenticationService);

    AuthenticationService.$inject = ['$http', '$cookies', '$rootScope', '$timeout', 'Base64Service'];
    function AuthenticationService($http, $cookies, $rootScope, $timeout, Base64Service) {
        var service = {};

        service.SetCredentials = SetCredentials;
        service.ClearCredentials = ClearCredentials;

        return service;

        function SetCredentials(loggedInUser) {
            $rootScope.globals = {
                currentUser: {
                    apiKey: loggedInUser.apiKey
                }
            };

            // set default auth header for http requests
            $http.defaults.headers.common['Authorization'] = 'Basic ' + loggedInUser.apiKey;

            // store user details in globals cookie that keeps user logged in for 1 week (or until they logout)
            var cookieExp = new Date();
            cookieExp.setDate(cookieExp.getDate() + 7);
            $cookies.putObject('globals', $rootScope.globals, { expires: cookieExp });
        }

        function ClearCredentials() {
            $rootScope.globals = {};
            $cookies.remove('globals');
            $http.defaults.headers.common.Authorization = 'Basic';
        }
    }    

})();