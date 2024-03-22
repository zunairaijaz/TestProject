require 'rails_helper'

RSpec.describe "TagsControllers", type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { FactoryBot.create(:user) }
  let(:campaign) { FactoryBot.create(:campaign) }
  let(:tag) { FactoryBot.create(:tag) }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "renders the index" do
      get "/campaigns/#{campaign.id}/tags"
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders new template" do
      get "/campaigns/#{campaign.id}/tags/new"
      expect(response).to render_template :new
    end
  end



  describe "POST #create" do
    it "creates a tag" do
      tag_params = FactoryBot.attributes_for(:tag)
      expect {
        post "/campaigns/#{campaign.id}/tags", params: { tag: tag_params }
      }.to change(Tag, :count).by(1)
      expect(flash[:notice]).to eq('Tag Created Successfully!.')
    end
  end



  describe "PUT #update" do
  it "updates a tag" do
    new_name = "Updated name"
    put "/campaigns/#{campaign.id}/tags/#{tag.id}", params: { tag: { name: new_name } }
    expect(response).to have_http_status(:redirect) # Change from :ok to :redirect
    expect(tag.reload.name).to eq(new_name)
  end
end


  describe "DELETE #destroy" do
  it "deletes a tag" do
    tag # Create the tag before deletion
    expect {
      delete "/campaigns/#{campaign.id}/tags/#{tag.id}"
    }.to change(Tag, :count).by(-1)
  end
end
end
