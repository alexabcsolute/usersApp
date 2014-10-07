@Demo.module "InitializeApp.Layout", (Layout, App, Backbone, Marionette, $, _) ->

  Layout.Controller =
    itializeLayout: ->
      layoutDefault = new Layout.LayoutDefault
      layoutSpecial = new Layout.LayoutSpecial

      route = window.location.hash
      console.log route
      if route=="#smartphones"
        App.bodyLayout = layoutDefault


      App.mainRegion.show App.bodyLayout


