require "rails_helper"
require "cancan/matchers"
require "user_subjects_controller"

describe UserSubjectsController, type: :controller do
  let(:user) {FactoryGirl.create :user}
  let(:course) {FactoryGirl.create :course}
  let(:subject) {FactoryGirl.create :subject}
  let(:course_subject) {FactoryGirl.create :course_subject,
    course_id: course.id, subject_id: subject.id}
  let(:user_subject) {FactoryGirl.create :user_subject,
    user_id: user.id, course_subject_id: course_subject.id}

  describe "PUT /user_subjects/:id" do
    before do
      sign_in user
      allow(UserSubject).to receive(:find).and_return user_subject
      allow(user_subject).to receive(:update_attributes).and_return true
      put :update, id: user_subject.id, user_subject:
        {user_id: user_subject.id, course_subject_id: user_subject.id}
    end
    it {expect(response).to redirect_to [user_subject.course_subject.course]}
  end
end
