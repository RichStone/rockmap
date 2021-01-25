class PeriodicRockmapReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |user|
      if email_due?(user)
        UserMailer.with(user: user).reminder_email.deliver_later
      end
    end
  end

  private

  # @return [Rational]
  def days_since_last_reminder(user)
    Date.today - user.last_motivator_date
  end

  # @return [Boolean]
  def email_due?(user)
    return false if user.roadmap.reminder_period_days == 0
    days_since_last_reminder(user) - user.roadmap.reminder_period_days == 0
  end
end
