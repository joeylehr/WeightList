class CreateWeightJournals < ActiveRecord::Migration
  def change
    create_table :weight_journals do |t|
      t.string :title
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
