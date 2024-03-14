require 'rails_helper'

RSpec.describe Todo, type: :model do
describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
end
describe 'associations' do
    it {should belong_to(:campaign)}
end

end
