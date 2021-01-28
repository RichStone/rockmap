def user_with_roadmap(last_motivator_date=Date.today, reminder_period_days=7)
  FactoryBot.create(:user, last_motivator_date: last_motivator_date) do |user|
    FactoryBot.create(:roadmap, reminder_period_days: reminder_period_days, user: user) do |roadmap|
      FactoryBot.create_list(:milestone, 2, roadmap: roadmap)
      # TODO: add accountability buddy
    end
  end
end
