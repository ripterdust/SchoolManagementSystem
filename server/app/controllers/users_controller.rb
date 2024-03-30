class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy]

    # GET /users
    def index 
        @users = User.all

        render json: { data: @users }, status: :ok
    end

    # GET /user/:id
    def show 
        render json: { data: @user }, status: :ok 
    end

    #POST /users
    def create
        @user = User.new(user_params)
        
        if !@user.save
            render json: {
                error: @user.errors
            } , status: :unprocessable_entity
        end

        render json: { data: @user }, status: :ok
    end

    #DELETE /users/:id
    def destroy
        @user.destroy

        render json: { data: {} }, status: :ok
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user

        puts params
        @user = User.find(params[:id])
    end
end
