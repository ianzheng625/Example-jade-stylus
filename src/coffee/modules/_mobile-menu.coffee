class MobileMenu extends MLP.apps.MLPModule


  init: ->
    super()
    @el.openBtn = @el.target.find('.js-btn-open')
    @el.closeBtn = @el.target.siblings('.c-nav__menu').find('.js-btn-close')
    @events()
  events: ->

    @el.openBtn.click =>
      @el.target.addClass @classes.active

    @el.closeBtn.click =>
      @el.target.removeClass @classes.active

        
## Add plugin to jQuery namespace.
$.mlpPlugin(MobileMenu, 'MobileMenu', true)