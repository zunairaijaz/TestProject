FactoryBot.define do
  factory :discussion_topic do
    title { Faker::Lorem.sentence }
    association :campaign

  end
end
