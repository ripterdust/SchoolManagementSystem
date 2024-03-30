class SchoolController < ApplicationController
    def index
        data = School.find(@current_user[:school_id])

        return render json: data, status: :ok
    end
end
