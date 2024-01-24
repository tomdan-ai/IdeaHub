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

    # POST /users(User Registration)
    def create
      @user = User.new(user_params.except(:password).merge(password: params[:password]))

      if @user.save
        token = JwtService.encode(user_id: @user.id)
        render json: { token: token }, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    #POST /login (User Login)
    def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        token = JwtService.encode(user_id: @user.id)
        render json: { token: token }, status: :ok
      else
        render json: { error: 'Invalid Email or Password Bruh💀' }, status: :unauthorized
      end
    end

    # PATCH/PUT /users/1
    def update
      authorize @user


      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end


    def update_profile
      @user = current_user
      # Rest of your code...
    end
    
    # DELETE /users/1
    def destroy
      @user.destroy
      render json: { message: 'User deleted successfully' }
    end

     # Update user profile
  def update_profile
    @user = current_user
    authorize @user

    if @user.update(profile_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # Update user password
  def update_password
    @user = current_user
    authorize @user

    if @user.authenticate(params[:current_password]) && @user.update(password_params)
      render json: @user
    else
      render json: { error: 'Current password is incorrect' }, status: :unprocessable_entity
    end
  end


    private

    def set_user
      @user = User.find(params[:id])
    end


    def user_params
      params.require(:user).permit(:username, :email, :password, :profile_picture, :bio)
    end

    def profile_params
      params.require(:user).permit(:username, :email, :bio, :profile_picture)
    end

    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end


  end
