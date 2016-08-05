$(document).on 'click', 'form .remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
  $(this).closest('fieldset').hide()
  event.preventDefault()

$(document).on 'click', 'form .add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()



  
$.Redactor.settings =
  imageUploadParam:   'image'
  imageManagerJson:   '/uploads?type=image'
  fileManagerJson:    '/uploads?type=other'
  imageUpload:        '/uploads'
  clipboardUploadUrl: '/uploads'
  fileUpload:         '/uploads'
  lang: window.locale
  focus: true
  toolbarFixed: true
  plugins: ['imagemanager', 'filemanager', 'video']
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


pickadate_ja = {
    monthsFull: [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月' ],
    monthsShort: [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月' ],
    weekdaysFull: [ '日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日' ],
    weekdaysShort: [ '日', '月', '火', '水', '木', '金', '土' ],
    today: '今日',
    clear: '消去',
    firstDay: 1,
    format: 'yyyy mm dd',
    formatSubmit: 'yyyy/mm/dd'
}

pickatime_ja = {
    clear: '消去'
}

initPage = ->
  
  $('.redactor').redactor($.Redactor.settings)
  if window.locale == 'ja'
    $('.datepicker').pickadate(pickadate_ja)
  else
    $('.datepicker').pickadate()

$(document).on 'turbolinks:load', initPage

window.delay = (time, fn) -> setTimeout fn, time
