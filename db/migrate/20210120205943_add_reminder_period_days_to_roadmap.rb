class AddReminderPeriodDaysToRoadmap < ActiveRecord::Migration[6.0]
  def change
    add_column :roadmaps, :reminder_period_days, :integer
  end
end
