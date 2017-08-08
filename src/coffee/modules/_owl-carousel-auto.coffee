class OwlCarouselAuto extends MLP.apps.MLPModule


  init: ->
    @setup()

  setup: ->
    
    @el.target.owlCarousel
      navigation: true
      navigationText: ["",""]
      slideSpeed: 500
      paginationSpeed: 800
      singleItem: true
      autoPlay: 5000
      stopOnHover: true
    return


## Add plugin to jQuery namespace.
$.mlpPlugin(OwlCarouselAuto, 'OwlCarouselAuto', true)