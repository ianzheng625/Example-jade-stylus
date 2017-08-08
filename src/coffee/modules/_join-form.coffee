class JoinForm extends MLP.apps.MLPModule


  init: ->
    super()
    @el.joinF = @el.target
    @el.formSubmit = @el.target.find("#info-check-submit")
    @events()
  
  events: ->
    img         = $('#upload_file_1')
    name        = $("input[name='name']")
    age         = $("input[name='age']")
    nationality = $("input[name='nationality']")
    level       = $("input[name='education']")
    phone       = $("input[name='phone']")
    email       = $("input[name='email']")
    country     = $("input[name='country']")
    experience  = $("textarea[name='experience']")

    @el.formSubmit.click ->
      validateForm()

    img.blur ->
      img.parent('.form-field').removeClass 'null'
      if img.val() == ''
        img.parent('.form-field').addClass 'n-invalid'
      else
        img.parent('.form-field').removeClass 'n-invalid'
    
    name.blur ->
      name.parent('.form-field').removeClass 'null'
      if name.val() == ''
        name.parent('.form-field').addClass 'n-invalid'
      else
        name.parent('.form-field').removeClass 'n-invalid'

    nationality.blur ->
      nationality.parent('.form-field').removeClass 'null'
      if nationality.val() == ''
        nationality.parent('.form-field').addClass 'n-invalid'
      else
        nationality.parent('.form-field').removeClass 'n-invalid'

    level.blur ->
      level.parent('.form-field').removeClass 'null'
      if level.val() == ''
        level.parent('.form-field').addClass 'n-invalid'
      else
        level.parent('.form-field').removeClass 'n-invalid'

    country.blur ->
      country.parent('.form-field').removeClass 'null'
      if country.val() == ''
        country.parent('.form-field').addClass 'n-invalid'
      else
        country.parent('.form-field').removeClass 'n-invalid'

    experience.blur ->
      experience.parent('.form-field').removeClass 'null'
      if experience.val() == ''
        experience.parent('.form-field').addClass 'n-invalid'
      else
        experience.parent('.form-field').removeClass 'n-invalid'

    age.blur ->
      age.parent('.form-field').removeClass 'null'
      t = age.val()
      z = /^[0-9]*$/

      if !z.test(t)
        age.parent('.form-field').addClass 'n-invalid'
      
      else if t == ''
        age.parent('.form-field').addClass 'n-invalid'

      else
        age.parent('.form-field').removeClass 'n-invalid'

    phone.blur ->
      phone.parent('.form-field').removeClass 'null'
      t = phone.val()
      z = /^([0-9-]+)$/

      if !z.test(t)
        phone.parent('.form-field').addClass 'n-invalid'
      
      else if t == ''
        phone.parent('.form-field').addClass 'n-invalid'

      else
        phone.parent('.form-field').removeClass 'n-invalid'

    email.blur ->
      email.parent('.form-field').removeClass 'null'
      t = email.val()
      z = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/

      if !z.test(t)
        email.parent('.form-field').addClass 'n-invalid'
      
      else if t == ''
        email.parent('.form-field').addClass 'n-invalid'

      else
        email.parent('.form-field').removeClass 'n-invalid'

    $('.c-result__popup').click ->
      if !$('.c-result__popup .c-result__popup--loading').hasClass('is-active')
        $('.c-result__popup').removeClass 'is-active'

    supportPlaceholder = 'placeholder' of document.createElement('input')

    if !supportPlaceholder
      $('input').each ->
        text = $(this).attr('placeholder')
        if $(this).attr('type') == 'text' || $(this).attr('type') == 'email'
          placeholder $(this)
        return
      $('textarea').each ->
        text = $(this).attr('placeholder')
        placeholder $(this)
        return
    return
      
  validateForm = ->
    formField = $('.c-join__form .form-field')
    formField.each ->
      if $(this).hasClass('null')
        $(this).removeClass('null').addClass 'n-invalid'
      return
    if formField.hasClass('n-invalid')
      return false
    else
      $popup = $('.c-result__popup')
      $loading = $('.c-result__popup .c-result__popup--loading')
      $success = $('.c-result__popup .c-result__popup--success')
      $error = $('.c-result__popup .c-result__popup--error')
      $success.removeClass 'is-active'
      $error.removeClass 'is-active'
      $loading.addClass 'is-active'
      $popup.addClass 'is-active'
      setTimeout("",5000)
      formUrl = $('#join_form').attr('action')

      formData = new FormData();
      formData.append("upload_file-1", $("#upload_file_1")[0].files[0])
      formData.append("upload_file-2", $("#upload_file_2")[0].files[0])
      formData.append("upload_cv", $("#upload_cv")[0].files[0])
      formData.append("name", $("input[name='name']").val())
      formData.append("age", $("input[name='age']").val())
      formData.append("nationality", $("input[name='nationality']").val())
      formData.append("education", $("input[name='education']").val())
      formData.append("phone", $("input[name='phone']").val())
      formData.append("email", $("input[name='email']").val())
      formData.append("country", $("input[name='country']").val())
      formData.append("experience", $("textarea[name='experience']").val())

      $.ajax
        method: 'POST'
        url: formUrl
        data: formData
        contentType: false
        processData: false
        error: (request) ->
          $loading.removeClass 'is-active'
          $error.addClass 'is-active'
        success: (data) ->
          info = data
          if info.success
            $loading.removeClass 'is-active'
            $success.addClass 'is-active'
            $('input, textarea').val('')
            $('.c-join__form--update').removeAttr 'style'
            $('.c-join__form--update > p').css 'display','block'
            $('#upload_cv').siblings('.file-path').css 'display', 'none'
            $('#upload_cv').siblings('.file-tip').css 'display', 'block'
          else
            $loading.removeClass 'is-active'
            $error.addClass 'is-active'
          return
    return

  placeholder = (input) ->
    text = input.attr('placeholder')
    defaultValue = input.defaultValue
    if !defaultValue
      input.val(text).addClass 'phcolor'
    input.focus ->
      if input.val() == text
        $(this).val ''
      return
    input.blur ->
      if input.val() == ''
        $(this).val(text).addClass 'phcolor'
      return
    input.keydown ->
      $(this).removeClass 'phcolor'
      return
    return

  

        
## Add plugin to jQuery namespace.
$.mlpPlugin(JoinForm, 'JoinForm', true)

