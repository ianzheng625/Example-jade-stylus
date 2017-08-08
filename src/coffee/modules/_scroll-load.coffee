class ScrollLoad extends MLP.apps.MLPModule


  init: ->
    @setup()

  setup: ->
    _this = @
    $scrollBlock = @el.target
    $window = $(window)

    $scrollBlock.each ->
      $el = $(this)

      scrollAnimate = ->

        if $window.width() > 750 && $window.scrollTop() + $window.height() > $el.offset().top + 200
          $window.unbind 'scroll', scrollAnimate
          $el.addClass('active')
        return

      $window.bind 'scroll', scrollAnimate
      return

        
## Add plugin to jQuery namespace.
$.mlpPlugin(ScrollLoad, 'ScrollLoad', true)