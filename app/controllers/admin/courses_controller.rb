class Admin::CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_subjects, only: [:new, :create, :edit]

  def index
    @courses = @courses.paginate page: params[:page]
  end

  def new
  end

  def show
    @course_subjects = @course.course_subjects.paginate page: params[:page]
  end

  def create
    if @course.save
      flash[:success] = t "views.course.complete_create"
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if params[:status]
      @course.update_attributes status: params[:status]
      redirect_to params[:status] == "start" ? admin_courses_path : [:admin, @course]
    else
      if @course.update_attributes course_params
        flash[:success] = t "views.course.complete_update"
        redirect_to admin_courses_path
      else
        render :edit
      end
    end
  end

  def destroy
    @course.destroy
    redirect_to admin_courses_path
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
