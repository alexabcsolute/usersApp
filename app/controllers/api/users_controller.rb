class Api::UsersController < ApplicationController
  respond_to :json

  before_action :get_collection, only: [:index]
  before_action :get_model, only: [:show, :update, :destroy]

  def get_collection
    @collection = User.all
  end

  def get_model
    @model = User.find_by_id params[:id]
  end

  def get_model_params
    params.require(:profile).permit(:email, :first_name, :last_name, :password)
  end

  def index
    respond_with @collection
  end

  def show

    respond_with @model


  end

  def create
    respond_with User.create @get_model_params
  end

  def update
    respond_with @model.update @get_model_params
  end

  def destroy
    respond_with @model.destroy
  end

end
