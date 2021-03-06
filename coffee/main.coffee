require.config
  baseUrl: '/js'
  paths:
    'jquery': '//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min'
    'bootstrap': '//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.0/js/bootstrap.min'
    'angular': '//cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.0/angular.min'
    'angularRoute': '//cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.0/angular-route.min'
  shim:
    'jquery':
      exports: '$'
    'bootstrap':
      deps: ['jquery']
    'angular':
      deps: ['jquery']
      exports: 'angular'
    'angularRoute':
      deps: ['angular']

require [
  'angular'
  'app'
], (angular)->
  angular.bootstrap document, ['app']