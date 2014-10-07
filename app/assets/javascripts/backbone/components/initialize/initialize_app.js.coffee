@Demo.module "InitializeApp", (InitializeApp, App, Backbone, Marionette, $, _) ->
#  App.on "start", (options) ->
#    App.bodylayout = new Marionette.LayoutView
#    console.log App.bodylayout
#    route = window.location.hash
#    console.log route
#    switch route
#      when("#smartphones")
#        alert 1
  API =
    itializeLayout: (options) ->
      InitializeApp.Layout.Controller.itializeLayout()

  InitializeApp.on 'start', (options) ->
    API.itializeLayout options