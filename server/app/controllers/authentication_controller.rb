class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request, only: [:login]

    #POST /auth/login
    def login
        @user = User.find_by_email(params[:email])
        
        isAuthenticated = @user&.authenticate(params[:password])

        puts isAuthenticated

        if !isAuthenticated
            render json: { error: ["Invalid username or password"] }, status: :unauthorized            
            return 
        end

        token = jwt_encode(user_id: @user.id)
            
        return render json: { data: token }, status: :ok
    end

    #POST /auth/register
    def register
        user = User.new(email: params[:email], password: params[:password], username: params[:username])
        
        if !user.save
            return render json: { data: nil, errors: user.errors }, stauts: :unauthorized
        end

        token = jwt_encode(user.attributes)

        return render json: {data: token}, status: :ok
        
    end
end
