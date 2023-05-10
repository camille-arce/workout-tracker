class AddMuscleGroupToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :muscle_group, :string
  end
end
