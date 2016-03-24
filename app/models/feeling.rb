# == Schema Information
#
# Table name: feelings
#
#  id         :integer          not null, primary key
#  feeling    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feeling < ActiveRecord::Base
  has_many :post_feelings
  has_many :posts, through: :post_feelings
  

end
