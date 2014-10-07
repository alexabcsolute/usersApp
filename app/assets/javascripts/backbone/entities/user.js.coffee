@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->


  class Entities.UserModel extends Entities.Model
    urlRoot: "/api/users"

  class Entities.UsersCollection extends Entities.Collection
    model: Entities.UserModel
    url: "/api/users"

  class Entities.CookieBackboneModel extends Entities.Model
    getSessionCookieModel: ->
      model = App.request "entities:service:cookie:model"
      model.set 'name', @get('cookieKey')
      model

    fetch: ->
      model = @getSessionCookieModel()
      model.fetch()
      @set model.getData()
      @trigger "fetch"

    save: ->
      model = @getSessionCookieModel()
      model.set @attributes
      model.save()

    destroy: ->
      model = @getSessionCookieModel()
      model.destroy()


  class Entities.CookieModel extends Backbone.Model
    defaults:
      name: ''
      expires: 7 # one week
      path: '/'
  #      domain: ''
    initialize: ->
#      @setDefaultDomain()

    save: ->
      name    = @get 'name'
      data    = JSON.stringify @getData()
      options = @getOptions()
      $.cookie name, data, options
  #      $.cookie name, data

    destroy: ->
      name    = @get 'name'
      options = @getOptions()
      #      $.removeCookie name
      $.removeCookie name, options

    fetch: ->
      cookie = $.cookie @get('name')
      if cookie
        @set JSON.parse(cookie)

    getData: ->
      _.omit @attributes, 'name', 'expires', 'path', 'domain'

    getOptions: ->
      _.pick @attributes, 'expires', 'path', 'domain'

    setDefaultDomain: (force = false) ->
      return if @has 'domain' and not force
      domain = window.location.host.split '.'
      domain.shift() if domain.length > 2
      domain.unshift ''
      domain = domain.join '.'
      @set 'domain', domain


  class Entities.UserSessionModel extends Entities.Model

    isGuest: ->
      console.log @get("access_token")
      if @get("access_token")
        alert "Вы авторизированы"
      else
        alert "Вы не авторизированы"

    checkUserSession: ->
      currentUserDataString = $.cookie('current_user');
      if currentUserDataString
        currentUserData = JSON.parse(currentUserDataString)
        @set(currentUserData)
        console.log currentUserData
        console.log "You are sign_up!"

    logoutUserSession: ->
      $.cookie('current_user', null);
      console.log("Сессия закрыта")
      location.reload()

    createUser: (attributes, callback) ->

      CreateUserModel = Backbone.Model.extend
        url: App.routes.createUserPath

      createUserModel = new CreateUserModel(attributes)
      saveOptions = {
        success: =>
          callback("success")
        error: (model, response) =>
          callback("error",response)

      }

      createUserModel.save attributes, saveOptions


    authenticateUser: (tokenResponse) ->
      $.ajax App.routes.userSessionPath,
        type: 'GET'
        headers: { "Authorization": "Bearer #{ tokenResponse.access_token }" }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log jqXHR
        success: (data, textStatus, jqXHR) ->
          authResponse = jqXHR.responseJSON
          $.cookie('current_user',  JSON.stringify($.extend(authResponse,tokenResponse)))
          console.log "Signed in!!!"
          console.log authResponse
          console.log tokenResponse.access_token
          console.log tokenResponse


    getToken: ->
      formData = new FormData()
      formData.append "username", @get("username")
      formData.append "password", @get("password")
      formData.append "grant_type", "password"
      formData.append "client_id", App.config.api.clientId

      request = new XMLHttpRequest()
      request.open "POST", App.routes.userTokenPath
      request.onreadystatechange = (e) =>
        if request.readyState == 4
          tokenResponse = JSON.parse(e.srcElement.responseText)
          unless tokenResponse.error
            @authenticateUser(tokenResponse)
          else
            @trigger "token:get:failed", [{ name: "email", message: "login error" }]

      request.send formData


  API =
    getModel: (options) -> new Entities.UserModel(options)
    getCollection: (options) -> new Entities.UsersCollection(options)
    getUserSessionModel: (options) -> new Entities.UserSessionModel(options)
    getUserCookieModel: (options) -> new Entities.UserCookieModel(options)


  App.reqres.setHandler "entities:users:model", (options) -> API.getModel(options)
  App.reqres.setHandler "entities:users:collection", (options) -> API.getCollection(options)
  App.reqres.setHandler "entities:users:session:model", (options) -> API.getUserSessionModel(options)
  App.reqres.setHandler "entities:users:cookie:model", (options) -> API.getUserCookieModel(options)
  App.reqres.setHandler "entities:service:cookie:model", (options) -> API.getCookieModel options



   # url: -> Routes.users_path()


#  API =
#    setCurrentUser: (currentUser) ->
#      new Entities.User currentUser
#
#    getUserEntities: (cb) ->
#      users = new Entities.UsersCollection
#      users.fetch
#        success: ->
#          cb users

#  App.reqres.addHandler "set:current:user", (currentUser) ->
#    API.setCurrentUser currentUser

#  App.reqres.addHandler "user:entities", (cb) ->
#    API.getUserEntities cb