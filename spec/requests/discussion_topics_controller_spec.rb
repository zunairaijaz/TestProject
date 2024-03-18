require 'rails_helper'

RSpec.describe "DiscussionTopicsControllers", type: :request do
include Devise::Test::IntegrationHelpers
let(:user){FactoryBot.create(:user)}
let(:campaign){FactoryBot.create(:campaign)}
let(:discussion_topic){FactoryBot.create(:discussion_topic,campaign: campaign)}

before(:each) do
  sign_in user
end
describe "GET #show" do
  it "renders the show template" do
    get "/campaigns/#{campaign.id}/discussion_topics/#{discussion_topic.id}"
  end
end
describe "GET #index" do
  it "renders the index template" do
    get "/campaigns/#{campaign.id}/discussion_topics"

  end
end
describe "PUT #update" do
  it "updates the discussion topic" do
    new_title="updates Title"
    put "/campaigns/#{campaign.id}/discussion_topics/#{discussion_topic.id}", params: {discussion_topic: {title: new_title}  }
    discussion_topic.reload
  end
end
describe "GET #new" do
    it "renders the new template" do
      get "/campaigns/#{campaign.id}/discussion_topics/new"
    end
  end
describe "POST #create" do
let(:discussion_topic_params) {FactoryBot.create(:discussion_topic)}
  it "creates the discussion topic" do
    put "/campaigns/#{campaign.id}/discussion_topics/", params: {discussion_topic: discussion_topic_params }
    discussion_topic.reload
  end
end
describe "DELETE #destroy" do
  it "Deletes the discussion topic" do
    delete "/campaigns/#{campaign.id}/discussion_topics/#{discussion_topic.id}"
    discussion_topic.reload
  end
end

end
