class OwlCarouselPopup extends MLP.apps.MLPModule


  init: ->
    @setup()

  setup: ->
    
    @el.target.owlCarousel
      navigation: true
      navigationText: ["",""]
      slideSpeed: 300
      paginationSpeed: 800
      singleItem: true
      rewindNav: false
      pagination: false
      addClassActive: true
      afterMove: removeBtn
      startDragging: removeBtn
      afterInit: removeBtn
      afterUpdate: removeBtn
    return

  removeBtn = ->
    eventPrevBtn = $('.c-events__popup--slider .owl-buttons .owl-prev')
    eventNextBtn = $('.c-events__popup--slider .owl-buttons .owl-next')
    photoPrevBtn = $('.c-photo__popup--slider .owl-buttons .owl-prev')
    photoNextBtn = $('.c-photo__popup--slider .owl-buttons .owl-next')
    if $('.c-events__popup--slider .owl-wrapper .owl-item:first-child').hasClass 'active'
      eventPrevBtn.css 'display', 'none'
    else
      eventPrevBtn.css 'display', 'block'
    if $('.c-events__popup--slider .owl-wrapper .owl-item:last-child').hasClass 'active'
      eventNextBtn.css 'display', 'none'
    else
      eventNextBtn.css 'display', 'block'
    if $('.c-photo__popup--slider .owl-wrapper .owl-item:first-child').hasClass 'active'
      photoPrevBtn.css 'display', 'none'
    else
      photoPrevBtn.css 'display', 'block'
    if $('.c-photo__popup--slider .owl-wrapper .owl-item:last-child').hasClass 'active'
      photoNextBtn.css 'display', 'none'
    else
      photoNextBtn.css 'display', 'block'

## Add plugin to jQuery namespace.
$.mlpPlugin(OwlCarouselPopup, 'OwlCarouselPopup', true)