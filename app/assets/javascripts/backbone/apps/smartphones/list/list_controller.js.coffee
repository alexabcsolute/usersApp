@Demo.module "SmartphonesApp.List", (List, App, Backbone, Marionette, $, _) ->
  List.Controller =
    listSmartphones: ->
      layout = @getLayoutView()
      layout.on "render", =>
        @showMenuCollection(layout)
        @showFooterCollection(layout)
        @showListSmartphonesCollection(layout)
      App.bodyLayout.mainRegion.show layout


  # вызывается после того, когда будет вызван метод render в layout(view)

    showListSmartphonesCollection: (layout) ->
      listSmartphoneCollection = @getSmartphonesCollectionModels()
      smartphoneView = @getCollectionSmartphonesView()
      smartphoneView.collection = listSmartphoneCollection
      layout.mainRegion.show smartphoneView
      console.log listSmartphoneCollection


    showMenuCollection: (layout) ->
      menuCollection = @getMenuCollectionModels()
      menuView = @getCollectionMenuView()
      menuView.collection = menuCollection
      layout.headerRegion.show menuView
      console.log menuCollection

    showFooterCollection: (layout) ->
      footercollection = @getMenuCollectionModels()
      footerView = @getCollectionMenuView()
      footerView.collection = footercollection
      layout.footerRegion.show footerView

  # View getters

    getMenuCollectionModels: ->
      collectionModels = new Backbone.Collection [
        { title: "Home", href: "#users" }
        { title: "Smartphones", href: "#smartphones" }
        { title: "About", href: "#about" }
      ]

    getLayoutView: ->
      listLayout = new List.Layout
      listLayout.on "render", =>
        # alert "Hello world!!!"

    getCollectionMenuView: (options) ->
      listCollectionView = new List.CollectionMenuView(options)

    getCollectionSmartphonesView: (options) ->
      listCollectionSmartphonesView = new List.CollectionSmartphonesView(options)


    getSmartphonesCollectionModels: ->
      smartphonesCollectionModel = new Backbone.Collection [
        {title: "Nokia", description: "Nokia X2"}
        {title: "Samsung", description: "Samsung Galaxy S4"}
        {title: "Apple", description: "Apple Iphone 6"}
      ]