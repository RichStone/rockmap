FactoryBot.define do
  factory :confirmed_blank_user, class: User do
    # This user does not have a roadmap yet.
    email {'confirmed_blank@user.com'}
    password {'qwerty55'}
    confirmed_at { Time.now }
  end

  factory :unconfirmed_user, class: User do
    # This user registered but never confirmed their email.
    email {'unconfirmed@user.com'}
    password {'qerwerq234'}
  end

  factory :user do
    email {Faker::Internet.email}
    password {'heejw44325'}
    last_motivator_date {Date.today}
    confirmed_at {Time.now}
  end
end