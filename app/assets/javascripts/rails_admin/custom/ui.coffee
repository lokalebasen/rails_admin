#= override this file in your application to add custom behaviour

$ ->

  options =
    plugins: "image link table media print charmap preview code"
    convert_urls: false

  $('body').on 'click', '.tinymce-trigger', ->
    textArea = this.previousSibling.previousSibling
    if textArea.id is undefined
      textArea.id = tinyMCE.DOM.uniqueId()
    tinymce.EditorManager.createEditor(textArea.id, options).init()

