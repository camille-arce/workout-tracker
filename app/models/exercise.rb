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
end
