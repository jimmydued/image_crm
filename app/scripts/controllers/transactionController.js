(function () {
    'use strict';
    
    angular
        .module('imageCrmApp')
        .controller('TransacCtrl', TransacCtrl);

    TransacCtrl.$inject = ['$location','$rootScope', 'apiUrl', 'CommonService'];

    function TransacCtrl($location, $rootScope, apiUrl, CommonService) {

        var vm  =   this;
        
        CommonService.postData(apiUrl+"transactions.php",$rootScope.globals.currentUser)
                    .then(function (gridData) {
                        if (gridData.error==false) {
                            vm.gridDataOptions = gridData.data;
                        }
        });
                
        vm.gridOptions = {
            enableRowHeaderSelection : false,
            enableCellEdit: false, 
            data: vm.gridDataOptions,
            colDef: [
                  {field: 'firstName'},
                  {field: 'lastName'},
                  {field: 'company'},
                  {field: 'employed'},
            ]
        };
    }
    
})();
