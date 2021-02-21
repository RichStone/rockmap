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
class AccountabilityBuddy < ApplicationRecord
  belongs_to :roadmap

  after_save_commit :send_consent_inquiry

  private

  def send_consent_inquiry
    consent_tracker = BuddyConsent.create!(accountability_buddy_id: self.id)
    BuddyMailer.with(buddy: self, consent_link: consent_tracker.id).buddy_request.deliver_later
  end

  def reminder_permitted
    accountability_consent_given && activated_for_roadmap
  end
end
