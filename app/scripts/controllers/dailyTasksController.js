(function () {
    'use strict';
	
	angular
        .module('imageCrmApp')
        .controller('DailyTasksCtrl', DailyTasksCtrl);

    DailyTasksCtrl.$inject = ['$location'];

    function DailyTasksCtrl($location) {
		
		var vm 	=	this; 
        vm.myData = [
            {
                "firstName": "Cox",
                "lastName": "Carney",
                "company": "Enormo",
                "employed": true
            },
            {
                "firstName": "Lorraine",
                "lastName": "Wise",
                "company": "Comveyer",
                "employed": false
            },
        ];
		
		vm.firstOptions = {
            data: vm.myData,
			colDef: [
                  {field: 'firstName'},
                  {field: 'lastName'},
				  {field: 'company'},
				  {field: 'employed'},
            ]
        };
    }
	
})();
