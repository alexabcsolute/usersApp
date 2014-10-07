@Demo.module "UsersApp", (UsersApp, App, Backbone, Marionette, $, _) ->

  class UsersApp.Router extends Marionette.AppRouter
    appRoutes:
      "users": "listUsers"
      "users/sign_in": "signIn"
      "users/sign_up": "signUp"

  API =
    listUsers: ->

      UsersApp.List.Controller.listUsers()
      console.log "listusers"

    signIn: ->
      UsersApp.SignIn.Controller.signIn()

    signUp: ->
      UsersApp.SignUp.Controller.signUp()

  App.addInitializer ->

    new UsersApp.Router
      controller: API
