class PostsController < ApplicationController
  before_filter :authorize

  def index
    @posts = Post.all
    @weight_journal = WeightJournal.find(params["weight_journal_id"])
    @user = User.find(session[:user_id])
    @user_posts = @posts.select do |post|
        post.weight_journal_id == @weight_journal.id
      end
  end

  def new
    @weight_journal = WeightJournal.find(params["weight_journal_id"])
    @user = User.find("#{@weight_journal.user_id}")
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @weight_journal = WeightJournal.find(params["weight_journal_id"])
    @weight_journal.posts << @post 
      if @post.save
        redirect_to weight_journal_post_path(@weight_journal, @post)
        #redirect_to([@weight_journal, @post])
      else 
        render :new
      end
  end

  def show
    @post = Post.find(params[:id])
    @weight_journal = WeightJournal.find(params["weight_journal_id"])
    @user = User.find("#{@weight_journal.user_id}")
    # @course = WeightJournal.find(params["weight_journal_id"]).find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @weight_journal = WeightJournal.find(params["weight_journal_id"])
  end

  def update 
    @post = Post.find(params[:id])
    @weight_journal = WeightJournal.find(params["weight_journal_id"])
    if @post.update(post_params)
      redirect_to weight_journal_post_path(@weight_journal, @post)
    else
      render :edit
    end
  end

  def destroy
  end

  #HELPER METHODS


  def find_post
    @post = Post.find(params[:id])
  end

  private 

  def post_params
    params.require(:post).permit(:entry_date, :current_weight, :worked_out, :motivation_level, :notes, workout_ids: [], feeling_ids: [])
  end

  # def wj_params 
  #   params.permit(:weight_journal_id)
  # end



end
