class UserSubjectsController < ApplicationController
  load_and_authorize_resource

  def update
    @user_subject.update_attributes status: params[:status]
    redirect_to @user_subject.course_subject.course
  end
end
