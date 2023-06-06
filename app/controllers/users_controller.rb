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
