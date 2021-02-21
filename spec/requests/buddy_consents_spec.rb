require 'rails_helper'

RSpec.describe 'BuddyConsents', type: :request do
  describe 'GET /consent_given' do
    let!(:buddy) { create(:accountability_buddy)}
    let!(:consent_id) { buddy.buddy_consent.id }

    let(:consent_request) { get "/consent_given/#{buddy.buddy_consent.id}"; buddy.reload }

    it 'confirms the buddy' do
      expect { consent_request }
        .to change { buddy.accountability_consent_given }
              .from(false).to(true)
    end

    it 'deletes the old consent instance' do
      expect(BuddyConsent.find(consent_id)).to be_present
      consent_request
      expect { BuddyConsent.find(consent_id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'does not create a new consent when attributes are updated' do
      consent_request
      expect(BuddyConsent.count).to eq 0
    end
  end
end
