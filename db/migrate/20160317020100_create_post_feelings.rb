class CreatePostFeelings < ActiveRecord::Migration
  def change
    create_table :post_feelings do |t|
      t.integer :post_id
      t.integer :feeling_id

      t.timestamps null: false
    end
  end
end
