class CreateFeelings < ActiveRecord::Migration
  def change
    create_table :feelings do |t|
      t.string :feeling

      t.timestamps null: false
    end
  end
end
