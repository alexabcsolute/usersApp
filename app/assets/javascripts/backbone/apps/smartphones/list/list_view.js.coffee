@Demo.module "SmartphonesApp.List", (List, App, Backbone, Marionette, $, _) ->
  class List.Layout extends Marionette.LayoutView
    template: "smartphones/list/templates/list_layout"

    regions:
      headerRegion: "#header-region"
      mainRegion: "#main-region"
      footerRegion: "#footer-region"

    class List.ItemMenuView extends Marionette.ItemView
      template: "smartphones/list/templates/_list_item_view"
      tagName: "li"

    class List.ItemSmartphoneView extends Marionette.ItemView
      template: "smartphones/list/templates/_list_item_smartphone_view"
      tagName: "li"

    class List.CollectionMenuView extends Marionette.CollectionView
      tagName: "ul"
      className: 'menu'
      childView: List.ItemMenuView

    class List.CollectionSmartphonesView extends Marionette.CollectionView
      tagName: "ul"
      className: 'item'
      childView: List.ItemSmartphoneView