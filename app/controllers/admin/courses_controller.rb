class Admin::CoursesController < ApplicationController
  load_and_authorize_resource
  before_action :load_subjects, only: [:new, :create, :edit]

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

  def edit
  end

  def update
    if params[:status]
      @course.update_attributes status: params[:status]
      flash[:success] = params[:status] == "finish" ?
        t("update_status_finish") : t("update_status_unfinish")
      redirect_to admin_courses_path
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
