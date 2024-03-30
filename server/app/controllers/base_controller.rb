# Base controller, It handles the basic crud operations -> index, 
class BaseController < ApplicationController

    @model = nil
    
    #GET -> fetch all records
    def index 
        return base_response(@model.all)
    end

    def create 
        return base_response("Create")
    end

    def show 
        return base_response("Show")
        
    end

    def update
        return base_response("Update")
    end

    def destroy
        return base_response("Destroy")
    end

    private 
    def base_response(data)
        render json: {
            data: data
        }, status: :ok
    end

end
