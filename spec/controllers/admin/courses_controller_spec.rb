require "rails_helper"
require "cancan/matchers"
require "admin/courses_controller"

describe Admin::CoursesController, type: :controller do
  let(:admin) {FactoryGirl.create :admin}
  let(:course) {FactoryGirl.create :course}
  let(:subject_sample) {FactoryGirl.create :subject}
  let(:course_subject) {FactoryGirl.create :course_subject,
    course_id: course.id, subject_id: subject_sample.id}

  describe "GET /courses" do
    before do
      sign_in admin
      get :index
    end

    it "assigns @courses" do
      expect(assigns(:courses)).to eq([course])
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end
  end

  describe "POST /courses/new" do
    before do
      sign_in admin
      allow(Course).to receive(:new).and_return course
    end

    context "when the course fails to save" do
      before do
        allow(course).to receive(:save).and_return false
        post :create, course: {name: course.name, content: course.content,
          start_date: course.start_date, subject_ids: {}}
      end
      it {expect(response).to render_template :new}
    end

    context "when the course saves successfully" do
      before do
        allow(course).to receive(:save).and_return true
        post :create, course: {name: course.name, content: course.content,
          start_date: course.start_date, subject_ids: {}}
      end
      it {expect(response).to redirect_to admin_courses_path}
    end
  end

  describe "PUT /courses/:id" do
    before do
      sign_in admin
      allow(Course).to receive(:find).and_return course
    end

    context "when the course fails to update" do
      before do
        allow(course).to receive(:update_attributes).and_return false
        put :update, id: course.id, course: {name: course.name, content: course.content,
          start_date: course.start_date, subject_ids: {}}
      end
      it {expect(response).to render_template :edit}
    end

    context "when the course update successfully" do
      before do
        allow(course).to receive(:update_attributes).and_return true
        put :update, id: course.id, course: {name: course.name, content: course.content,
          start_date: course.start_date, subject_ids: {}}
      end
      it {expect(response).to redirect_to admin_courses_path}
    end
  end

  describe "DELETE /courses/:id" do
    context "when the course delete successfully" do
      before do
        sign_in admin
        delete :destroy, id: course.id
      end
      it {expect(response).to redirect_to admin_courses_path}
    end
  end

  describe "GET /courses/:id" do
    context "assign @course_subjects" do
      before do
        sign_in admin
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
