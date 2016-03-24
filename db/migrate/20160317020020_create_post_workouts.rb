class CreatePostWorkouts < ActiveRecord::Migration
  def change
    create_table :post_workouts do |t|
      t.integer :post_id
      t.integer :workout_id

      t.timestamps null: false
    end
  end
end
