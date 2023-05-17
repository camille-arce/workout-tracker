# == Schema Information
#
# Table name: activities
#
#  id            :integer          not null, primary key
#  description   :text
#  equipments    :string
#  image         :string
#  muscle_group  :string
#  name          :string           not null
#  target_muscle :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Activity < ApplicationRecord
  validates :name, :uniqueness => { :case_sensitive => false }
  
  belongs_to(:activity_to_exercise, { :class_name => "Exercise", :foreign_key => "activity_id", :dependent => :destroy })

  has_many :exercises
end
