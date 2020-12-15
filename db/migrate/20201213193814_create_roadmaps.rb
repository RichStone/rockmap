class CreateRoadmaps < ActiveRecord::Migration[6.0]
  def change
    create_table :roadmaps do |t|
      t.string :the_one_thing
      t.text :the_why_of_one_thing
      t.string :the_one_habit
      t.date :start_date

      t.timestamps
    end
  end
end
