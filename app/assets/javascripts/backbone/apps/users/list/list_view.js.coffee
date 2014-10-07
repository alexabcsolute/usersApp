@Demo.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Backbone.Marionette.LayoutView
    template: "users/list/templates/list_layout"

    regions:
      panelRegion: "#panel-region"
      usersRegion: "#users-region"

