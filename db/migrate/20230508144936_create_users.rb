class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.integer :height, default: 0
      t.integer :weight, default: 0
      t.text :fitness_goal

      t.timestamps
    end
  end
end
