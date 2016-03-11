class Admin::CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_subjects, only: [:new, :create]

  def index
    @courses = @courses.paginate page: params[:page]
  end

  def new
  end

  def show
  end

  def create
    if @course.save
      flash[:success] = t "views.course.complete_create"
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  private
  def course_params
    params.require(:course).permit :name, :content,
      :start_date, :end_date, subject_ids: []
  end

  def load_subjects
    @subjects = Subject.all
  end
end
