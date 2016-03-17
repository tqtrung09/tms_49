class CoursesController < ApplicationController
  load_and_authorize_resource

  def index
    @courses = @courses.paginate page: params[:page]
  end

  def show
    @course_subjects = @course.course_subjects.paginate page: params[:page]
  end
end
