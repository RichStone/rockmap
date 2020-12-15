class CreateMilestones < ActiveRecord::Migration[6.0]
  def change
    create_table :milestones do |t|
      t.string :name
      t.text :description
      t.date :liveline
      t.belongs_to :roadmap, null: false, foreign_key: true

      t.timestamps
    end
  end
end
