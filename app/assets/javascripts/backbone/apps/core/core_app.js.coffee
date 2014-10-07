@Demo.module "CoreApp", (CoreApp, App, Backbone, Marionette, $, _) ->

  API =
    users: ->
      CoreApp.Users.Controller.users()




