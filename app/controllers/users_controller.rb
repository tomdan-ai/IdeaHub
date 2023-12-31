class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
  
  
    # GET /users
    def index
      @users = User.all
      render json: @users
    end
  
    # GET /users/1
    def show
      render json: @user
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
  
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      @user.destroy
      render json: { message: 'User deleted successfully' }
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    swagger_controller :users, 'User Management'

  swagger_api :index do
    summary 'Fetches all users'
    notes 'This lists all the users'
    param :query, :page, :integer, :optional, 'Page number'
    param :query, :per_page, :integer, :optional, 'Per page'
    response :ok
  end

    def user_params
      params.require(:user).permit(:username, :email, :password, :profile_picture, :bio)
    end

  
  end
  