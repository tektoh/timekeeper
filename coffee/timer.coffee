define [
  'angular'
  ], (angular) ->
    timer = angular.module 'timer', [
      'ngRoute'
      'controllers.HomeCtrl'
      'controllers.TimerCtrl'
    ]
    
    timer.factory 'timer', ['$timeout', ($timeout) ->
      promise = null
      return {
        interval: (func)->
          startTime = Date.now()
          tick = =>
            msec = Data.now() - startTime
            if func Math.floor(msec / 1000)
              @promise = $timeout tick, 1000 - (msec % 1000)
          tick()
          
        stop: ->
          if promise isnt null
            $timeout.cancel promise
            promise = null
      }
      
    timer.factory 'phase', ->
      return {
        ready: 'ready'
        presentation: 'presentation'
        discussion: 'discussion'
        state: null
        
        reset: ->
          @state = @ready
          
        next: ->
          if @state is @ready
            @state = @presentation
          else if @state is @.presentation
            @state = @discussion
          else
            @state = @ready
          return @state
      }
      
    timer.fillter 'zeropad', ->
      return (input) ->
        if angular.isNumber(input) and input < 10
          input = '0' + input
        return input;

    timer.controller 'TimerCtrl', ['$window', 'timer', 'phase', ($window, timer, phase)->
      @presentations = [
        { min: 3, label: "3分" }
        { min: 5, label: "5分" }
        { min: 10, label: "10分" }
      ]
      @discussions = [
        { min: 2, label: "2分" }
        { min: 3, label: "3分" }
        { min: 5, label: "5分" }
      ]
      @presentationMin = 5
      @discussionMin = 3
      @fullscreenEnabled = document.fullscreenEnabled || document.webkitFullscreenEnabled || document.mozFullScreenEnabled || document.msFullscreenEnabled
      
      @reset = =>
        phase.reset()
        timer.stop()
        min = @presentationMin
        discussion = @discussionMin
    ]
  ]