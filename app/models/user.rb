# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  dob             :date
#  email           :string
#  first_name      :string
#  fitness_goal    :text
#  height          :integer          default(0)
#  last_name       :string
#  password_digest :string
#  username        :string
#  weight          :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:workouts, { :class_name => "Workout", :foreign_key => "user_id", :dependent => :destroy })
end
