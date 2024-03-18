require 'rails_helper'

RSpec.describe "TagsControllers", type: :request do
include Devise::Test::IntegrationHelpers
let(:user) { FactoryBot.create(:user) }
let(:campaign) { FactoryBot.create(:campaign) }
let(:tag) { FactoryBot.create(:tag) } # No need to assign a campaign here

before(:each) do
  sign_in user
end

describe "GET #index" do
it "renders the index " do
  get "/campaigns/#{campaign.id}/tags"

end
end
describe "GET #new" do
    it "renders new template" do
      get "/campaigns/#{campaign.id}/tags/new"

    end
end
describe "Get #show" do
  it "renders show template" do
    get "/tags/#{tag.id}"
  end
end
describe "POST #create" do
it "creates a tag" do
tag_params= FactoryBot.attributes_for(:tag)
post "/campaigns/#{campaign.id}/tags", params:{tag: tag_params}
end
end
describe "PUT #edit" do
  it "renders edit template " do
  put "/tags/#{tag.id}/edit"
  end
end
describe "PUT #update" do
  it "updates a tag" do
  new_name="Updated name"
  put "/tags/#{tag.id}" , params: {tag: {name: new_name}}
  end
end
describe "DELETE #destroy" do
  it "deletes a tag" do
  delete "/tags/#{tag.id}"
  end
end
end
