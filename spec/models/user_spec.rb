# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {create(:user)}
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
    it 'validates user_type inclusion' do
      u = User.new(email: 'test@example.com', password: '123456', user_type: 'Admin')
      u.valid?
      expect(u.errors[:user_type]).to include("is not included in the list")
    end
    it "requires profession & service for expert user" do
      u=User.new(email:"test@example.com",password:"123456",user_type:"Expert")
      expect(u).not_to be_valid
      expect(u.errors[:profession]).to include("can't be blank")
      expect(u.errors[:service]).to include("can't be blank")

    end
    it "qualified novice can create topics " do
      u=User.new(email:"test@example.com",password:"123456",user_type:"Novice", status:"qualified")
      expect(u.can_create_topics?).to eq(true)

    end
    it "Unqualified novice can't create topics " do
      u=User.new(email:"test@example.com",password:"123456",user_type:"Novice", status:"un_qualified")
      expect(u.can_create_topics?).to eq(false)

    end
    it "expert can create campaigns" do
     u=User.new(email:"test@example.com",password:"123456",user_type:"Expert")
     expect(u.can_create_campaigns?).to eq(true)
    end
    it "Novice can't create campaigns" do
      u=User.new(email:"test@example.com",password:"123456",user_type:"Novice")
      expect(u.can_create_campaigns?).to eq(false)
     end
  end
end
