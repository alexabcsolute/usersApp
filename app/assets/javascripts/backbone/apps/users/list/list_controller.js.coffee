@Demo.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listUsers: ->

      @layout = @getLayoutView()
      App.mainRegion.show @layout

    getLayoutView: ->
      new List.Layout


