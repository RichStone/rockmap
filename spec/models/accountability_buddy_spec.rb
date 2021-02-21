# == Schema Information
#
# Table name: accountability_buddies
#
#  id                           :bigint(8)        not null, primary key
#  accountability_consent_given :boolean          default(FALSE)
#  activated_for_roadmap        :boolean          default(TRUE)
#  email                        :string
#  invite_accepted              :boolean          default(FALSE)
#  last_reminder                :date
#  reminder_period              :integer(4)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  roadmap_id                   :bigint(8)        not null
#
# Indexes
#
#  index_accountability_buddies_on_roadmap_id  (roadmap_id)
#
# Foreign Keys
#
#  fk_rails_...  (roadmap_id => roadmaps.id)
#
require 'rails_helper'

RSpec.describe AccountabilityBuddy, type: :model do
  subject(:buddy) { build(:accountability_buddy, email: email) }
  let(:email) { 'asdf@adf.com'}

  it { is_expected.to have_attributes(email: email)}

  describe '.create_with_consent_inquiry' do
    it 'creates the buddy and sends a new consent inquiry' do
      allow(BuddyConsent).to receive(:create_and_deliver)
      roadmap = FactoryBot.create(:roadmap)
      buddy =
        AccountabilityBuddy.create_with_consent_inquiry(email: 'asdf@example.com', roadmap: roadmap)
      expect(buddy).to be_persisted
      expect(buddy.email).to eq('asdf@example.com')
      expect(BuddyConsent).to have_received(:create_and_deliver).with(buddy)
    end
  end

  context 'when just created' do
    it 'does not permit reminders' do
      expect(buddy.send(:reminder_permitted)).to eq false
    end
  end

  context 'when consent given' do
    before { buddy.accountability_consent_given = true }

    it 'permits buddy reminders' do
      expect(buddy.send(:reminder_permitted)).to eq true
    end
  end
end
