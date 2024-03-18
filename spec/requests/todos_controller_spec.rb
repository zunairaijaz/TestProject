require 'rails_helper'

RSpec.describe "TodosControllers", type: :request do
include Devise::Test::IntegrationHelpers

let(:user) {FactoryBot.create(:user)}
let(:campaign){FactoryBot.create(:campaign)}
let(:todo){FactoryBot.create(:todo)}

before(:each) do
  sign_in user
end
  describe "GET #index" do
it "renders index template" do
get "/campaigns/#{campaign.id}/todos"
end
end
describe "GET #new" do
it "resnders new template" do
  get "/campaigns/#{campaign.id}/todos/new"
end
end
describe "POST #create" do
todo_params=FactoryBot.attributes_for(:todo)
it "creates a todo list" do
  get "/campaigns/#{campaign.id}/todos", params: {todo: todo_params}
end
end
describe "GET #edit" do
it "renders edit template" do
put "/todos/#{todo.id}/edit"
end
end
describe "PUT #update" do
it "updates todo list" do
new_title="updated title"
new_description= "updated description"
put "/campiagns/#{campaign.id}/todos/#{todo.id}", params:{todo: {title: new_title, description:new_description}}
end
end
describe "DELETE #destroy" do
  it "deletes a todo list" do
    delete "/campaigns/#{campaign.id}/todos/#{todo.id}"
  end
end
end
