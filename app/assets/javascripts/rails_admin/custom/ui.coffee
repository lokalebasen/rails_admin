#= override this file in your application to add custom behaviour

$ ->
  $(".tinymce-trigger").click ->
    tinymce.init
      selector:'.tinymce-editable',
      plugins: "image link table media print charmap preview code"
      convert_urls: false
