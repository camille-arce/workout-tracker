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
end
