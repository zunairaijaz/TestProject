FactoryBot.define do
  factory :user do
    email {Faker::Internet.email  }
  password {Faker::Internet.password(min_length: 6)}
  username {Faker::Internet.username }
  status { User.statuses.keys.sample }
  user_type { %w[Novice Expert].sample } # Choose a random user type from the allowed values
  after(:build) do |user, evaluator|
    if user.expert?
      user.profession = Faker::Job.title
      user.service = Faker::Company.bs
    end
  end

  end
end
