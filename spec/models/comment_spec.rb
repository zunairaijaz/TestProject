require 'rails_helper'

RSpec.describe Comment, type: :model do
describe "validations" do
  it {should validate_presence_of(:title)}
end
describe "associations" do
  it {should belong_to(:user)}
  it {should belong_to(:commentable)}
end
end
