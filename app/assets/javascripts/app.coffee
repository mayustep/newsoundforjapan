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
