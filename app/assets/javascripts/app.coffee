$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()

initPage = ->
  $('.redactor').redactor
    imageUploadParam:   'image'
    imageManagerJson:   '/uploads?type=image'
    fileManagerJson:    '/uploads?type=other'
    imageUpload:        '/uploads'
    clipboardUploadUrl: '/uploads'
    fileUpload:         '/uploads'
    lang: window.locale
    focus: true
    toolbarFixed: true
    plugins: ['imagemanager', 'filemanager']
    uploadImageFields:
      through: 'redactor'
      attachable_id: $('.redactor').data('attachable_id')
      attachable_type: $('.redactor').data('attachable_type')
      authenticity_token: $('meta[name="csrf-token"]').attr('content')
    uploadFileFields:
      through: 'redactor'
      attachable_id: $('.redactor').data('attachable_id')
      attachable_type: $('.redactor').data('attachable_type')
      authenticity_token: $('meta[name="csrf-token"]').attr('content')


$(document).on 'turbolinks:load', initPage
