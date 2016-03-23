require "rails_helper"
require "cancan/matchers"
require "admin/user_courses_controller"

describe Admin::UserCoursesController, type: :controller do
  let(:admin) {FactoryGirl.create :admin}
  let(:user) {FactoryGirl.create :user}
  let(:course) {FactoryGirl.create :course}

  describe "PUT /courses/:course_id/user_courses" do
    before do
      sign_in admin
      allow(Course).to receive(:find).and_return course
    end

    context "when the course fails to update" do
      before do
        allow(course).to receive(:update_attributes).and_return false
        put :update, course_id: course.id, course: {user_ids: {}}
      end
      it {expect(response).to render_template :show}
    end

    context "when the course update successfully" do
      before do
        allow(course).to receive(:update_attributes).and_return true
        put :update, course_id: course.id, course: {user_ids: {}}
      end
      it {expect(response).to redirect_to admin_courses_path}
    end
  end

  describe "GET /courses/:course_id/user_courses" do
    context "assign @course_subjects" do
      before do
        sign_in admin
        get :show, course_id: course.id
      end

      it "assigns @course_subjects" do
        expect(assigns(:users)).to eq([user])
      end

      it "renders the index template" do
        expect(response).to render_template :show
      end
    end
  end
end
