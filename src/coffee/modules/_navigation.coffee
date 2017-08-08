class Navigation extends MLP.apps.MLPModule

  init: ->

    super()
    @el.nav = $('.c-nav--desktop')
    @el.audioBtn = $('.c-nav--mobile .c-nav__btn-audio')
    @events()

  events: ->
    $window = $(window)

    if document.body.scrollTop > 0
      @el.nav.addClass 'is-active'
      @el.audioBtn.addClass 'is-active'
      
    $window.scroll =>
      height = 1
      
      if $window.scrollTop() > height
        @el.nav.addClass 'is-active'
      else
        @el.nav.removeClass 'is-active'

      if $window.width() <= 750 && $window.scrollTop() > height
        @el.audioBtn.addClass 'is-active'
      else
        @el.audioBtn.removeClass 'is-active'
        
## Add plugin to jQuery namespace.
$.mlpPlugin(Navigation, 'Navigation', true)