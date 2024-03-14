require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of(:purpose) }
    it { should validate_inclusion_of(:estimated_duration).in_array(['within 1 week', 'within 1 month', 'within 3 months']) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:todos).dependent(:destroy) }
    it { should have_many(:discussion_topics).dependent(:destroy) }
    it { should have_many(:comments) }
    it { should have_and_belong_to_many(:tags) }
    it { should have_many_attached(:images) }
  end


end
