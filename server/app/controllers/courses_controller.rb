class CoursesController < BaseController
    self.model = Course

    # PATCH -> /courses/meeting
    def change_meeting_url
        course = Course.find(params[:id])
        course[:meeting_url] = params[:meeting_url]

        if course.save 
            base_response(course)
        else
            error_response(course.errors)
        end

    end
end
