# class UploadButton extends MLP.apps.MLPModule
#   defaults:
#     property: 'foo'

#   init: ->

#     @el.uploadBtn = @el.target.find('.c-join__form--img .c-join__form--update input')

#     @el.uploadBtn.on 'change', (e) =>
#       @upload(e)

#   upload: (echo) ->

#     $el = @currentTarget(e)
#     # Get a reference to the fileList
#     files = if ! !@files then @files else []
#     # If no files were selected, or no FileReader support, return
#     if !files.length or !window.FileReader
#       return
#     # Only proceed if the selected file is an image
#     if /^image/.test(files[0].type)
#       # Create a new instance of the FileReader
#       reader = new FileReader
#       # Read the local file as a DataURL
#       reader.readAsDataURL files[0]
#       # When loaded, set image data as background of div

#       reader.onloadend = ->
#         $el.parent().css 'background-image', 'url(' + @result + ')'
#         return

#     return

# $.mlpPlugin(UploadButton, 'UploadButton')