class SelectTags
  constructor: (el) ->
    @$el = $(el)
    @_options = @$el.data("select-tags")

    @_init()

  _init: ->
    @$el.selectize
      options: @options,
      valueField: "title",
      labelField: "title",
      plugins: ["remove_button"],
      delimiter: ' ',
      create: true,
      createOnBlur: true,
      persist: false

new SelectTags(el) for el in $("[data-select-tags]")
