class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :users, :starting_weight
    remove_column :users, :weight_goal
    remove_column :users, :final_weigh_in_date
    remove_column :users, :start_date
  end
end
