require "rails_helper"
require "cancan/matchers"
require "admin/course_subjects_controller"

describe Admin::CourseSubjectsController, type: :controller do
  let(:admin) {FactoryGirl.create :admin}
  let(:course) {FactoryGirl.create :course}
  let(:subject) {FactoryGirl.create :subject}
  let(:course_subject) {FactoryGirl.create :course_subject,
  course_id: course.id, subject_id: subject.id}

  describe "PUT /courses/:course_id/course_subjects" do
    before do
      sign_in admin
      allow(CourseSubject).to receive(:find).and_return course_subject
      allow(course_subject).to receive(:update_attributes).and_return true
      put :update, course_id: course.id, id: course_subject.id, course_subject:
        {course_id: course_subject.id, subject_id: course_subject.id}
    end
    it {expect(CourseSubject.find(course_subject.id)).to eq(course_subject)}
    it {expect(response).to redirect_to [:admin, course_subject.course]}
  end
end
