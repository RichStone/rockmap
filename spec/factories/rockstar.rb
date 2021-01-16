def user_with_roadmap
  FactoryBot.create(:user) do |user|
    FactoryBot.create(:roadmap, user: user) do |roadmap|
      FactoryBot.create_list(:milestone, 2, roadmap: roadmap)
    end
  end
end
