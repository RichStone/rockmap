class AddLastMotivatorDateToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_motivator_date, :date, default: Date.today
  end
end
