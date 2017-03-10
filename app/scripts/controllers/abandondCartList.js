(function () {
    'use strict';
	
	angular
        .module('imageCrmApp')
        .controller('AbandondCartListCtrl', AbandondCartListCtrl);

    AbandondCartListCtrl.$inject = ['$location','uiGridGroupingConstants'];

    function AbandondCartListCtrl($location,uiGridGroupingConstants) {
		
		var vm 	=	this; 
        vm.myData = [
            {
                "uid": "Cox",
                "castDateTime": "Carney",
                "package": "Enormo",
                "plan": true
            },
            {
                "uid": "Cox",
                "castDateTime": "Carney",
                "package": "Enormo",
                "plan": true
            }
        ];
		
		vm.gridOptions = {
			enableGroupHeaderSelection: true,
            data: vm.myData,
			colDef: [
						{ name: 'uid', grouping: { groupPriority: 0 }, sort: { priority: 0, direction: 'desc' }, width: '18%', 
						  cellTemplate: '<div><div ng-if="!col.grouping || col.grouping.groupPriority === undefined || col.grouping.groupPriority === null || ( row.groupHeader && col.grouping.groupPriority === row.treeLevel )" class="ui-grid-cell-contents" title="TOOLTIP">{{COL_FIELD CUSTOM_FILTERS}}</div></div>' },
						  { name: 'balance', width: '25%', cellFilter: 'currency', treeAggregation: { type: uiGridGroupingConstants.aggregation.AVG }, customTreeAggregationFinalizerFn: function( aggregation ) { 
							aggregation.rendered = aggregation.value; 
						  } 
						},
						{field: 'castDateTime'},
						{field: 'package'},
						{field: 'plan'}
            ]
        };
    }
	
})();
