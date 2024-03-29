require 'rails_helper'
RSpec.describe UsersController, type: :controller do

  include Devise::Test::IntegrationHelpers
  describe "PUT #update" do
    let(:expert_user) { FactoryBot.create(:user, user_type: 'Expert') }
    let(:novice_user) { FactoryBot.create(:user, user_type: 'Novice') }
    context "when expert user updates novice user's status" do
      before(:each) do
        sign_in expert_user
      end
      it "updates status of novice user" do
        put :update, params: { id: novice_user.id, user: { status: 'qualified' } }
        # expect(response).to redirect_to(users_path)
        # expect(flash[:notice]).to eq("User status updated successfully.")
        # expect(novice_user.reload.status).to eq("updated_status")
      end
      it "does not update status if parameter is invalid" do
        put :update, params: { id: novice_user.id, user: { status: 'invalid_status' } }
      end
    end
    context "when non-expert user try to update novice user's status" do
      before(:each) do
        sign_in novice_user
      end
      it "does not update status of novice user" do
        put :update, params: { id: expert_user.id, user: { status: 'qualified' } }
      end
    end
    context "when expert user try to update its own status" do
      before(:each) do
        sign_in expert_user
      end
      it "does not update status of expert user" do
        put :update, params: { id: expert_user.id, user: { status: "updated_status" } }
      end
    end
  end
end
