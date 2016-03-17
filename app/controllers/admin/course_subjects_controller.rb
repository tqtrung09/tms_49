class Admin::CourseSubjectsController < ApplicationController
  load_and_authorize_resource

  def update
    @course_subject = CourseSubject.find params[:course_subject_id]
    @course_subject.update_attributes status: params[:status]
    redirect_to [:admin, @course_subject.course]
  end
end
