class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
        render json: @users
    end

    def show
        @jobs = @user.jobs
        render json: @user
    end
    
    # def new
    #     @user = User.new
    #     render json: @user
    # end


    # Register new user
    def create
      @user = User.create(user_params)
      if @user.valid?
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: @user.errors.map { |error| error.full_message}
      end
    end
    # Log in existing userf
    def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
      else
        render json: {error: "Invalid username or password"}
      end
    end
    def auto_login
      render json: @user
    end


    # def edit
    #     render json: @user
    # end

    def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
        render json: @user
    end


    private
    def user_params
        params.permit(:username, :password, :age, :display_name, :description, :email, :address)
    end
    def set_user
        @user = User.find(params[:id])
    end
end
