(function () {
    'use strict';
	
	angular
        .module('imageCrmApp')
        .controller('AbandondCartListCtrl', AbandondCartListCtrl);

    AbandondCartListCtrl.$inject = ['uiGridGroupingConstants','$rootScope', 'apiUrl','CommonService','$scope','$http'];

    function AbandondCartListCtrl(uiGridGroupingConstants, $rootScope, apiUrl, CommonService, $scope, $http) {
		
		$scope.showMe = function(){
            alert("i am here");
        };

        $scope.gridOptions = {};

        $scope.dataLoading = true;
        
         
        /*This method is callback when we are dealing with asynchronus http calls.*/
        function parseData(response){
            
            if(response.data!=null){
                response.data = [response.data];
            }
            
            $scope.gridOptions.data     = response.data;

            $scope.gridOptions.columnDefs   = [
                                {
                                    field: 'created',
                                    type: 'date',
                                    cellFilter: 'date:\'MM/dd/yyyy\'',
                                    grouping: { groupPriority: 0 }, 
                                    sort: { priority: 0, direction: 'desc' }, 
                                    width: '18%', 
                                    cellTemplate: '<div><div ng-if="!col.grouping || col.grouping.groupPriority === undefined || col.grouping.groupPriority === null || ( row.groupHeader && col.grouping.groupPriority === row.treeLevel )" class="ui-grid-cell-contents" title="TOOLTIP">{{COL_FIELD CUSTOM_FILTERS}}</div></div>' },
                                    { 
                                        name: 'id', treeAggregation: { type: uiGridGroupingConstants.aggregation.AVG 
                                    } 
                                },
                                {field: 'name'},
                                {field: 'keywords'},
                                {field: 'price'},
                                {field: 'img_sizes'},
                                {field: 'active'},
                                {field: 'product_video'},
                                {
                                    field: 'action',
                                    cellTemplate:'<button ng-if="row.treeLevel!=0" class="btn btn-danger btn-xs grid-bttn-align" ng-click="grid.appScope.showMe()">Update</button>'
                                }
                            ];

            $scope.dataLoading = false;
        } 

        CommonService.postData(apiUrl+"abandonedCart.php",{apiKey: $rootScope.globals.currentUser.apiKey})
                    .then(function (gridData) {
                        if (gridData.error==false) {
                            parseData(gridData);
                        } 
        });

    }
	
})();
