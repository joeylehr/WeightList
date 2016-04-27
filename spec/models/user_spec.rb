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

require 'rails_helper'

describe 'User' do

  describe '#completed_journals' do 
    it 'can show all completed journals' do
      user = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
      wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
      wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
      all_wjs = user.weight_journals
      expect(user.completed_journals.count).to eq(1) 
    end
  end

  describe '#active_journals' do 
    it 'can show all active journals' do
      user = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
      wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
      wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
      wj3 = WeightJournal.create(title: "Third Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
      all_wjs = user.weight_journals
      expect(user.active_journals.count).to eq(1) 
    end
  end

  describe '#percentage_highly_motivated_posts' do 
    it 'can show all posts from all wjs that include a high level of motivation' do 
      user = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
      wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
      wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
      feeling = Feeling.create(feeling: "amazing!")
      p1 = Post.create(entry_date: "2016-03-24", current_weight: 210, worked_out: true, motivation_level: 1, weight_journal_id: 1, notes: "yeehaw!", feeling_ids: [1])
      p2 = Post.create(entry_date: "2016-03-26", current_weight: 208, worked_out: true, motivation_level: 3, weight_journal_id: 1, notes: "huzzah!", feeling_ids: [1])
      p3 = Post.create(entry_date: "2016-03-25", current_weight: 206, worked_out: true, motivation_level: 9, weight_journal_id: 1, notes: "meow!", feeling_ids: [1])
      p4 = Post.create(entry_date: "2016-03-27", current_weight: 205, worked_out: true, motivation_level: 7, weight_journal_id: 1, notes: "meep!", feeling_ids: [1])
      expect(user.percentage_highly_motivated_posts).to eq(50)
    end
  end

  describe '#percentage_mid_motivated_posts' do 
    it 'can show all posts from all wjs that include a high level of motivation' do 
      user = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
      wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
      wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
      feeling = Feeling.create(feeling: "amazing!")
      p1 = Post.create(entry_date: "2016-03-24", current_weight: 210, worked_out: true, motivation_level: 1, weight_journal_id: 1, notes: "yeehaw!", feeling_ids: [1])
      p2 = Post.create(entry_date: "2016-03-26", current_weight: 208, worked_out: true, motivation_level: 5, weight_journal_id: 1, notes: "huzzah!", feeling_ids: [1])
      p3 = Post.create(entry_date: "2016-03-25", current_weight: 206, worked_out: true, motivation_level: 9, weight_journal_id: 1, notes: "meow!", feeling_ids: [1])
      p4 = Post.create(entry_date: "2016-03-27", current_weight: 205, worked_out: true, motivation_level: 7, weight_journal_id: 1, notes: "meep!", feeling_ids: [1])
      expect(user.percentage_mid_motivated_posts).to eq(25)
    end
  end

  describe '#percentage_mid_motivated_posts' do 
    it 'can show all posts from all wjs that include a high level of motivation' do 
      user = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
      wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
      wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
      feeling = Feeling.create(feeling: "amazing!")
      p1 = Post.create(entry_date: "2016-03-24", current_weight: 210, worked_out: true, motivation_level: 1, weight_journal_id: 1, notes: "yeehaw!", feeling_ids: [1])
      p2 = Post.create(entry_date: "2016-03-26", current_weight: 208, worked_out: true, motivation_level: 5, weight_journal_id: 1, notes: "huzzah!", feeling_ids: [1])
      p3 = Post.create(entry_date: "2016-03-25", current_weight: 206, worked_out: true, motivation_level: 9, weight_journal_id: 1, notes: "meow!", feeling_ids: [1])
      p4 = Post.create(entry_date: "2016-03-27", current_weight: 205, worked_out: true, motivation_level: 7, weight_journal_id: 1, notes: "meep!", feeling_ids: [1])
      expect(user.percentage_mid_motivated_posts).to eq(25)
    end
  end

  describe '#percentage_low_motivated_posts' do 
    it 'can show all posts from all wjs that include a high level of motivation' do 
      user = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
      wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
      wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
      feeling = Feeling.create(feeling: "amazing!")
      p1 = Post.create(entry_date: "2016-03-24", current_weight: 210, worked_out: true, motivation_level: 1, weight_journal_id: 1, notes: "yeehaw!", feeling_ids: [1])
      p2 = Post.create(entry_date: "2016-03-26", current_weight: 208, worked_out: true, motivation_level: 2, weight_journal_id: 1, notes: "huzzah!", feeling_ids: [1])
      p3 = Post.create(entry_date: "2016-03-25", current_weight: 206, worked_out: true, motivation_level: 3, weight_journal_id: 1, notes: "meow!", feeling_ids: [1])
      p4 = Post.create(entry_date: "2016-03-27", current_weight: 205, worked_out: true, motivation_level: 7, weight_journal_id: 1, notes: "meep!", feeling_ids: [1])
      expect(user.percentage_low_motivated_posts).to eq(75)
    end
  end

  describe '#percentage_of_times_worked_out' do 
    it 'can show the number of times worked out from all wjs and posts' do 
      joey = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
      jon = User.create(first_name: "Jon", last_name: "Jay", birth_date: "2016-04-16", email: "jon@jayy.com", password: "abc123", password_confirmation: "abc123")
      wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
      wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
      wj3 = WeightJournal.create(title: "Third Journal", user_id: 2, start_date: "2016-04-14", final_weigh_in_date: "2016-10-20", starting_weight: 201, weight_goal: 190)
      working = Workout.create(workout_type: "swimming")
      feeling = Feeling.create(feeling: "amazing!")
      p1 = Post.create(entry_date: "2016-03-24", current_weight: 210, worked_out: true, motivation_level: 1, weight_journal_id: 1, notes: "yeehaw!", feeling_ids: [1], workout_ids: [1])
      p2 = Post.create(entry_date: "2016-03-26", current_weight: 208, worked_out: false, motivation_level: 2, weight_journal_id: 1, notes: "huzzah!", feeling_ids: [1])
      p3 = Post.create(entry_date: "2016-03-25", current_weight: 206, worked_out: true, motivation_level: 3, weight_journal_id: 1, notes: "meow!", feeling_ids: [1], workout_ids: [1])
      p4 = Post.create(entry_date: "2016-03-27", current_weight: 205, worked_out: true, motivation_level: 7, weight_journal_id: 1, notes: "meep!", feeling_ids: [1], workout_ids: [1])
      p5 = Post.create(entry_date: "2016-03-27", current_weight: 205, worked_out: true, motivation_level: 7, weight_journal_id: 3, notes: "meep!", feeling_ids: [1], workout_ids: [1])
      expect(joey.percentage_of_times_worked_out).to eq(0.75)
    end
  end

  describe 'class methods' do 
    describe '.all_active_journals' do 
      it 'can show all active journals' do
        joey = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
        jon = User.create(first_name: "Jon", last_name: "Jay", birth_date: "2016-04-16", email: "jon@jayy.com", password: "abc123", password_confirmation: "abc123")
        wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
        wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
        wj3 = WeightJournal.create(title: "Third Journal", user_id: 2, start_date: "2016-04-14", final_weigh_in_date: "2016-10-20", starting_weight: 201, weight_goal: 190)
        wj4 = WeightJournal.create(title: "Fourth Journal", user_id: 2, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
        expect(User.all_active_journals.count).to eq(2) 
      end
    end

    describe '.all_completed_journals' do 
      it 'can show all completed journals' do
        joey = User.create(first_name: "Joey", last_name: "Chuckles", birth_date: "2016-04-26", email: "joey@chuckles.com", password: "abc123", password_confirmation: "abc123")
        jon = User.create(first_name: "Jon", last_name: "Jay", birth_date: "2016-04-16", email: "jon@jayy.com", password: "abc123", password_confirmation: "abc123")
        wj1 = WeightJournal.create(title: "First Journal", user_id: 1, start_date: "2016-04-24", final_weigh_in_date: "2016-05-10", starting_weight: 221, weight_goal: 200)
        wj2 = WeightJournal.create(title: "Second Journal", user_id: 1, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
        wj3 = WeightJournal.create(title: "Third Journal", user_id: 2, start_date: "2016-04-14", final_weigh_in_date: "2016-10-20", starting_weight: 201, weight_goal: 190)
        wj4 = WeightJournal.create(title: "Fourth Journal", user_id: 2, start_date: "2016-04-14", final_weigh_in_date: "2016-04-20", starting_weight: 201, weight_goal: 190)
        expect(User.all_completed_journals.count).to eq(2) 
      end
    end
  
  end 



end
