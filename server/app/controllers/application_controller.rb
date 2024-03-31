class ApplicationController < ActionController::API
    include JsonWebToken
    before_action :authenticate_request

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
    
    private
    def authenticate_request
        header = request.headers["Authorization"]
        header = header.split(' ').last if header

        decoded = jwt_decode(header)

        @current_user = User.select(User.column_names - ['password_digest']).find(decoded[:user_id])
    end


end
