class JoinUs extends MLP.apps.MLPModule


  init: ->
    super()
    @el.joinForm = @el.target.find('#join_form')
    @el.firstImage = @el.target.find('#upload_file_1')
    @el.secondImage = @el.target.find('#upload_file_2')
    @el.fileCv = @el.target.find('#upload_cv')
    @events()
  
  events: ->

    @el.firstImage.change ->
      name = $('#upload_file_1').val()
      files = if !!@files then @files else []
      if !files.length or !window.FileReader
        $('#upload_file_1').parent().removeAttr 'style'
        $('#upload_file_1').siblings('p').css 'display', 'block'
        $('#upload_file_1').parent('.form-field').addClass 'n-invalid'
        return
      fileSize = @files[0].size
      size = fileSize / 1024
      if size > 10000 
        lang = document.getElementsByTagName('html')[0].getAttribute('lang')
        if lang == "zh-CN"
          alert '请上传小于10M的文件'
        else
          alert 'Please upload a smaller file (<10 MB).'
        @val ''
        return
      fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
      if fileName != "png" && fileName != "jpg" && fileName != "jpeg" && fileName != "gif" &&  fileName != "bmp"
        lang = document.getElementsByTagName('html')[0].getAttribute('lang')
        if lang == "zh-CN"
          alert '请上传正确格式的图片文件(bmp, jpg, jpeg, png, gif)'
        else
          alert 'Upload incorrect format image:\n Please upload correct image file (bmp, jpg, jpeg, png, gif).'
        $('#upload_file_1').val() ''
        return
      if /^image/.test(files[0].type)
        reader = new FileReader
        reader.readAsDataURL files[0]
        reader.onloadend = ->
          $('#upload_file_1').parent().css 'background-image', 'url(' + @result + ')'
          $('#upload_file_1').siblings('p').css 'display', 'none'
          $('#upload_file_1').parent('.form-field').removeClass 'n-invalid'
          return
      return

    @el.secondImage.change ->
      name = $('#upload_file_2').val()
      files = if ! !@files then @files else []
      if !files.length or !window.FileReader
        $('#upload_file_2').parent().removeAttr 'style'
        $('#upload_file_2').siblings('p').css 'display', 'block'
        return
      fileSize = @files[0].size
      size = fileSize / 1024
      if size > 10000
        lang = document.getElementsByTagName('html')[0].getAttribute('lang')
        if lang == "zh-CN"
          alert '请上传小于10M的文件'
        else
          alert 'Please upload a smaller file (<10 MB).'
        @val ''
        return
      name = $('#upload_file_2').val()
      fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();
      if fileName != "png" && fileName != "jpg" && fileName != "jpeg" && fileName != "gif" && fileName != "bmp"
        lang = document.getElementsByTagName('html')[0].getAttribute('lang')
        if lang == "zh-CN"
          alert '请上传正确格式的图片文件(bmp, jpg, jpeg, png, gif)'
        else
          alert 'Upload incorrect format image:\n Please upload correct image file (bmp, jpg, jpeg, png, gif).'
        $('#upload_file_2').val() ''
        return
      if /^image/.test(files[0].type)
        reader = new FileReader
        reader.readAsDataURL files[0]
        reader.onloadend = ->
          $('#upload_file_2').parent().css 'background-image', 'url(' + @result + ')'
          $('#upload_file_2').siblings('p').css 'display', 'none'
          $('#upload_file_2').parent('.form-field').removeClass 'n-invalid'
          return
      return

    @el.fileCv.change ->
      filePath = $(this).val()
      fileSize = @files[0].size
      size = fileSize / 1024
      if size > 10000
        lang = document.getElementsByTagName('html')[0].getAttribute('lang')
        if lang == "zh-CN"
          alert '请上传小于10M的文件'
        else
          alert 'Please upload a smaller file (<10 MB).'
        @val ''
        return
      name = $('#upload_cv').val()
      fileN = name.substring(name.lastIndexOf(".")+1).toLowerCase();
      if fileN != "pdf" && fileN != "doc" && fileN != "docx"
        lang = document.getElementsByTagName('html')[0].getAttribute('lang')
        if lang == "zh-CN"
          alert '请上传正确格式的文件(pdf, doc, docx)'
        else
          alert 'Upload incorrect format CV file:\n Please upload correct file (pdf, doc, docx).'

        $('#upload_cv').val() ''
        return
      arr = filePath.split('\\')
      fileName = arr[arr.length - 1]
      $('#upload_cv').siblings('.file-tip').css 'display', 'none'
      $('#upload_cv').siblings('.file-path').css 'display', 'block'
      $('#upload_cv').siblings('.file-path').html fileName
      return
    return

    
        
## Add plugin to jQuery namespace.
$.mlpPlugin(JoinUs, 'JoinUs', true)