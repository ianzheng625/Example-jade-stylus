class ChangePage extends MLP.apps.MLPModule


  init: ->
    super()
    @el.changeBtn = $('.js-change-button')
    @el.openPage = $('.js-change-page')
    @events()
  
  events: ->
    num = @el.changeBtn.length
    blockWidth = 100 / num + '%'

    @el.changeBtn.css('width', blockWidth)

    _this = @
    @el.changeBtn.click ->
      i = _this.el.changeBtn.index(this)
      _this.el.changeBtn.removeClass _this.classes.active
      _this.el.openPage.removeClass _this.classes.active
      _this.el.changeBtn.eq(i).addClass _this.classes.active
      _this.el.openPage.eq(i).addClass _this.classes.active
    
        
## Add plugin to jQuery namespace.
$.mlpPlugin(ChangePage, 'ChangePage', true)