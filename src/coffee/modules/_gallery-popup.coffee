class GalleryPopup extends MLP.apps.MLPModule


  init: ->
    super()
    @el.openBtn = @el.target.find('.js-btn-open')
    @el.closeBtn = @el.target.find('.js-btn-close')
    @el.block = @el.target.find('.c-photo__popup')
    @events()
  
  events: ->

    _this = @
    popupSlider = $('.c-photo__popup--slider .owl-carousel')
    @el.openBtn.click -> 
      index = _this.el.openBtn.index(this)
      popupSlider.trigger('owl.jumpTo', index)
    @el.openBtn.click =>
      @el.block.addClass @classes.active
    @el.closeBtn.click =>
      @el.block.removeClass @classes.active
    $('.c-photo__popup .owl-carousel').click (e) ->
      stopPropagation e
    @el.block.click ->
      $('.c-photo__popup').removeClass 'is-active'

  stopPropagation = (e) ->
    if e.stopPropagation
      e.stopPropagation()
    else
      e.cancelBubble = true
    return
        
## Add plugin to jQuery namespace.
$.mlpPlugin(GalleryPopup, 'GalleryPopup', true)