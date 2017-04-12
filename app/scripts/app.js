'use strict';
/**
 * @ngdoc overview
 * @name imageCrmApp
 * @description
 * # imageCrmApp
 *
 * Main module of the application.
 */
angular
  .module('imageCrmApp', [
    'oc.lazyLoad',
    'ui.router',
    'ui.bootstrap',
    'angular-loading-bar',
    'ngCookies',
    'ui.grid',
    'ui.grid.grouping', 
    'ui.grid.edit', 
    'datePicker',
  ])
  .config(['$stateProvider','$urlRouterProvider','$ocLazyLoadProvider', '$httpProvider',function ($stateProvider,$urlRouterProvider,$ocLazyLoadProvider,$httpProvider) {
    
    $ocLazyLoadProvider.config({
      debug:false,
      events:true,
    });

    $urlRouterProvider.otherwise('/dashboard/home');

    $stateProvider
      .state('dashboard', {
        url:'/dashboard',
        templateUrl: 'views/dashboard/main.html',
        resolve: {
            loadMyDirectives:["$ocLazyLoad", function($ocLazyLoad){
                return $ocLazyLoad.load(
                {
                    name:'imageCrmApp',
                    files:[
                    'scripts/directives/header/header.js',
                    'scripts/directives/header/header-notification/header-notification.js',
                    'scripts/directives/sidebar/sidebar.js',
                    'scripts/directives/sidebar/sidebar-search/sidebar-search.js'
                    ]
                }),
                $ocLazyLoad.load(
                {
                   name:'toggle-switch',
                   files:["bower_components/angular-toggle-switch/angular-toggle-switch.min.js",
                          "bower_components/angular-toggle-switch/angular-toggle-switch.css"
                      ]
                }),
                $ocLazyLoad.load(
                {
                  name:'ngAnimate',
                  files:['bower_components/angular-animate/angular-animate.js']
                })
                $ocLazyLoad.load(
                {
                  name:'ngCookies',
                  files:['bower_components/angular-cookies/angular-cookies.js']
                })
                $ocLazyLoad.load(
                {
                  name:'ngResource',
                  files:['bower_components/angular-resource/angular-resource.js']
                })
                $ocLazyLoad.load(
                {
                  name:'ngSanitize',
                  files:['bower_components/angular-sanitize/angular-sanitize.js']
                })
                $ocLazyLoad.load(
                {
                  name:'ngTouch',
                  files:['bower_components/angular-touch/angular-touch.js']
                })
            }]
        }
    })
    
    .state('dashboard.home',{
        url:'/home',
        controller: 'MainCtrl',
        templateUrl:'views/dashboard/home.html',
        resolve: {
          loadMyFiles:["$ocLazyLoad", function($ocLazyLoad) {
            return $ocLazyLoad.load({
              name:'imageCrmApp',
              files:[
              'scripts/controllers/main.js',
              'scripts/directives/timeline/timeline.js',
              'scripts/directives/notifications/notifications.js',
              'scripts/directives/chat/chat.js',
              'scripts/directives/dashboard/stats/stats.js'
              ]
            })
          }]
        }
      })
      
      .state('dashboard.form',{
        templateUrl:'views/form.html',
        url:'/form'
      })

      .state('dashboard.blank',{
        templateUrl:'views/pages/blank.html',
        url:'/blank'
      })
    
      .state('login',{
        templateUrl:'views/pages/login.html',
        url:'/login',
        controller:'LoginCtrl',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[                                    
                                    'services/user.service.js',
                                    'services/authentication.service.js',
                                    'services/flash.service.js',
                                    'services/base64Service.js',
                                    'scripts/controllers/loginController.js'
                                  ] 
                              })
                  }
                ]
          }
    })  

      .state('sign-up',{
         templateUrl:'views/pages/sign-up.html',
         url:'/sign-up'
    })

      .state('forgotpassword',{
        templateUrl:'views/pages/forgotpassword.html',
        url:'/forgotpassword'
    })

    .state('dashboard.transaction',{
        templateUrl:'views/transaction.html',
        url:'/transaction',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[
                                          'services/commonService.js',
                                          'scripts/controllers/transactionController.js',
                                          'scripts/directives/uicustomgrid/uicustomgrid.js'
                                        ] 
                              })
                  }
                ]
          }
    })

    .state('dashboard.daily-tasks',{
        templateUrl:'views/daily-tasks.html',
        url:'/daily-tasks',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[
                                    'scripts/controllers/DailyTasksController.js',
                                    'scripts/directives/uicustomgrid/uicustomgrid.js'
                                  ] 
                              })
                  }
                ]
          }
    })  
    
    .state('dashboard.abandondCartList',{
        templateUrl:'views/abandondcartlist.html',
        url:'/abandondCartList',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[
                                    'scripts/controllers/abandondCartListController.js',
                                    'scripts/directives/uicustomgrid/uicustomgrid.js'
                                  ] 
                              })
                  }
                ]
         }       
      })


    .state('dashboard.advancedMemberSearch',{
        templateUrl:'views/advancedMemberSearch.html',
        url:'/advancedMemberSearch',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[                       
                                    'scripts/controllers/advancedMemberSearchController.js',
                                    'scripts/directives/uicustomgrid/uicustomgrid.js'
                                  ] 
                              })
                    }
                ]
          }
    })

    .state('dashboard.searchClientInformation',{
        templateUrl:'views/searchClientInformation.html',
        url:'/searchClientInformation',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[
                                    'scripts/controllers/searchClientInformationController.js',
                                    'scripts/directives/uicustomgrid/uicustomgrid.js'
                                  ] 
                              })
                  }
                ]
          }
    })

    .state('dashboard.transactionSearch',{
        templateUrl:'views/transactionSearch.html',
        url:'/transactionSearch',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[
                                    'scripts/controllers/transactionSearchController.js',
                                    'scripts/directives/uicustomgrid/uicustomgrid.js'
                                  ] 
                              })
                  }
                ]
          }
    })  
    
    .state('dashboard.addCrmUser',{
        templateUrl:'views/addCrmUser.html',
        url:'/addCrmUser',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[
                                    'scripts/controllers/addCrmUserController.js',
                                    'scripts/directives/uicustomgrid/uicustomgrid.js'
                                  ] 
                              })
                  }
                ]
          }
    })  
	.state('dashboard.addCrmProduct',{
        templateUrl:'views/addCrmProduct.html',
        url:'/addCrmProduct',
        resolve: {
                    loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
                      return $ocLazyLoad.load({
                                  name:'imageCrmApp',
                                  files:[
                                    'scripts/controllers/addCrmProductController.js',
                                    'scripts/directives/uicustomgrid/uicustomgrid.js'
                                  ] 
                              })
                  }
                ]
          }
    })  
    .state('dashboard.chart',{
        templateUrl:'views/chart.html',
        url:'/chart',
        controller:'ChartCtrl',
        resolve: {
          loadMyFile:["$ocLazyLoad", function($ocLazyLoad) {
            return $ocLazyLoad.load({
              name:'chart.js',
              files:[
                'bower_components/angular-chart.js/dist/angular-chart.min.js',
                'bower_components/angular-chart.js/dist/angular-chart.css'
              ]
            }),
            $ocLazyLoad.load({
                name:'imageCrmApp',
                files:['scripts/controllers/chartContoller.js']
            })
          }]
        }
    })


    
    .state('dashboard.table',{
        templateUrl:'views/table.html',
        url:'/table'
    })
    
    .state('dashboard.panels-wells',{
          templateUrl:'views/ui-elements/panels-wells.html',
          url:'/panels-wells'
      })
    
    .state('dashboard.buttons',{
        templateUrl:'views/ui-elements/buttons.html',
        url:'/buttons'
    })
    
    .state('dashboard.notifications',{
        templateUrl:'views/ui-elements/notifications.html',
        url:'/notifications'
    })
    
    .state('dashboard.typography',{
       templateUrl:'views/ui-elements/typography.html',
       url:'/typography'
   })
   
   .state('dashboard.icons',{
       templateUrl:'views/ui-elements/icons.html',
       url:'/icons'
   })
   
   .state('dashboard.grid',{
       templateUrl:'views/ui-elements/grid.html',
       url:'/grid'
   })

  }])
  .run(run);
    
  /*Code to handle not logged InUser redirection*/
  run.$inject = ['$rootScope', '$location', '$cookies', '$http'];
  
  function run($rootScope, $location, $cookies, $http) {
    
    // keep user logged in after page refresh
    $rootScope.globals = $cookies.getObject('globals') || {};
    
    if($rootScope.globals.currentUser) {
      $http.defaults.headers.common['Authorization'] = $rootScope.globals.currentUser;
    }

    $rootScope.$on('$locationChangeStart', function (event, next, current) {
        // redirect to login page if not logged in and trying to access a restricted page
        var restrictedPage = $.inArray($location.path(), ['/login', '/register']) === -1;
        var loggedIn = $rootScope.globals.currentUser;
        if (restrictedPage && !loggedIn) {
          $location.path('/login');
        }
      
    });
  }

  
