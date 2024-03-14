require 'rails_helper'

RSpec.describe Tag, type: :model do
describe "validations" do
 it {should validate_presence_of(:name)}

end
# describe "associations" do
#   it {should belong_to(:parent)}
#   it {should have_many(:sub_tags)}
#   it {should have_and_belong_to_many(:campaign)}

#  end
end
