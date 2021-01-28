require 'rails_helper'

RSpec.describe AccountabilityBuddy, type: :model do
  subject(:buddy) { AccountabilityBuddy.new }

  context 'when just created' do
    it "does not permit reminders" do
      expect(buddy.reminder_permitted).to eq false
    end
  end

  context 'when consent given' do
    before { buddy.accountability_consent_given = true }

    it 'permits buddy reminders' do
      expect(buddy.reminder_permitted).to eq true
    end
  end
end
