class AccountabilityBuddy < ApplicationRecord
  belongs_to :roadmap

  def reminder_permitted
    accountability_consent_given && activated_for_roadmap
  end
end
