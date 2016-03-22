require "rails_helper"

describe Subject, type: :model do
  let(:subject_sample) {FactoryGirl.create :subject}
  subject {subject_sample}

  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "when name is not valid" do
      before {subject.name = nil}
      it {is_expected.to validate_presence_of :name}
    end

    context "when content is not valid" do
      before {subject.content = nil}
      it {is_expected.to validate_presence_of :content}
    end
  end

  describe "nested attributes" do
    it{is_expected.to accept_nested_attributes_for(:tasks).allow_destroy true}
  end
end
