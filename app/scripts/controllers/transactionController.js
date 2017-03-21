(function () {
    'use strict';
	
	angular
        .module('imageCrmApp')
        .controller('TransacCtrl', TransacCtrl);

    TransacCtrl.$inject = ['$location','$rootScope', 'apiUrl', 'CommonService'];

    function TransacCtrl($location, $rootScope, apiUrl, CommonService) {

		var vm 	=	this;
		
		console.log('rootScope',$rootScope.globals.currentUser);
		
		CommonService.postData(apiUrl+"transactions.php",$rootScope.globals.currentUser)
                    .then(function (gridData) {
                        //vm.transactionData = gridData;
						console.log(gridData);
					});
		
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
            enableRowHeaderSelection : false,
            enableCellEdit: false, 
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
