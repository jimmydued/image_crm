(function () {
    'use strict';
    
    angular
        .module('imageCrmApp')
        .controller('AddCrmProductCtrl', AddCrmProductCtrl);

    AddCrmProductCtrl.$inject = ['CommonService','$rootScope','apiUrl','$scope','dateFormat','_'];

    function AddCrmProductCtrl(CommonService,$rootScope,apiUrl,$scope,dateFormat,_) {
        
        var vm  =   this;

        vm.formData = {};

        $scope.gridOptions = {};

        $scope.dataLoading = true;

        vm.formData.operationType   =   "get";

        $scope.buttonText           =   "Add Product";

         (function initController() {
            defaultParamSetup();
        })();

        function defaultParamSetup(){            
            vm.formData.apiKey   = $rootScope.globals.currentUser.apiKey;
            vm.formData.type     = $rootScope.globals.currentUser.type;
        }

        $scope.editProduct = function(rowId){
            vm.formData.id = rowId;
            CommonService.postData(apiUrl+"crmProducts.php",vm.formData)
                    .then(function (editData) {
                        if (editData.error==false) {
                            parseUserInformatioData(editData);
                        } 
            });
        };        

        /*This method is callback when we are dealing with asynchronus http calls.*/
        function parseProductInformatioData(response){            
            vm.formData                 = _.extend(vm.formData, response.data[0]);
            $scope.buttonText           =   "Update Product";
            $scope.dataLoading          = false;
        }

        $scope.resetFormToAddProduct       =   function(){            
            $scope.buttonText           =   "Add Product";
            vm.formData = {};
            defaultParamSetup();               
        };

        /*This method is used set up the Grid on Page Load Event.*/
        function parseData(response){
            
            $scope.gridOptions.data = response.data;


            $scope.gridOptions.columnDefs  =  [
                                {field: 'name'},
                                { field: 'keywords' },                              
                                {field: 'price'},
                                {field: 'active'},                               
                                {
                                    field: 'action',
                                    cellTemplate:'<button class="btn btn-success btn-xs" ng-click="grid.appScope.editUser(row.entity.id)">Edit</button>  <button class="btn btn-danger btn-xs" ng-click="grid.appScope.deleteUser()">Delete</button>'
                                }
                            ];

            $scope.dataLoading = false;
            $scope.resetFormToAddProduct();
        }

        $scope.addUpdateCrmProduct = function(){

            CommonService.showHideImage($scope);

            if(vm.formData.id){
                vm.formData.operationType   =   "updateProduct";
            }
            else{
                vm.formData.operationType   =   "set";
            }
            
            CommonService.postData(apiUrl+"crmProducts.php",vm.formData)
                    .then(function (addUpdateData) {
                        if (addUpdateData.error==false) {
                            parseData(addUpdateData);
                        } 
            });
        };

        CommonService.postData(apiUrl+"crmProducts.php",vm.formData)
            .then(function (crmProductData) {
                if (crmProductData.error==false) {
                    parseData(crmProductData);
                } 
        });

        $scope.commonService = CommonService; 
    }
    
})();
