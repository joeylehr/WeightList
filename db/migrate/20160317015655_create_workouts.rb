class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :workout_type

      t.timestamps null: false
    end
  end
end
