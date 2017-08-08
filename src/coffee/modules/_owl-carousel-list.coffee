class OwlCarouselList extends MLP.apps.MLPModule


  init: ->
    @setup()

  setup: ->
    
    @el.target.owlCarousel
      slideSpeed: 300
      paginationSpeed: 800
      singleItem: true
      paginationNumbers: true
    return


## Add plugin to jQuery namespace.
$.mlpPlugin(OwlCarouselList, 'OwlCarouselList', true)