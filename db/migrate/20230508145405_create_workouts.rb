class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.integer :user_id, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
