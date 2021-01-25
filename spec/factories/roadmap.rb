FactoryBot.define do
  factory :roadmap do
    the_one_thing {'Become a rockstar'}
    the_why_of_one_thing {'Because it rocks'}
    the_one_habit {'Speak daily'}
    start_date {Date.today}
    reminder_period_days { rand(0..66) }
    user
  end
end
