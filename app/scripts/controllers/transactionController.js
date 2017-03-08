(function () {
    'use strict';
	angular.module('imageCrmApp', ['ui.grid']);
	
	angular
        .module('imageCrmApp')
        .controller('TransactionController', TransactionController);

    TransactionController.$inject = ['$location'];

    function TransactionController($location) {
		console.log("kappu here");
		
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
