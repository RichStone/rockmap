require 'rails_helper'

RSpec.describe "Roadmap", type: :system do
  it "enable me to create coins and publish to ebay" do
    visit "/"
    expect(page).to have_text('Rockmap')
  end
end