@Demo.module "UsersApp.SignIn", (SignIn, App, Backbone, Marionette, $, _) ->

  SignIn.Controller =

    signIn: ->
      userSessionModel = App.request "entities:users:session:model"
      signInModel = @getSignInModel()
      @layout = @getLayoutView model: signInModel

      #######
      @layout.on "submit:form:event", =>
        signInModel.on "validation:false", (errors) => @layout.showErrors errors
        userSessionModel.on "token:get:failed", (errors) =>
          @layout.showErrors errors
        if signInModel.isValid()
          userSessionModel.set("username", signInModel.get("email"))
          userSessionModel.set("password", signInModel.get("password"))
          userSessionModel.getToken()



#          signInModel.save signInModel.attributes,
#            alert 123
#            type: 'post'
#            success: (model) =>
#              @signUpSuccessEvent(model)
#            error: (model) =>
#              model.trigger "validation:false

      App.mainRegion.show @layout

    getLayoutView: (options) ->
      new SignIn.Layout(options)

    getSignInModel: ->
      SignInModel = Backbone.Model.extend
        validate: ->
          errors = []

          if @get('email') == '' then errors.push name: 'email', message: 'Email is empty'
          if @get('password') == '' then errors.push name: 'password', message: 'Password is empty'
          if errors.length > 0
            @trigger "validation:false", errors

            return errors
          else
            return false


      #defaults: { email: "", password: "" }
      new SignInModel()















