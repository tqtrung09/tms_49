require "rails_helper"

describe Task, type: :model do
  let(:task) {FactoryGirl.create :task}
  subject {task}

  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "when name is not valid" do
      before {subject.name = nil}
      it {is_expected.to validate_presence_of :name}
    end
  end
end
