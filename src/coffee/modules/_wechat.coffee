class WeChat extends MLP.apps.MLPModule


  init: ->
    super()
    @el.qrBtn = $('.c-nav__share-wechat')
    @events()
  
  events: ->

    _this = @
    @el.qrBtn.click ->
      $('.c-wechat').addClass 'is-active'
    $('.c-wechat').click ->
      $('.c-wechat').removeClass 'is-active'


        
## Add plugin to jQuery namespace.
$.mlpPlugin(WeChat, 'WeChat', true)