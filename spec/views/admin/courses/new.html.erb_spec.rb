require "rails_helper"

describe "admin/courses/new.html.erb", type: :view do
  let(:course) {FactoryGirl.create :course}
  let(:subject) {FactoryGirl.create :subject}
  it {expect(controller.request.path_parameters[:action]).to eq "new"}

  describe "course is testing" do
    before do
      assign :course, course
      assign :subject_ids, subject
      assign :subjects, [subject]
      render
    end
    it {expect(view).to render_template(partial: "_form", count: 1)}

    it "test form selector" do
      expect(rendered).to have_selector "form" do |form|
        form.is_epected.to have_selector "input", name: "name"
        form.is_epected.to have_selector "input", name: "content"
        form.is_epected.to have_selector "input", type: "submit"
      end
    end
  end
end
