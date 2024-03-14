FactoryBot.define do
  factory :campaign do
    title { Faker::Lorem.sentence }
    purpose { Faker::Lorem.paragraph }
    estimated_duration { %w[within\ 1\ week within\ 1\ month within\ 3\ months].sample }
    user
  end
end
