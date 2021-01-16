FactoryBot.define do
  factory :roadmap do
    the_one_thing {'Become a rockstar'}
    the_why_of_one_thing {'Because it rocks'}
    the_one_habit {'Speak daily'}
    start_date {Date.today}
    reminder_period {5}
    user
  end
end