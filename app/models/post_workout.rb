# == Schema Information
#
# Table name: post_workouts
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  workout_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostWorkout < ActiveRecord::Base
  belongs_to :post
  belongs_to :workout
end
