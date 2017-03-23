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
					replace: false,
					link: function(scope, element, attrs) {					
						scope.gridOptions = {
            				enableRowHeaderSelection  : scope.options.enableRowHeaderSelection ? scope.options.enableRowHeaderSelection : false,
            				enableCellEdit	: scope.options.enableCellEdit ? scope.options.enableCellEdit : false,
							enableSorting   : scope.options.enableSorting ? scope.options.enableSorting : false,
							data: scope.options.data, //private scoped from options : '=',
							columnDefs: scope.options.colDef
						};
					}
			}
	});


