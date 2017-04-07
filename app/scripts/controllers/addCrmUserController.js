(function () {
    'use strict';
    
    angular
        .module('imageCrmApp')
        .controller('AddCrmUserCtrl', AddCrmUserCtrl);

    AddCrmUserCtrl.$inject = ['CommonService','$rootScope','apiUrl','$scope','dateFormat','_'];

    function AddCrmUserCtrl(CommonService,$rootScope,apiUrl,$scope,dateFormat,_) {
        
        var vm  =   this;

        vm.formData = {};

        $scope.gridOptions = {};

        $scope.dataLoading = true;

        vm.formData.operationType   =   "get";

        $scope.buttonText           =   "Add Member";

         (function initController() {
            defaultParamSetup();
        })();

        function defaultParamSetup(){            
            vm.formData.apiKey   = $rootScope.globals.currentUser.apiKey;
            vm.formData.type     = $rootScope.globals.currentUser.type;
        }

        $scope.editUser = function(rowId){
            vm.formData.id = rowId;
            CommonService.postData(apiUrl+"crmMember.php",vm.formData)
                    .then(function (editData) {
                        if (editData.error==false) {
                            parseUserInformatioData(editData);
                        } 
            });
        };        

        /*This method is callback when we are dealing with asynchronus http calls.*/
        function parseUserInformatioData(response){            
            vm.formData                 = _.extend(vm.formData, response.data[0]);
            $scope.buttonText           =   "Update Member";
            $scope.dataLoading          = false;
        }

        $scope.resetFormToAddUser       =   function(){            
            $scope.buttonText           =   "Add Member";
            vm.formData = {};
            defaultParamSetup();               
        };

        /*This method is callback when we are dealing with asynchronus http calls.*/
        function parseData(response){
            
            $scope.gridOptions.data = response.data;

            $scope.gridOptions.columnDefs  =  [
                                {field: 'username'},
                                {field: 'firstname'},
                                {field: 'lastname'},
                                {field: 'email'},
                                {field: 'status'},
                                {field: 'type'},
                                {
                                    field: 'action',
                                    cellTemplate:'<button class="btn btn-success btn-xs" ng-click="grid.appScope.editUser(row.entity.id)">Edit</button>  <button class="btn btn-danger btn-xs" ng-click="grid.appScope.deleteUser()">Delete</button>'
                                }
                            ];

            $scope.dataLoading = false;
            $scope.resetFormToAddUser();
        }

        $scope.addUpdateCrmMember = function(){

            CommonService.showHideImage($scope);

            if(vm.formData.id){
                vm.formData.operationType   =   "updateUser";
            }
            else{
                vm.formData.operationType   =   "set";
            }
            
            CommonService.postData(apiUrl+"crmMember.php",vm.formData)
                    .then(function (addUpdateData) {
                        if (addUpdateData.error==false) {
                            parseData(addUpdateData);
                        } 
            });
        };

        CommonService.postData(apiUrl+"crmMember.php",vm.formData)
            .then(function (crmUserData) {
                if (crmUserData.error==false) {
                    parseData(crmUserData);
                } 
        });

        $scope.commonService = CommonService; 
    }
    
})();
