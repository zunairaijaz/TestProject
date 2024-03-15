require 'rails_helper'

RSpec.describe Tag, type: :model do

describe "validations" do
 it {should validate_presence_of(:name)}
end
 describe "associations" do
 it { should belong_to(:parent).class_name('Tag').optional }
 it { should have_many(:sub_tags).class_name('Tag').dependent(:destroy) }
 it { should have_and_belong_to_many(:campaigns) }
 end

end
