class Admin::CourseSubjectsController < ApplicationController
  load_and_authorize_resource

  def update
    @course_subject = CourseSubject.find params[:course_subject_id]
    @course_subject.update_attributes course_subject_params
    redirect_to [:admin, @course_subject.course]
  end

  private
  def course_subject_params
    params.require(:course_subject).permit :course_id, :subject_id, :status
  end
end
