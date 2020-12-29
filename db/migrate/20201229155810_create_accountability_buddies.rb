class CreateAccountabilityBuddies < ActiveRecord::Migration[6.0]
  def change
    create_table :accountability_buddies do |t|
      t.string :email
      t.boolean :invite_accepted, default: false
      t.integer :reminder_period
      t.date :last_reminder
      t.belongs_to :roadmap, null: false, foreign_key: true

      t.timestamps
    end
  end
end
