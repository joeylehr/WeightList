# == Schema Information
#
# Table name: workouts
#
#  id           :integer          not null, primary key
#  workout_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Workout < ActiveRecord::Base
  has_many :post_workouts
  has_many :posts, through: :post_workouts


end


