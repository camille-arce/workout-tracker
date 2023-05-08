class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.string :image
      t.string :equipments
      t.text :description
      t.string :target_muscle

      t.timestamps
    end
  end
end
