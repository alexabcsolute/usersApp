@Demo.module "ClassesApp", (ClassesApp, App, Backbone, Marionette, $, _) ->

  class ClassesApp.Router extends Marionette.AppRouter
    appRoutes:
      "classes": "listClasses"


  API =
    listClasses: ->
      ClassesApp.List.Controller.listClasses()
      console.log "listclasses"


  App.addInitializer ->

    new ClassesApp.Router
      controller: API
