FactoryBot.define do
  factory :comment do
    title { Faker::Lorem.sentence }
    user
    association :commentable, factory: :discussion_topic

  end
end
