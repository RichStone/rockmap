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
end
