class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def index
    # gon.rabl
    # @user = User.first ##just an example of an authenticated user
    # gon.rabl "app/views/apiusers/show.json.rabl", as: "current_user"

  end
end
