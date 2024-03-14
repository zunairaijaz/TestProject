# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'validates email' do
      u = User.new(email: '', password: 'password')
      expect(u).not_to be_valid
      expect(u.errors[:email]).to include("can't be blank")
    end

    it 'validates password' do
      u = User.new(email: 'test@example.com', password: '')
      expect(u).not_to be_valid
      expect(u.errors[:password]).to include("can't be blank")
    end
  end
end
