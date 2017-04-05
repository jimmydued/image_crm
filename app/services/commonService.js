(function () {
    'use strict';

    angular
        .module('imageCrmApp')
        .factory('CommonService', CommonService);

    CommonService.$inject = ['$http','$window','_'];
    function CommonService($http,$window,_) {

        var service = {};

        service.postData    = postData;
        
        service.getData     = getData;

        service.checkElementLength  =   checkElementLength;
        
        return service;

        function postData(postUrl,data) {
            return $http.post(postUrl, data).then(handleSuccess, handleError('Error creating user'));
        }
        
        function getData(getUrl) {
            return $http.get(getUrl).then(handleSuccess, handleError('Error creating user'));
        }

        function checkElementLength(objectToCheck,elementId){            
            var result = _.has(objectToCheck,elementId);            
            if(result && objectToCheck[elementId]){
                result = false;
            }
            else
            {
                result = true;
            }
            return result;            
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
