class OwlCarousel extends MLP.apps.MLPModule


  init: ->
    @setup()

  setup: ->
    
    @el.target.owlCarousel
      navigation: true
      navigationText: ["",""]
      slideSpeed: 300
      paginationSpeed: 800
      singleItem: true

    return


## Add plugin to jQuery namespace.
$.mlpPlugin(OwlCarousel, 'OwlCarousel', true)