# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  birth_date      :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#  password_digest :string
#

class User < ActiveRecord::Base
  has_secure_password

  # attr_accessor :email, :password, :password_confirmation
  validates_uniqueness_of :email
  has_many :weight_journals
  has_many :posts, through: :weight_journals
  
  def full_name
    "#{first_name} #{last_name}"
  end

  def completed_journals
    cj = weight_journals.select do |wj|
      wj.final_weigh_in_date < (Date.today + 1)
    end
  end

  def self.all_completed_journals 
    User.all.map do |user|
      user.completed_journals
    end.reject(&:empty?).flatten.sort
  end

  def active_journals
    aj = weight_journals.reject do |wj|
      wj.final_weigh_in_date < (Date.today + 1)
    end
  end

  # def all_user_posts_where_motivated #include total number of posts / per journal
  #   User.joins(:posts).where(id: self.id).count
  # end

  def self.all_user_posts_where_motivated
    User.joins(:posts).where(id: self.id).count
  end

  def self.all_active_journals 
    User.all.map do |user|
      user.active_journals
    end.reject(&:empty?).flatten.sort
  end

  def self.number_of_posts #for admin
    ## MOVE THIS TO JUST POST.COUNT
    User.joins(:posts).count
  end

  def posts_where_worked_out
  end

  def self.all_user_posts_where_motivated
  end

  def top_five_users_weight_loss_journals
    #use take to do limit 5 also need where journals are completed
  end

  def self.all_weight_goals
  end

  def percentage_highly_motivated_posts
    all_posts = WeightJournal.where(user_id: self.id).map {|wj| wj.posts}.flatten
    highly_motivated = all_posts.select {|wj| wj.motivation_level >= 7}
    percentage = (highly_motivated.count / all_posts.count.to_f) * 100
  end

  def percentage_mid_motivated_posts
    all_posts = WeightJournal.where(user_id: self.id).map {|wj| wj.posts}.flatten
    mid_motivated = all_posts.select {|wj| wj.motivation_level < 7 && wj.motivation_level >= 4 }
    percentage = (mid_motivated.count / all_posts.count.to_f) * 100
  end

  def percentage_low_motivated_posts
    all_posts = WeightJournal.where(user_id: self.id).map {|wj| wj.posts}.flatten
    low_motivated = all_posts.select {|wj| wj.motivation_level < 4 && wj.motivation_level >= 1 }
    percentage = (low_motivated.count / all_posts.count.to_f) * 100
  end

  def number_of_posts
    User.find(self.id).posts.count
  end

  def num_of_times_worked_out
    posts_arr = User.find(self.id).posts
    posts_arr.select {|post| post.worked_out == true}.count
  end

  def percentage_of_times_worked_out
    num_of_times_worked_out.to_f / number_of_posts 
  end



# Percentage of times worked
# quick view stats

### THE TWO BELOW CLASS METHODS MIGHT NOT BE NECESSARY 
##AS WE SHOULD BE CALLING IT ON THE WEIGHTJOURNAL MODEL**




  # def self.all_completed_journals 
  #   User.all.map do |user|
  #     user.completed_journals
  #   end.reject(&:empty?).flatten.sort
  # end


  # def reached_weight_goal
  #   if journal_completed

  # end


  # def self.actual_completed_goals
  # end
  # def self.reach_weight_goal
  # end

  # def total_weight_lost(includes all journals by a user)

  # end

  # CREATE METHOD USING THE PRESENT DATE --> THIS WOULD GO INTO A SEPERATE SHOW PAGE SO THE USER WOULDN'T BEING SEEING THE ORIGINAL INFORMATION..
  # CONTROLLER FOR LEADER BOARD NOT MODEL NEEDED -- CREATE ROUTES AND VIEWS
end
