require "rails_helper"

describe User, type: :model do
  let(:user) {FactoryGirl.create :user}
  let(:course) {FactoryGirl.create :course}
  let(:subject_sample) {FactoryGirl.create :subject}
  let(:course_subject_sample) {FactoryGirl.create :course_subject,
    course_id: course.id, subject_id: subject_sample.id}
  let(:user_subject) {FactoryGirl.create :user_subject,
    course_subject_id: course_subject_sample.id, user_id: user.id}

  subject {user}
  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end
  end

  describe "#load_user_subject_of" do
    before do
      subject {user_subject}
    end
    subject {user.load_user_subject_of(course_subject_sample)}
    it {is_expected.to eq(subject)}
  end
end
