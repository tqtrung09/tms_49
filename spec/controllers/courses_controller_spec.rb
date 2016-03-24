require "rails_helper"
require "cancan/matchers"
require "courses_controller"

describe CoursesController, type: :controller do
  let(:user) {FactoryGirl.create :user}
  let(:course) {FactoryGirl.create :course}
  let(:subject_sample) {FactoryGirl.create :subject}
  let(:course_subject) {FactoryGirl.create :course_subject,
    course_id: course.id, subject_id: subject_sample.id}

  describe "GET /courses" do
    before do
      sign_in user
      get :index
    end

    it "assigns @courses" do
      expect(assigns(:courses)).to eq([course])
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET /courses/:id" do
    context "assign @course_subjects" do
      before do
        sign_in user
        get :show, id: course.id
      end

      it "assigns @course_subjects" do
        expect(assigns(:course_subjects)).to eq([course_subject])
      end

      it "renders the index template" do
        expect(response).to render_template :show
      end
    end
  end
end
