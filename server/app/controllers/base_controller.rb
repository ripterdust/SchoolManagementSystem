# Base controller, It handles the basic crud operations -> index, 
class BaseController < ApplicationController
    # Middlewares
    before_action :verifyNullishModel

    # Basse model
    @model = nil
    @isSchool = false

    #GET -> fetch all records
    def index 
        return base_response(@model.all)
    end

    #POST -> Create a new record
    def create 
        return base_response("Create")
    end
    #GET -> Get record by id
    def show 
        record = @model.where(schoolId: )
        return base_response("Show")
        
    end
    #PUT/PATCH -> Update record by id
    def update
        return base_response("Update")
    end
    #DELETE -> Destroy record 
    def destroy
        return base_response("Destroy")
    end

    private 
    def base_response(data)
        render json: {
            data: data
        }, status: :ok
    end

    def verifyNullishModel
        if @model
            return
        end

        return render json: {
            data: nil,
            errors: [{message: "No model specified"}],
            user: @current_user
        }
    end
end
