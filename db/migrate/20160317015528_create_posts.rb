class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.date :entry_date
      t.integer :current_weight
      t.boolean :worked_out?
      t.integer :motivation_level
      t.integer :weight_journal_id

      t.timestamps null: false
    end
  end
end
