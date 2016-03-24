class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.integer :starting_weight
      t.integer :weight_goal
      t.date :final_weigh_in_date

      t.timestamps null: false
    end
  end
end
