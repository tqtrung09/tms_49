require "rails_helper"
require "cancan/matchers"
require "admin/subjects_controller"

describe Admin::SubjectsController, type: :controller do
  let(:admin) {FactoryGirl.create :admin}
  let(:subject) {FactoryGirl.create :subject}

  describe "GET /subjects" do
    before do
      sign_in admin
      get :index
    end

    it "assigns @subjects" do
      expect(assigns(:subjects)).to eq([subject])
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end
  end

  describe "POST /subjects/new" do
    before do
      sign_in admin
      allow(Subject).to receive(:new).and_return subject
    end

    context "when the subject fails to save" do
      before do
        allow(subject).to receive(:save).and_return false
        post :create, subject: {name: subject.name, content: subject.content, tasks_attributes: {}}
      end
      it {expect(response).to render_template :new}
    end

    context "when the subject saves successfully" do
      before do
        allow(subject).to receive(:save).and_return true
        post :create, subject: {name: subject.name, content: subject.content, tasks_attributes: {}}
      end
      it {expect(response).to redirect_to admin_subjects_path}
    end
  end

  describe "PUT /subjects/:id" do
    before do
      sign_in admin
      allow(Subject).to receive(:find).and_return subject
    end

    context "when the subject fails to update" do
      before do
        allow(subject).to receive(:update_attributes).and_return false
        put :update, id: subject.id, subject: {name: subject.name, content: subject.content, tasks_attributes: {}}
      end
      it {expect(response).to render_template :edit}
    end

    context "when the subject update successfully" do
      before do
        allow(subject).to receive(:update_attributes).and_return true
        put :update, id: subject.id, subject: {name: subject.name, content: subject.content, tasks_attributes: {}}
      end
      it {expect(response).to redirect_to admin_subjects_path}
    end
  end

  describe "DELETE /subjects/:id" do
    context "when the subject update successfully" do
      before do
        sign_in admin
        delete :destroy, id: subject.id
      end
      it {expect(response).to redirect_to admin_subjects_path}
    end
  end
end
