#= override this file in your application to add custom behaviour

class TinyMCEActivator

  constructor: (triggerNode) ->
    @textArea = triggerNode.previousSibling.previousSibling

  enableTinyMCE: ->
    @_ensureSelectorClass()
    tinyMCE.init
      selector: @_getSelector(),
      plugins: "image link table media print charmap preview code"
      convert_urls: false
      verify_html: false

  _ensureSelectorClass: ->
    if @textArea.getAttribute('tiny-id') is null
      tinyId = tinyMCE.DOM.uniqueId()
      @textArea.setAttribute('tiny-id', tinyId)
      $(@textArea).addClass(tinyId)

  _getSelector: ->
    tinyId = @textArea.getAttribute('tiny-id')
    ".#{tinyId}"

$ ->
  $('body').on 'click', '.tinymce-trigger', ->
    new TinyMCEActivator(this).enableTinyMCE()
