# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class Workout < ApplicationRecord
  validates :user_id, :presence => true
  validates :date, :presence => true

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:exercises, { :class_name => "Exercise", :foreign_key => "workout_id", :dependent => :destroy })
end
