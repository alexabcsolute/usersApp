@Demo.module "SmartphonesApp", (SmartphonesApp, App, Backbone, Marionette, $, _) ->
  class SmartphonesApp.Router extends Marionette.AppRouter
    appRoutes:
      "smartphones": "listSmartphones"

  API =
    listSmartphones: ->
      SmartphonesApp.List.Controller.listSmartphones()
      console.log "listSmartphones"

  App.addInitializer ->

    new SmartphonesApp.Router
      controller: API