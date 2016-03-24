# == Schema Information
#
# Table name: post_feelings
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  feeling_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostFeeling < ActiveRecord::Base
  belongs_to :post
  belongs_to :feeling
end
