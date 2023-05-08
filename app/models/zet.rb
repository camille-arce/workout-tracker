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
  rails generate draft:resource zet reps:integer weight:integer exercise_id:integer
end
