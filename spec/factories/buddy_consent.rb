FactoryBot.define do
  factory :buddy_consent do
    valid_until { Date.today + 7 }
    accountability_buddy
  end
end
