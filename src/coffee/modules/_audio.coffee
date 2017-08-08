class AudioButton extends MLP.apps.MLPModule


  init: ->
    super()
    @events()

  events: ->

    playBtn = @el.target
    music = document.getElementById('bgMusic')
    $audioOpen = $('.c-nav__btn-audio')
    playBtn.click -> 
      if playBtn.hasClass('play')
        music.pause()
        $audioOpen.toggleClass('play')
      else
        music.play()
        $audioOpen.toggleClass('play')

        
## Add plugin to jQuery namespace.
$.mlpPlugin(AudioButton, 'AudioButton', true)