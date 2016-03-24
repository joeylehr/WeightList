class AddColumnsToWeightJournal < ActiveRecord::Migration
  def change
    add_column :weight_journals, :start_date, :date
    add_column :weight_journals, :starting_weight, :integer
    add_column :weight_journals, :final_weigh_in_date, :date
    add_column :weight_journals, :weight_goal, :integer
  end
end
