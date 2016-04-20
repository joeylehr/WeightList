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
    @wj_posts = @weight_journal.array_all_posts_of_a_weightjournal
    @arr_workouts = @weight_journal.array_of_workouts(@wj_posts)
    @most_pop_workout =  @weight_journal.most_popular_exercise_per_weight_journal(@arr_workouts).compact
  end

  def edit
    find_weight_journal
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

  #HELPER METHODS


  def find_weight_journal
    @weight_journal = WeightJournal.find(params[:id])
  end

  private 

  def wj_params
    params.require(:weight_journal).permit(:title, :start_date, :starting_weight, :final_weigh_in_date, :weight_goal)
  end

end
