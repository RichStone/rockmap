class BuddyConsentsController < ApplicationController
  def consent_given
    consent = BuddyConsent.find(params[:consent_id])
    consent.accountability_buddy.update!(accountability_consent_given: true)
    # Consent instance is not needed anymore
    consent.delete
  end
end
