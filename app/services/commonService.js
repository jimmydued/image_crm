(function () {
    'use strict';

    angular
        .module('imageCrmApp')
        .factory('CommonService', CommonService);

    CommonService.$inject = ['$http','$window'];
    function CommonService($http,$window) {

        var service = {};

        service.postData    = postData;
        
        service.getData     = getData;

        service.setFocus    = setFocus;
        
        return service;

        function postData(postUrl,data) {
            return $http.post(postUrl, data).then(handleSuccess, handleError('Error creating user'));
        }
        
        function getData(getUrl) {
            return $http.get(getUrl).then(handleSuccess, handleError('Error creating user'));
        }

        function setFocus(id){
            var element = $window.document.getElementById(id);
            var alignWithTop = true;
            element.scrollIntoView(alignWithTop);
            return true;
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
