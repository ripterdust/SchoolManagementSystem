class HomeController < ApplicationController
    def index
        response = {
            message: "Hello world"
        }

        render json: response
    end
end
