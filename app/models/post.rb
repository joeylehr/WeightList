# == Schema Information
#
# Table name: posts
#
#  id                :integer          not null, primary key
#  entry_date        :date
#  current_weight    :integer
#  worked_out        :boolean
#  motivation_level  :integer
#  weight_journal_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  notes             :text
#

class Post < ActiveRecord::Base
  belongs_to :weight_journal
  has_many :post_feelings
  has_many :feelings, through: :post_feelings
  has_many :post_workouts
  has_many :workouts, through: :post_workouts



  # def self.index_for_a_specific_user
  #   @all_posts = Post.all
  #   binding.pry
  #   # @posts = Post.all.find(params["weight_journal_id"])
  #   @weight_journal = WeightJournal.find(params["weight_journal_id"])
  #   binding.pry
  #   @posts.select do |post|
  #     post.weight_journal_id == @weight_journal.id
  #   end
  #   binding.pry
  # end

end
