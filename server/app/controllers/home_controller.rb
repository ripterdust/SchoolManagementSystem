class HomeController < ApplicationController
    skip_before_action :authenticate_request, only: [:index]
    
    def index
        response = {
            message: "School management routes",
            login_url: {
                path: "/auth/login",
                method: "POST"
            }
        }

        render json: response, status: :ok
    end
end
