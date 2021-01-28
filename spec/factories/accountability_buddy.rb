FactoryBot.define do
  factory :accountability_buddy do
    accountability_consent_given { false }
    activated_for_roadmap { true }
    roadmap
  end
end
