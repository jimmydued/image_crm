(function () {
    'use strict';
    
    angular
        .module('imageCrmApp')
        .controller('AddCrmUserCtrl', AddCrmUserCtrl);

    AddCrmUserCtrl.$inject = ['CommonService','$rootScope','apiUrl','$scope','dateFormat'];

    function AddCrmUserCtrl(CommonService,$rootScope,apiUrl,$scope,dateFormat) {
        
        var vm  =   this;

        vm.formData = {};

        vm.formData.apiKey  = $rootScope.globals.currentUser.apiKey;

        vm.formData.type    = $rootScope.globals.currentUser.type;

        $scope.gridOptions = {};

        $scope.dataLoading = true;

        vm.formData.operationType   =   "get";
        
        /*This method is callback when we are dealing with asynchronus http calls.*/
        function parseData(response){
            
            $scope.gridOptions.data = response.data;

            $scope.gridOptions.columnDefs  =  [
                                {field: 'username'},
                                {field: 'firstname'},
                                {field: 'lastname'},
                                {field: 'email'},
                                {field: 'status'},
                                {field: 'type'}
                            ];

            $scope.dataLoading = false;
        }

        $scope.addCrmMember = function(){

            vm.formData.operationType   =   "set";
            
            CommonService.postData(apiUrl+"crmMember.php",vm.formData)
                    .then(function (searchedData) {
                        if (searchedData.error==false) {
                            parseData(searchedData);
                        } 
            });
        };

        CommonService.postData(apiUrl+"crmMember.php",vm.formData)
            .then(function (crmUserData) {
                if (crmUserData.error==false) {
                    parseData(crmUserData);
                } 
        });
    }
    
})();
