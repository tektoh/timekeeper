define [
  'angular'
  'angularRoute'
  'controllers/HomeCtrl'
  'controllers/TimerCtrl'
  ], (angular) ->
    app = angular.module 'app', [
      'ngRoute'
      'controllers.HomeCtrl'
      'controllers.TimerCtrl'
    ]
    app.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider)->
      $routeProvider.when '/', {
        templateUrl: '/html/home.html'
        controller: 'HomeCtrl'
      }
      
      $locationProvider.html5Mode
        enabled: yes
        requireBase: false
  ]