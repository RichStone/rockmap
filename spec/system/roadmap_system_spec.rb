require 'rails_helper'

RSpec.describe "Roadmap", type: :system do
  it 'lets a Rockstar create a personal Rockmap' do
    visit '/'
    expect(current_path).to eq root_path
    click_button 'Create Your Rockmap Now!'

    expect(current_path).to eq new_roadmap_path

    fill_in 'roadmap[the_one_thing]', with: 'Build things that improve people\'s lives.'
    fill_in 'roadmap[the_why_of_one_thing]', with: 'Because it rocks!'
    fill_in 'roadmap[start_date]', with: '31.12.2020'
    fill_in 'roadmap[the_one_habit]', with: 'Affirm'

    click_button 'Go Rock!'

    expect(page).to have_content 'Rock Time!'
  end
end