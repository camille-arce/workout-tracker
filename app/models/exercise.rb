# == Schema Information
#
# Table name: exercises
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  activity_id :integer          not null
#  workout_id  :integer          not null
#
class Exercise < ApplicationRecord
validates :activity_id, :presence => true
validates  :workout_id, :presence => true

belongs_to(:workout, { :required => true, :class_name => "Workout", :foreign_key => "workout_id" })
belongs_to(:activity, { :required => true, :class_name => "Activity", :foreign_key => "activity_id" })
has_many(:zets, { :class_name => "Zet", :foreign_key => "exercise_id", :dependent => :destroy })
end
