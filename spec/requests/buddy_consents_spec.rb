require 'rails_helper'

RSpec.describe 'BuddyConsents', type: :request do
  describe 'GET /consent_given' do
    let(:buddy) { create(:accountability_buddy, buddy_consent: consent)}
    let(:consent) { create(:buddy_consent) }
    let(:consent_id) { buddy.buddy_consent.id }

    let(:consent_request) { get "/consent_given/#{consent_id}"; buddy.reload }

    it 'confirms the buddy' do
      expect { consent_request }
        .to change { buddy.accountability_consent_given }
              .from(false).to(true)
    end

    it 'deletes the old consent instance' do
      expect(BuddyConsent.find(consent.id)).to be_present
      consent_request
      expect { BuddyConsent.find(consent.id) }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'does not create a new consent when attributes are updated' do
      consent_request
      expect(BuddyConsent.count).to eq 0
    end

    context 'when successful' do
      it 'redirects to root with success toast' do
        consent_request
        expect(response).to redirect_to(root_url)
        expect(flash[:success]).to be_present
      end
    end

    context 'when already used activation code' do
      let(:consent_id) { 'fake-id' }
      it 'redirects to root with failure toast' do
        consent_request
        expect(response).to redirect_to(root_url)
        expect(flash[:alert]).to be_present
      end
    end
  end
end
