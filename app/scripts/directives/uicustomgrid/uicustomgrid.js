'use strict';

/**
 * @ngdoc directive
 * @name izzyposWebApp.directive:uiGrid
 * @description
 * # uiGridDirective
 */
angular.module('imageCrmApp')
	.directive('uiCustomGrid',function(){
		return {
					templateUrl : 'scripts/directives/uicustomgrid/gridTemplate.html',
					restrict: 'E',
					scope: {
					  options : '=',
					},
					controllerAs : 'vm',
					link: function(scope, element, attrs) {					
						scope.gridOptions = {
							data: scope.options.data, //private scoped from options : '=',
							columnDefs: scope.options.colDef, // optional setting or default setting
						};
					}
			}
	});


