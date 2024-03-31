class CoursesController < BaseController
    self.model = Course

    # PATCH -> /courses/meeting
    def change_meeting_url
        course = Course.find(params[:id])

        render json: {
            data: course
        }
    end
end
