class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :workout_id, null: false
      t.integer :activity_id, null: false

      t.timestamps
    end
  end
end
