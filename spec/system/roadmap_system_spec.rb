require 'rails_helper'

RSpec.describe "Roadmap", type: :system do
  it 'lets a Rockstar sign up' do
    visit '/'
    expect(current_path).to eq root_path
    find('.new-rockmap-btn', match: :first).click

    expect(current_path).to eq new_user_session_path
    click_link 'Sign up'
    fill_in 'user[email]', with: 'pavel@tolstoi.com'
    fill_in 'user[password]', with: 'humanoidx1234'
    fill_in 'user[password_confirmation]', with: 'humanoidx1234'
    find(:xpath, '//input[@type="submit"]').click

    # User is not logged in yet since they are unconfirmed. They are directed to
    # the root again in this case.
    expect(current_path).to eq root_path
  end

  it 'lets Rockstar create a new Rockmap' do
    login_as(create(:confirmed_blank_user))

    visit '/'
    expect(current_path).to eq '/roadmaps/new'

    fill_in 'roadmap[the_one_thing]', with: 'Advocate Ruby.'
    fill_in 'roadmap[the_why_of_one_thing]', with: 'Because it rocks!'
    fill_in 'roadmap[start_date]', with: '31.12.2020'
    fill_in 'roadmap[the_one_habit]', with: 'Read\'em all!'
    find(:xpath, '//input[@type="submit"]').click

    expect(page).to have_content 'Your One Thing'
  end
end
