class CreateBuddyConsents < ActiveRecord::Migration[6.0]
  def change
    create_table :buddy_consents, id: :uuid do |t|
      t.date :valid_until
      t.integer :accountability_buddy_id

      t.timestamps
    end
  end
end
