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
                "date":"2016-06-01",
                "uid": "Cox",
                "castDateTime": "Carney",
                "package": "Enormo",
                "plan": true
            },
            {
                "date":"2016-06-01",
                "uid": "Present",
                "castDateTime": "Carney",
                "package": "Enormo",
                "plan": true
            },
            {
                "date":"2016-06-02",
                "uid": "FebPresent",
                "castDateTime": "FebPresent",
                "package": "Enormo",
                "plan": true
            },
            {
                "date":"2016-06-02",
                "uid": "FebPresent",
                "castDateTime": "FebPresent",
                "package": "Enormo",
                "plan": true
            }
        ];
		
		vm.gridOptions = {
            enableRowHeaderSelection : false,
            enableCellEdit: false,
			data: vm.myData,
			colDef: [
						{ 
                          name: 'date', grouping: { groupPriority: 0 }, sort: { priority: 0, direction: 'desc' }, width: '18%', 
						  cellTemplate: '<div><div ng-if="!col.grouping || col.grouping.groupPriority === undefined || col.grouping.groupPriority === null || ( row.groupHeader && col.grouping.groupPriority === row.treeLevel )" class="ui-grid-cell-contents" title="TOOLTIP">{{COL_FIELD CUSTOM_FILTERS}}</div></div>' },
						  { 
                            name: 'uid', treeAggregation: { type: uiGridGroupingConstants.aggregation.AVG }, customTreeAggregationFinalizerFn: function( aggregation ) { 
							aggregation.rendered = aggregation.value; 
						  } 
						},
						{field: 'castDateTime'},
						{field: 'package'},
						{field: 'plan'},
                        {
                            field: 'status',
                            editType: 'dropdown',
                            enableCellEdit: true,
                            editableCellTemplate: 'ui-grid/dropdownEditor',
                            editDropdownOptionsArray: [
                              { id: 0, value: 'Pending' },
                              { id: 1, value: 'Started' }
                            ]
                        },
                        {
                            field: 'action',
                            cellTemplate:'<button type="button" ng-if="row.treeLevel!=0" class="btn btn-danger btn-xs grid-bttn-align">Update</button>'
                        }

            ]
        };
    }
	
})();
