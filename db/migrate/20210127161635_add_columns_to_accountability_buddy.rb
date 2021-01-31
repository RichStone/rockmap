class AddColumnsToAccountabilityBuddy < ActiveRecord::Migration[6.0]
  def change
    add_column :accountability_buddies, :accountability_consent_given, :boolean, default: false
    add_column :accountability_buddies, :activated_for_roadmap, :boolean, default: true
  end
end
