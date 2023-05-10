# == Schema Information
#
# Table name: zets
#
#  id          :integer          not null, primary key
#  reps        :integer          not null
#  weight      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  exercise_id :integer          not null
#
class Zet < ApplicationRecord
  belongs_to(:activity, { :required => true, :class_name => "Exercise", :foreign_key => "exercise_id" })
end
