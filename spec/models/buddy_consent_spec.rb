# == Schema Information
#
# Table name: buddy_consents
#
#  id                      :uuid             not null, primary key
#  valid_until             :date
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  accountability_buddy_id :integer(4)
#
require 'rails_helper'

RSpec.describe BuddyConsent, type: :model do
  subject(:buddy_consent) { BuddyConsent.new }

  it 'exposes a future valid_until date' do
    expect(buddy_consent.valid_until).to be > Time.now
  end

  describe ".create_and_deliver" do
    it "creates the constent and sends the inquiry email" do
      pending
      buddy = FactoryBot.create(:accountability_buddy)
      expect {
        BuddyConsent.create_and_deliver(buddy)
      }.to have_enqueued_mail(
             BuddyMailer, :buddy_request
           ).with(
        buddy: buddy,
        consent_tracker: BuddyConsent.find_by!(accountability_buddy: buddy)
      )
    end
  end
end
