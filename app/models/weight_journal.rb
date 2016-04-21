# == Schema Information
#
# Table name: weight_journals
#
#  id                  :integer          not null, primary key
#  title               :string
#  user_id             :integer
#  start_date          :date
#  starting_weight     :integer
#  final_weigh_in_date :date
#  weight_goal         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class WeightJournal < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :post_workouts, through: :posts
  has_many :workouts, through: :posts
  has_many :post_feelings, through: :posts
  has_many :feelings, through: :post_feelings

  validates :title, :start_date, :starting_weight, :weight_goal, :final_weigh_in_date, presence: true

  def total_lbs_to_loose
    starting_weight.to_f - weight_goal.to_f
  end

  def total_days_of_diet
    ((final_weigh_in_date - start_date).to_i + 1)
  end

  def avg_weight_to_loose_a_day_to_hit_goal
    weight = total_lbs_to_loose / total_days_of_diet
    weight.round(2)
  end

  def total_num_of_posts
    # Post.joins(:weight_journal).where(weight_journal_id: self.id).count --> NOT A GOOD WAY OF DOING!
    Post.where(weight_journal_id: self.id).count
  end

  def array_of_workouts
    array = []
    self.post_ids.each do |post_id|
      array << PostWorkout.where(post_id: post_id)
    end
      array.flatten.map do |w|
        Workout.find(w.workout_id).workout_type
    end
  end

  def array_of_feelings
    array = []
    self.post_ids.each do |post_id|
      array << PostFeeling.where(post_id: post_id)
    end
      array.flatten.map do |w|
        Feeling.find(w.feeling_id).feeling
    end
  end

 def most_popular_exercise
    num_hash = Hash[array_of_workouts.uniq.map { |a| [a, array_of_workouts.count(a)] }]
    final = num_hash.map { |k, v| k if v == num_hash.values.max }
  end


  def most_popular_feeling
    num_hash = Hash[array_of_feelings.uniq.map { |a| [a, array_of_feelings.count(a)] }]
    final = num_hash.map { |k, v| k if v == num_hash.values.max }
    final.compact
  end

  # joe = User.first.weight_journals.first
  def last_three_days_posts
    self.post_ids[0..2].map do |post_id|
      Post.find(post_id)
    end.compact
  end

  def most_recent_weight
    Post.where(weight_journal_id: self.id).order(id: :desc).limit(1).first.current_weight
  end

  def number_of_posts_that_worked_out
    Post.joins(:weight_journal).where(weight_journal_id: self.id).where(worked_out: true).count
  end

  def workouts_percentage
     worked_out = (number_of_posts_that_worked_out.to_f / total_num_of_posts.to_f)
     percentage = (worked_out*100) 
  end

  def exercises_listed_in_order
    totals = WeightJournal.joins(:workouts).where(id: self.id).first.workouts.group(:workout_type).count
    total = totals.sort_by{|k,v| v}.reverse.to_h
  end

  def feelings_listed_in_order
    totals = WeightJournal.joins(:feelings).where(id: self.id).first.feelings.group(:feeling).count
    total = totals.sort_by{|k,v| v}.reverse.to_h
  end

  def last_submitted_post
    Post.where(weight_journal_id: self.id).last
    # User.last.weight_journals.second.posts.last
  end

  def self.most_popular_exercise
  end

  # def self.total_work_outs

  def posts_where_feeling_motivated_levels_of(lvl1, lvl2)
    #use take(3)
  end

  def weight_lost_from_the_last_three_days
    #use take(3)
  end

  def weight_lost_from_the_last_three_days
    #use take(7)
  end

  def weight_lost_from_date_range(date1, date2)
    #user supplies two agruments 
  end

  def self.all_completed_journals 
    WeightJournal.all.select do |wj|
      wj.final_weigh_in_date < (Date.today + 1)
    end
  end
  
  def self.all_active_journals 
    WeightJournal.all.reject do |wj|
      wj.final_weigh_in_date < (Date.today + 1)
    end
  end

end
