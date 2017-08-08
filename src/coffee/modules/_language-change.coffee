class LanguageChange extends MLP.apps.MLPModule


  init: ->
    super()
    @el.languageBtn = @el.target.find('a')
    @events()

  # events: ->

  #   _this = @
  #   url = window.location.pathname
  #   en = "en_US"
  #   zh = "zh_CN"
  #   @el.languageBtn.click =>
      
  #     urlLang = url.split("/")[1]

  #     if urlLang == en || urlLang == "en" 

  #       url = url.replace(urlLang,zh)
  #       window.location= url

  #     else if urlLang == zh || urlLang == "zh" 

  #       url = url.replace(urlLang,en)
  #       window.location= url

  #     else 
  #       window.location = '/zh_CN' + url

  events: ->

    _this = @
    url = window.location.host
    href = window.location.href
    en = "com"
    zh = "cn"
    @el.languageBtn.click =>
      
      urlLang = url.substring(url.lastIndexOf(".")+1).toLowerCase()
      urlLang = urlLang.replace("/","")

      if urlLang == en

        href = href.replace(urlLang,zh)
        window.location = href

      else if urlLang == zh

        href = href.replace(urlLang,en)
        window.location = href

      # else 
      #   window.location = '/zh_CN' + url
        
## Add plugin to jQuery namespace.
$.mlpPlugin(LanguageChange, 'LanguageChange', true)