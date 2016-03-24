# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# #
# # Examples:
# #
# #   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
# #   Mayor.create(name: 'Emanuel', city: cities.first)



#   # create_table "posts", force: :cascade do |t|
#   #   t.date     "entry_date"
#   #   t.integer  "current_weight"
#   #   t.boolean  "worked_out?"
#   #   t.integer  "motivation_level"
#   #   t.integer  "weight_journal_id"
#   #   t.datetime "created_at",        null: false
#   #   t.datetime "updated_at",        null: false
#   # end

# joe = User.create(first_name: "Joe", last_name: "Meow", birth_date: "10-02-1986")
# bob = User.create(first_name: "Bob", last_name: "Smith", birth_date: "01-02-1971")
# jon = User.create(first_name: "Jon", last_name: "Meow", birth_date: "03-02-1956")
# bruce = User.create(first_name: "Bruce", last_name: "Meow", birth_date: "07-02-1981")
# mimi = User.create(first_name: "Mimi", last_name: "Meow", birth_date: "09-02-1981")

# j1 = joe.weight_journals << WeightJournal.create(title: "Joe's Journey To Loosing Weight", starting_weight: 230, weight_goal: 220, final_weigh_in_date: "2016-03-20", start_date: "2016-03-17")
# j2 = bob.weight_journals << WeightJournal.create(title: "Bobby Looses A Shit Ton of Weight", starting_weight: 400, weight_goal: 275, final_weigh_in_date: "2016-03-20", start_date: "2016-03-17")
# j3 = jon.weight_journals << WeightJournal.create(title: "Jon Subtracts Weight", starting_weight: 130, weight_goal: 100, final_weigh_in_date: "2016-03-24", start_date: "2016-03-21")
# j4 = bruce.weight_journals << WeightJournal.create(title: "Bruce Brooklyn Diet", starting_weight: 260, weight_goal: 178, final_weigh_in_date: "2016-03-24", start_date: "2016-03-21")
# j5 = mimi.weight_journals << WeightJournal.create(title: "Mimi's judge diet", starting_weight: 139, weight_goal: 185, final_weigh_in_date: "2016-03-24", start_date: "2016-03-21")
# j6 = joe.weight_journals << WeightJournal.create(title: "My Second Journey", starting_weight: 219, weight_goal: 200, final_weigh_in_date: "2016-04-15", start_date: "2016-03-20")
# j7 = joe.weight_journals << WeightJournal.create(title: "My Third Journey", starting_weight: 200, weight_goal: 195, final_weigh_in_date: "2016-03-25", start_date: "2016-03-20")

# # Post.create(entry_date: "2016-03-17", current_weight: 229, worked_out: true, motivation_level: 4, weight_journal_id: 1, notes: "Day 1 was tough")
# # Post.create(entry_date: "2016-03-18", current_weight: 225, worked_out: false, motivation_level: 8, weight_journal_id: 1, notes: "Day 2 was nice")
# # Post.create(entry_date: "2016-03-19", current_weight: 221, worked_out: true, motivation_level: 1, weight_journal_id: 1, notes: "Day 3 wasn't bad")
# # Post.create(entry_date: "2016-03-20", current_weight: 220, worked_out: false, motivation_level: 10, weight_journal_id: 1, notes: "Day 4 was ok")

# Post.create(entry_date: "2016-03-17", current_weight: 229, worked_out: true, motivation_level: 4, weight_journal_id: 1, notes: "Day 1 was tough")
# Post.create(entry_date: "2016-03-18", current_weight: 225, worked_out: true, motivation_level: 8, weight_journal_id: 1, notes: "Day 2 was nice")
# Post.create(entry_date: "2016-03-19", current_weight: 221, worked_out: true, motivation_level: 1, weight_journal_id: 1, notes: "Day 3 wasn't bad")
# Post.create(entry_date: "2016-03-20", current_weight: 220, worked_out: true, motivation_level: 10, weight_journal_id: 1, notes: "Day 4 was ok")

# Post.create(entry_date: "2016-03-17", current_weight: 400, worked_out: true, motivation_level: 4, weight_journal_id: 2, notes: "Day 1 was tough")
# Post.create(entry_date: "2016-03-18", current_weight: 399, worked_out: false, motivation_level: 8, weight_journal_id: 2, notes: "Day 2 was nice")
# Post.create(entry_date: "2016-03-19", current_weight: 401, worked_out: true, motivation_level: 1, weight_journal_id: 2, notes: "Day 3 wasn't bad")
# Post.create(entry_date: "2016-03-20", current_weight: 395, worked_out: false, motivation_level: 10, weight_journal_id: 2, notes: "Day 4 was ok")

# Post.create(entry_date: "2016-03-21", current_weight: 130, worked_out: true, motivation_level: 4, weight_journal_id: 3, notes: "Day 1 was tough")
# Post.create(entry_date: "2016-03-22", current_weight: 129, worked_out: false, motivation_level: 8, weight_journal_id: 3, notes: "Day 2 was nice")
# Post.create(entry_date: "2016-03-23", current_weight: 125, worked_out: true, motivation_level: 1, weight_journal_id: 3, notes: "Day 3 wasn't bad")
# Post.create(entry_date: "2016-03-24", current_weight: 126, worked_out: false, motivation_level: 10, weight_journal_id:3, notes: "Day 4 was ok")

# Post.create(entry_date: "2016-03-21", current_weight: 260, worked_out: true, motivation_level: 4, weight_journal_id: 4, notes: "Day 1 was tough")
# Post.create(entry_date: "2016-03-22", current_weight: 255, worked_out: false, motivation_level: 8, weight_journal_id: 4, notes: "Day 2 was nice")
# Post.create(entry_date: "2016-03-23", current_weight: 251, worked_out: true, motivation_level: 1, weight_journal_id: 4, notes: "Day 3 wasn't bad")
# Post.create(entry_date: "2016-03-24", current_weight: 249, worked_out: false, motivation_level: 10, weight_journal_id: 4, notes: "Day 4 was ok")

# Post.create(entry_date: "2016-03-21", current_weight: 139, worked_out: true, motivation_level: 4, weight_journal_id: 5, notes: "Day 1 was tough")
# Post.create(entry_date: "2016-03-22", current_weight: 138, worked_out: false, motivation_level: 8, weight_journal_id: 5, notes: "Day 2 was nice")
# Post.create(entry_date: "2016-03-23", current_weight: 134, worked_out: true, motivation_level: 1, weight_journal_id: 5, notes: "Day 3 wasn't bad")
# Post.create(entry_date: "2016-03-24", current_weight: 133, worked_out: false, motivation_level: 10, weight_journal_id: 5, notes: "Day 4 was ok")

# Post.create(entry_date: "2016-03-20", current_weight: 219, worked_out: true, motivation_level: 4, weight_journal_id: 6, notes: "Day 1 was tough")
# Post.create(entry_date: "2016-03-21", current_weight: 215, worked_out: false, motivation_level: 8, weight_journal_id: 6, notes: "Day 2 was nice")

# Post.create(entry_date: "2016-03-22", current_weight: 219, worked_out: true, motivation_level: 4, weight_journal_id: 7, notes: "Day 1 was tough")
# Post.create(entry_date: "2016-03-23", current_weight: 215, worked_out: false, motivation_level: 8, weight_journal_id: 7, notes: "Day 2 was nice")


Workout.create(workout_type: "weightlifting")
Workout.create(workout_type: "running")
Workout.create(workout_type: "yoga")
Workout.create(workout_type: "cardio barre")
Workout.create(workout_type: "pilates")
Workout.create(workout_type: "crossfit")
Workout.create(workout_type: "swimming")
Workout.create(workout_type: "cycling")
Workout.create(workout_type: "other")

Feeling.create(feeling: "fantastic!!")
Feeling.create(feeling: "energized")
Feeling.create(feeling: "excited")
Feeling.create(feeling: "confident")
Feeling.create(feeling: "exhausted")
Feeling.create(feeling: "i hate dieting!")
Feeling.create(feeling: "sleepy")
Feeling.create(feeling: "beat up")
Feeling.create(feeling: "down")
Feeling.create(feeling: "is it Cheat Day yet?!")

# ## WORKOUTS

# PostWorkout.create(post_id: 1, workout_id: 1)
# PostWorkout.create(post_id: 1, workout_id: 1)
# PostWorkout.create(post_id: 2, workout_id: 1)
# PostWorkout.create(post_id: 2, workout_id: 1)
# PostWorkout.create(post_id: 3, workout_id: 5)
# PostWorkout.create(post_id: 3, workout_id: 5)
# PostWorkout.create(post_id: 4, workout_id: 7)

# PostWorkout.create(post_id: 5, workout_id: 5)
# PostWorkout.create(post_id: 6, workout_id: 6)
# PostWorkout.create(post_id: 7, workout_id: 7)
# PostWorkout.create(post_id: 5, workout_id: 1)
# PostWorkout.create(post_id: 6, workout_id: 2)
# PostWorkout.create(post_id: 7, workout_id: 3)


# PostWorkout.create(post_id: 8, workout_id: 5)
# PostWorkout.create(post_id: 9, workout_id: 6)
# PostWorkout.create(post_id: 10, workout_id: 7)
# PostWorkout.create(post_id: 8, workout_id: 1)
# PostWorkout.create(post_id: 9, workout_id: 2)
# PostWorkout.create(post_id: 10, workout_id: 3)

# PostWorkout.create(post_id: 11, workout_id: 5)
# PostWorkout.create(post_id: 12, workout_id: 6)
# PostWorkout.create(post_id: 13, workout_id: 7)
# PostWorkout.create(post_id: 11, workout_id: 1)
# PostWorkout.create(post_id: 12, workout_id: 2)
# PostWorkout.create(post_id: 13, workout_id: 3)

# PostWorkout.create(post_id: 14, workout_id: 5)
# PostWorkout.create(post_id: 15, workout_id: 6)
# PostWorkout.create(post_id: 16, workout_id: 7)
# PostWorkout.create(post_id: 14, workout_id: 1)
# PostWorkout.create(post_id: 15, workout_id: 2)
# PostWorkout.create(post_id: 16, workout_id: 3)

# PostWorkout.create(post_id: 17, workout_id: 5)
# PostWorkout.create(post_id: 18, workout_id: 6)
# PostWorkout.create(post_id: 19, workout_id: 7)
# PostWorkout.create(post_id: 20, workout_id: 1)
# PostWorkout.create(post_id: 21, workout_id: 2)
# PostWorkout.create(post_id: 22, workout_id: 3)

# PostWorkout.create(post_id: 23, workout_id: 5)
# PostWorkout.create(post_id: 24, workout_id: 6)
# PostWorkout.create(post_id: 25, workout_id: 7)
# PostWorkout.create(post_id: 26, workout_id: 1)
# PostWorkout.create(post_id: 26, workout_id: 2)
# PostWorkout.create(post_id: 26, workout_id: 3)


# ## FEELINGS

# PostFeeling.create(post_id: 1, feeling_id: 1)
# PostFeeling.create(post_id: 1, feeling_id: 2)
# PostFeeling.create(post_id: 2, feeling_id: 3)
# PostFeeling.create(post_id: 2, feeling_id: 4)
# PostFeeling.create(post_id: 3, feeling_id: 5)
# PostFeeling.create(post_id: 3, feeling_id: 6)
# PostFeeling.create(post_id: 4, feeling_id: 6)

# PostFeeling.create(post_id: 5, feeling_id: 5)
# PostFeeling.create(post_id: 6, feeling_id: 6)
# PostFeeling.create(post_id: 7, feeling_id: 7)
# PostFeeling.create(post_id: 5, feeling_id: 1)
# PostFeeling.create(post_id: 6, feeling_id: 2)
# PostFeeling.create(post_id: 7, feeling_id: 3)


# PostFeeling.create(post_id: 8, feeling_id: 5)
# PostFeeling.create(post_id: 9, feeling_id: 6)
# PostFeeling.create(post_id: 10, feeling_id: 7)
# PostFeeling.create(post_id: 8, feeling_id: 1)
# PostFeeling.create(post_id: 9, feeling_id: 2)
# PostFeeling.create(post_id: 10, feeling_id: 3)

# PostFeeling.create(post_id: 11, feeling_id: 5)
# PostFeeling.create(post_id: 12, feeling_id: 6)
# PostFeeling.create(post_id: 13, feeling_id: 7)
# PostFeeling.create(post_id: 11, feeling_id: 1)
# PostFeeling.create(post_id: 12, feeling_id: 2)
# PostFeeling.create(post_id: 13, feeling_id: 3)

# PostFeeling.create(post_id: 14, feeling_id: 5)
# PostFeeling.create(post_id: 15, feeling_id: 6)
# PostFeeling.create(post_id: 16, feeling_id: 7)
# PostFeeling.create(post_id: 14, feeling_id: 1)
# PostFeeling.create(post_id: 15, feeling_id: 2)
# PostFeeling.create(post_id: 16, feeling_id: 3)

# PostFeeling.create(post_id: 17, feeling_id: 5)
# PostFeeling.create(post_id: 18, feeling_id: 6)
# PostFeeling.create(post_id: 19, feeling_id: 7)
# PostFeeling.create(post_id: 20, feeling_id: 1)
# PostFeeling.create(post_id: 21, feeling_id: 2)
# PostFeeling.create(post_id: 22, feeling_id: 3)

# PostFeeling.create(post_id: 23, feeling_id: 5)
# PostFeeling.create(post_id: 24, feeling_id: 6)
# PostFeeling.create(post_id: 25, feeling_id: 7)
# PostFeeling.create(post_id: 26, feeling_id: 1)
# PostFeeling.create(post_id: 26, feeling_id: 2)
# PostFeeling.create(post_id: 26, feeling_id: 3)
