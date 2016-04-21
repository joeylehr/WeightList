class WeightJournalsController < ApplicationController
  before_filter :authorize

  def new
    @weight_journal = WeightJournal.new
  end

  def create
    @user = User.find(session[:user_id])
    @weight_journal = WeightJournal.create(wj_params)
    @user.weight_journals << @weight_journal
      if @weight_journal.save
        redirect_to @weight_journal
      else
        render :new
      end
  end

  def show
    @weight_journal = WeightJournal.find(params[:id])
    @arr_workouts = @weight_journal.array_of_workouts
    @most_popular_exercise = @weight_journal.most_popular_exercise
    @arr_feelings = @weight_journal.array_of_feelings
    @most_popular_feeling = @weight_journal.most_popular_feeling
    @most_recent_weight = @weight_journal.most_recent_weight
  end

  def edit
    @weight_journal = WeightJournal.find(params[:id])
  end

  def update 
    find_weight_journal
    if @weight_journal.update(wj_params)
      redirect_to @weight_journal
    else
      render :edit
    end
  end

  def destroy
  end

  private 

  def wj_params
    params.require(:weight_journal).permit(:title, :start_date, :starting_weight, :final_weigh_in_date, :weight_goal)
  end

end
