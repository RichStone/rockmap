require 'rails_helper'

RSpec.describe "Roadmap", type: :system do
  it "enable me to create coins and publish to ebay" do
    visit "/"
    expect(page).to have_text('Rockmap')

    fill_in "The ONE Thing", with: "Building products!"
    fill_in "Milestone", with: "Rockmap"
    fill_in "Milestone Date", with: '31.12.2020'
    fill_in "The ONE Habit", with: "Meditate"
    click_button 'Go Rock!'

    expect(page).to have_text('Rockmap')
  end
end