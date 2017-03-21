(function () {
    'use strict';

    angular
        .module('imageCrmApp')
        .factory('CommonService', CommonService);

    CommonService.$inject = ['$http'];
    function CommonService($http) {

        var service = {};

        service.postData = postData;
        
        service.getData = getData;
        
        return service;

        function postData(postUrl,data) {
            return $http.post(postUrl, data).then(handleSuccess, handleError('Error creating user'));
        }
        
        function getData(getUrl) {
            return $http.get(getUrl).then(handleSuccess, handleError('Error creating user'));
        }

        // private functions

        function handleSuccess(res) {
            return res.data;
        }

        function handleError(error) {
            return function () {
                return { success: false, message: error };
            };
        }
    }

})();
