(function () {
    'use strict';
    
    angular
        .module('imageCrmApp')
        .controller('TransacCtrl', TransacCtrl);

    TransacCtrl.$inject = ['$location','$rootScope', 'apiUrl', 'CommonService','$timeout', '$http', '$scope'];

    function TransacCtrl($location, $rootScope, apiUrl, CommonService, $timeout, $http, $scope) {
        var vm = this;

        function parseData(response){

            vm.gridOptions = {
                enableRowHeaderSelection : false,
                enableCellEdit: false,
                data    :  [response.data],
                colDef  :  [
                                {field: 'id'},
                                {field: 'txn_id'},
                                {field: 'order_total'},
                                {field: 'order_date'},
                                {field: 'order_status'},
                                {field: 'username'}
                            ]

            };

        }              

        function loadData() {

            CommonService.postData(apiUrl+"transactions.php",$rootScope.globals.currentUser)
                    .then(function (gridData) {
                        if (gridData.error==false) {
                            parseData(gridData);
                        }
            });
        };
        
        loadData();
    }
    
})();
