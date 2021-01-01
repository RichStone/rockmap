class AddReminderPeriodToRoadmaps < ActiveRecord::Migration[6.0]
  def change
    add_column :roadmaps, :reminder_period, :integer
  end
end
