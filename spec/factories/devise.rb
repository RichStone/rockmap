FactoryBot.define do
  factory :user do
    id {1}
    email {'test@user.com'}
    password {'qwerty55'}
    last_motivator_date {Date.today}
  end
end