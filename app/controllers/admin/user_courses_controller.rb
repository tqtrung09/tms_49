class Admin::UserCoursesController < ApplicationController
  load_and_authorize_resource :course

  def show
    @users = User.all
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "views.course.complete_update_trainee"
      redirect_to admin_courses_path
    else
      flash[:danger] = t "views.course.fails_update_trainee"
      render :show
    end
  end

  private
  def course_params
    params.require(:course).permit user_ids: []
  end
end
