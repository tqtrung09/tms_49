require "rails_helper"

describe "admin/courses/index.html.erb", type: :view do
  let(:course) {FactoryGirl.create :course}
  it {expect(controller.request.path_parameters[:action]).to eq "index"}
end
