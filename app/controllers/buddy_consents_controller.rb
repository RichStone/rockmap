class BuddyConsentsController < ApplicationController
  def consent_given
    consent = BuddyConsent.find(params[:consent_id])
    consent.accountability_buddy.update!(accountability_consent_given: true)
    # Consent instance is not needed anymore
    consent.delete
    flash[:success] = 'Awesome, you are now an accountability buddy!'
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Something went wrong, maybe you\'ve already clicked that link?'
  ensure
    redirect_to root_url
  end
end
