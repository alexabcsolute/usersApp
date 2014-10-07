@Demo.module "ClassesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends Marionette.LayoutView
    template: "classes/list/templates/list_layout"

#    events:
#      "click .test": "clickEvent"

#    clickEvent: ->
#      alert 34

    regions:
      headerRegion: "#header-region"
      mainRegion: "#main-region"
      footerRegion: "#footer-region"


    class List.ItemView extends Marionette.ItemView
      template: "classes/list/templates/_list_item_view"
#      render: ->
#        $(@el).html """
#          <a href="#{ @model.get("href") }" title="#{ @model.get("title") }">#{ @model.get("title") }</a>
#        """
      tagName: "li"

    class List.CollectionView extends Marionette.CollectionView
      tagName: "ul"
      className: 'menu'
      childView: List.ItemView








