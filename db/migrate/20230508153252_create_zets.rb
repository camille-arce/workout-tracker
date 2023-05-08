class CreateZets < ActiveRecord::Migration[6.0]
  def change
    create_table :zets do |t|
      t.integer :reps, null: false
      t.integer :weight, default: 0
      t.integer :exercise_id, null: false

      t.timestamps
    end
  end
end
