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
require 'securerandom'

class BuddyConsent < ApplicationRecord
  attribute :valid_until, default: Date.tomorrow
  belongs_to :accountability_buddy

  class << self
    def create_and_deliver(buddy)
      consent = BuddyConsent.create!(accountability_buddy: buddy)
      BuddyMailer
        .with(buddy: buddy, consent_id: consent.id)
        .buddy_request
        .deliver_later
      consent
    end
  end
end
