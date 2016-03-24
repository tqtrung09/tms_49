require "rails_helper"

describe "admin/courses/show.html.erb", type: :view do
  let(:course) {FactoryGirl.create :course}
  let(:subject) {FactoryGirl.create :subject}
  let(:course_subject) {FactoryGirl.create :course_subject,
    course_id: course.id, subject_id: subject.id, status: 0}

  it {expect(controller.request.path_parameters[:action]).to eq "show"}

  describe "course_subjects is testing" do
    before do
      assign :course_subjects, [course_subject]
      assign :course, course
      assign :status, 0
      render
    end

    it "renders the show template" do
      expect(view).to render_template("admin/courses/show")
    end

    it "link is testing" do
      expect(rendered).to have_link("Start")
    end
  end
end
