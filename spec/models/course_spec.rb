require "rails_helper"

describe Course, type: :model do
  let(:course) {FactoryGirl.create :course}
  let(:user) {FactoryGirl.create :user}

  subject {course}
  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "when name is not valid" do
      before {subject.name = nil}
      it {is_expected.to have(1).error_on(:name)}
    end

    context "when content is not valid" do
      before {subject.content = nil}
      it {is_expected.to have(1).error_on(:content)}
    end

    context "when end_date less than start_date" do
      before {subject.start_date = Date.today; subject.end_date = Date.today - 2.days}
      it {is_expected.not_to be_valid}
    end
  end

  describe "call_back" do
    context "when after update course" do
      before do
        subject_sample = FactoryGirl.create :subject
        FactoryGirl.create :course_subject, course_id: subject.id, subject_id: subject_sample.id
        FactoryGirl.create :user_course, course_id: subject.id, user_id: user.id
        subject.update_attributes status: :finish
      end
      it {expect(UserSubject.count).to eq(1)}
    end
  end
end
