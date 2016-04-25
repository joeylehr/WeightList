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

  def active_journal
    aj = weight_journals.reject do |wj|
      wj.final_weigh_in_date < (Date.today + 1)
    end
  end

  def all_user_posts_where_motivated #include total number of posts / per journal
    User.joins(:posts).where(id: self.id).count
  end

  def self.all_user_posts_where_motivated
    User.joins(:posts).where(id: self.id).count
  end

  def self.all_active_journals 
    User.all.map do |user|
      user.active_journals
    end.reject(&:empty?).flatten.sort
  end

  def number_of_posts
    ## MOVE THIS TO JUST POST.COUNT
    User.joins(:posts).where(id: self.id).count
    # User.joins(:posts).first.posts
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
