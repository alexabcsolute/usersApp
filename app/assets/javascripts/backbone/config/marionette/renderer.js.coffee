Backbone.Marionette.Renderer.render = (template, data) ->
  if (path = JST["backbone/apps/" + template])
#    unless path
#      throw "Template #{template} not found!"
    path(data)
  else
    path = JST["backbone/components/" + template]
#    unless path
#      throw "Template #{template} not found!"
    path(data)
