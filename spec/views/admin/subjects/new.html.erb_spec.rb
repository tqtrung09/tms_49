require "rails_helper"

describe "admin/subjects/new.html.erb", type: :view do
  let(:subject) {FactoryGirl.create :subject}
  it {expect(controller.request.path_parameters[:action]).to eq "new"}

  describe "course is testing" do
    before do
      assign :subject, subject
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
