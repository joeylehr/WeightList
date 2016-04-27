# == Schema Information
#
# Table name: weight_journals
#
#  id                  :integer          not null, primary key
#  title               :string
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  start_date          :date
#  starting_weight     :integer
#  final_weigh_in_date :date
#  weight_goal         :integer
#

require 'rails_helper'

describe 'WeightJournal' do

  describe "#total_days_of_diet" do 
    it 'can show a duration' do
      wj = WeightJournal.create(title: "Test Journal", start_date: "2016-04-04", final_weigh_in_date: "2016-04-10")
      expect(wj.total_days_of_diet).to eq(7)
    end
  end

  describe "#total_lbs_to_loose" do 
    it 'can show the total lbs to lose to hit goal' do
      wj = WeightJournal.create(title: "Test Journal", start_date: "2016-04-04", final_weigh_in_date: "2016-04-10", starting_weight: 221, weight_goal: 200)
      expect(wj.total_lbs_to_loose).to eq(21)
    end
  end

  describe "#avg_weight_to_loose_a_day_to_hit_goal" do 
    it 'can show the average weight to lose per day to hit goal' do
      wj = WeightJournal.create(title: "Test Journal", start_date: "2016-04-04", final_weigh_in_date: "2016-04-10", starting_weight: 221, weight_goal: 200)
      expect(wj.avg_weight_to_loose_a_day_to_hit_goal).to eq(3)
    end
  end

  describe "#last_three_days_posts" do 
    it 'can display the three most recent posts' do
      wj = WeightJournal.create(title: "Test Journal", start_date: "2016-04-04", final_weigh_in_date: "2016-04-10", starting_weight: 221, weight_goal: 200)
      feeling = Feeling.create(feeling: "amazing!")
      p1 = Post.create(entry_date: "2016-03-24", current_weight: 210, worked_out: true, motivation_level: 4, weight_journal_id: 1, notes: "yeehaw!", feeling_ids: [1])
      p2 = Post.create(entry_date: "2016-03-26", current_weight: 208, worked_out: true, motivation_level: 7, weight_journal_id: 1, notes: "huzzah!", feeling_ids: [1])
      p3 = Post.create(entry_date: "2016-03-25", current_weight: 206, worked_out: true, motivation_level: 9, weight_journal_id: 1, notes: "meow!", feeling_ids: [1])
      p4 = Post.create(entry_date: "2016-03-27", current_weight: 205, worked_out: true, motivation_level: 7, weight_journal_id: 1, notes: "meep!", feeling_ids: [1])
      expect(wj.last_three_days_posts.map {|post| post.id }).to match([4, 2, 3])
    end
  end

end