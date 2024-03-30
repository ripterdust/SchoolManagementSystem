class AuthenticationController < ApplicationController

    #POST /auth/login
    def login
        @user = User.find_by_email(params[:email])
        
        isAuthenticated = @user&.authenticate(params[:password])

        puts isAuthenticated

        if !isAuthenticated
            render json: { error: ["Invalid username or password"] }, status: :unauthorized            
            return 
        end

        token = Jsonwebtoken.jwt_encode(user_id: @user.id)
            
        return render json: { data: token }, status: :ok
    end

    #POST /auth/register

    def register

        token = "Hola"
        return render json: {data: token}, status: :ok
        
    end
end
