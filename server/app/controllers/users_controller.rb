class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy]

    # GET /users
    def index 
        @users = User.all

        render json: { data: @users }, status: :ok
    end

    # GET /user/:id
    def show 
        render json: { data: @user.as_json }, status: :ok 
    end

    #POST /users
    def create
        @user = User.new(user_params)
        
        if !@user.save
            render json: {
                error: @user.errors
            } , status: :unprocessable_entity
        end

        render json: { data: @user.as_json }, status: :ok
    end

    #DELETE /users/:id
    def destroy
        @user.destroy

        render json: { data: {} }, status: :ok
    end

    # GET /user -> Get user's data
    def get_user_data
        base_response(@current_user)
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user

        puts params
        @user = User.find(params[:id])
    end

    private 
    def base_response(data)
        render json: {
            data: data,
            error: nil
        }, status: :ok
    end

    def error_response(errors)
        render json: {
            errors: errors,
            data: nil
        }, status: :internal_server_error
    end
end
