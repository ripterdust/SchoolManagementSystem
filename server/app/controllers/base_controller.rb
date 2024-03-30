# Base controller, It handles the basic crud operations -> index, 
class BaseController < ApplicationController
    # Attributes
    class_attribute :model, default: false
    
    # Middlewares
    before_action :verifyNullishModel
    
    def self.model(model = nil)
        @model = model if model
        @model
    end

    #GET -> fetch all records
    def index 
        query = self.model.where(school_id: @current_user[:school_id])
        return base_response(query)
    end

    #POST -> Create a new record
    def create
        model_properties = get_model_properties
        query = get_query(params, model_properties) 
        query[:school_id] = @current_user[:school_id]

        document = self.model.new(query)

        if document.save
            return base_response(document)
        else 
            return error_response(document.errors)
        end
    end

    #GET -> Get record by id
    def show 
        record = self.model.where(school_id: @current_user[:school_id]).where(id: params[:id])[0]

        if !record
            return error_response([{
                message: "Record not found"
            }])
        end

        return base_response(record)
    end

    #PUT/PATCH -> Update record by id
    def update
        return base_response("Update")
    end
    #DELETE -> Destroy record 
    def destroy
        record = self.model.where(school_id: @current_user[:school_id]).where(id: params[:id])[0]

        if !record
            return error_response([{
                message: "Record not found"
            }])
        end

        record.destroy
        
        return base_response(record)
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

    def verifyNullishModel
        unless self.model
            render json: {
            data: nil,
            errors: [{message: "No model specified"}],
            user: @current_user
        }, status: :unprocessable_entity
        end
    end

    def get_model_properties
        self.model.column_names
    end

    def get_query(request, model_properties)
        query = {}

        model_properties.each do |property|
            query[property] = request[property] if request.has_key?(property)
        end

        query
    end
end
