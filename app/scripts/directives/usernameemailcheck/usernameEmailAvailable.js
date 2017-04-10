'use strict';

/**
 * @ngdoc directive
 * @name izzyposWebApp.directive:uiGrid
 * @description
 * # uiGridDirective
 */
angular.module('imageCrmApp')
  .directive('usernameEmailAvailable',function($http,CommonService,apiUrl){
    return {
          restrict: 'AE',
                require: 'ngModel',
          scope: {
            options : '=',
          },
          link: function(scope, elm, attr, model) {
            
            model.$asyncValidators.usernameEmailExists = function() { 
              var postData = {};
              postData                = $http.defaults.headers.common.Authorization;
              postData.checkParam     = model.$viewValue;
              postData.operationType  = "getUsernameEmail";
              console.log(model.$name);                      
              return CommonService.postData(apiUrl+"crmMember.php",postData).then(function (fetchData) {
                  if (fetchData.error==false)
                  {
                     model.$setValidity('usernameExists', fetchData.data); 
                  } 
              });
            };
          }
      }
  });


