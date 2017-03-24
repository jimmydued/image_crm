(function () {
    'use strict';
	
	angular
        .module('imageCrmApp')
        .controller('AbandondCartListCtrl', AbandondCartListCtrl);

    AbandondCartListCtrl.$inject = ['uiGridGroupingConstants','$rootScope', 'apiUrl','CommonService','$scope'];

    function AbandondCartListCtrl(uiGridGroupingConstants, $rootScope, apiUrl, CommonService, $scope) {
		
		var vm = this;

        vm.editUser = function() {
            alert('It works!');
        }

        /*This method is callback when we are dealing with asynchronus http calls.*/
        function parseData(response){
            vm.gridOptions = {
                data    :  [response.data],
                appScopeProvider: vm,
                colDef  :  [
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
                                    cellTemplate:'<button ng-if="row.treeLevel!=0" class="btn btn-danger btn-xs grid-bttn-align" onclick="console.log(this);">Update</button>'
                                }
                            ]

            };
        }              

        /*This method actually loading the data from service.*/
        function loadData() {

            CommonService.postData(apiUrl+"abandonedCart.php",$rootScope.globals.currentUser)
                    .then(function (gridData) {
                        if (gridData.error==false) {
                            parseData(gridData);
                        } 
            });
        };
        
        loadData();
    }
	
})();
