(function () {
    'use strict';
	
	angular
        .module('imageCrmApp')
        .controller('AdvancedMemberSearchCtrl', AdvancedMemberSearchCtrl);

    AdvancedMemberSearchCtrl.$inject = ['CommonService','$rootScope','apiUrl','$scope'];

    function AdvancedMemberSearchCtrl(CommonService,$rootScope,apiUrl,$scope) {
		
		var vm 	=	this;

        vm.formData = {};
        
        /*This method is callback when we are dealing with asynchronus http calls.*/
        function parseData(response){
            
            if(response.data!=null){
                response.data = [response.data];
            }

            $scope.gridOptions = {
                data    :  response.data,
                colDef  :  [
                                {field: 'username'},
                                {field: 'firstname'},
                                {field: 'lastname'},
                                {field: 'company'},
                                {field: 'country'},
                                {field: 'city'},
                                {field: 'phone'},
                                {field: 'email'},
                                {field: 'postcode'}
                            ]

            };

            CommonService.setFocus('grid');            
        }    

        $scope.advanceSearch = function(){
            
            vm.formData.apiKey = $rootScope.globals.currentUser.apiKey;
            
            CommonService.postData(apiUrl+"advanceMembers.php",vm.formData)
                    .then(function (searchedData) {
                        if (searchedData.error==false) {
                            parseData(searchedData);
                        } 
            });
        };

        $scope.gridOptions = {
                data    :  []
        };
    }
	
})();
