@Demo.module "ClassesApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listClasses: ->
      layout = @getLayoutView()
      layout.on "render", =>
        @showMenuCollection(layout)
        @showFooter(layout)
      App.mainRegion.show layout
#      @myItemView = @getItemView()
#      @myCollectionView = @getCollectionView(@myItemView)
#      App.headerRegion.show @myCollectionView

    # вызывается после того, когда будет вызван метод render в layout(view)
    showMenuCollection: (layout) ->
      menuCollection = @getCollectionModels()
      menuView = @getCollectionView()
      menuView.collection = menuCollection
      layout.headerRegion.show menuView
      console.log menuCollection

    showFooter: (layout) ->
      footercollection = @getCollectionModels()
      footerView = @getCollectionView()
      footerView.collection = footercollection
      layout.footerRegion.show footerView

  # View getters

    getCollectionModels: ->
      collectionModels = new Backbone.Collection [
        { title: "111", href: "#111" }
        { title: "111", href: "#111" }
        { title: "111", href: "#111" }
      ]

    getLayoutView: ->
      listLayout = new List.Layout
      listLayout.on "render", =>
       # alert "Hello world!!!"

    getItemView: ->
      listItemView= new List.ItemView

    getCollectionView: (options) ->
      listCollectionView = new List.CollectionView(options)




