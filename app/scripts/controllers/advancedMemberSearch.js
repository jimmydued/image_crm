(function () {
    'use strict';
	
	angular
        .module('imageCrmApp')
        .controller('AdvancedMemberSearchCtrl', AdvancedMemberSearchCtrl);

    AdvancedMemberSearchCtrl.$inject = ['$location','uiGridGroupingConstants'];

    function AdvancedMemberSearchCtrl($location,uiGridGroupingConstants) {
		
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
                          name: 'date'
						},
						{field: 'castDateTime'},
						{field: 'package'},
						{field: 'plan'},
                        {
                            field: 'status',
                            editType: 'dropdown'
                        },
                        {
                            field: 'action'
						}

            ]
        };
    }
	
})();
