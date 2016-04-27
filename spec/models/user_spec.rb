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
      completed_journals = all_wjs.select {|wj| wj.final_weigh_in_date < (Date.today + 1)}
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
      active_journals = all_wjs.reject {|wj| wj.final_weigh_in_date < (Date.today + 1)}
      expect(active_journals.count).to eq(1) 
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
        all_wjs = User.all.map {|user| user.weight_journals}
        all_active_journals = all_wjs.flatten.reject {|wj| wj.final_weigh_in_date < (Date.today + 1)}
        expect(all_active_journals.count).to eq(2) 
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
        all_wjs = User.all.map {|user| user.weight_journals}
        all_completed_journals = all_wjs.flatten.select {|wj| wj.final_weigh_in_date < (Date.today + 1)}
        expect(all_completed_journals.count).to eq(2) 
      end
    end


  end 



end
