class AddUserIdToRoadmaps < ActiveRecord::Migration[6.0]
  def change
    add_column :roadmaps, :user_id, :integer
  end
end
