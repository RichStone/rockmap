require 'rails_helper'

RSpec.describe BuddyConsent, type: :model do
  subject(:buddy_consent) { BuddyConsent.new }

  it 'exposes a future valid_until date' do
    expect(buddy_consent.valid_until).to be > Time.now
  end
end
