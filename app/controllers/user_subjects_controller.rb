class UserSubjectsController < ApplicationController
  load_and_authorize_resource

  def update
    @user_subject.update_attributes user_subject_params
    redirect_to @user_subject.course_subject.course
  end

  private
  def user_subject_params
    params.require(:user_subject).permit :status
  end
end
