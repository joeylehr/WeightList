class UsersController < ApplicationController
  before_filter :authorize, only: [:show, :edit, :update]

  def new
    @user = User.new
  end 

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end 

  def show 
    # wj = WeightJournal.find(params[:id]) -- striked out
    @user = User.find(params[:id])
  end 

  def edit
    find_user
  end

  def update
    find_user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  
  # HELPER METHODS

  def find_user
    @user = User.find(params[:id])
  end


  # PRIVATE METHODS

  private

  def index
    @users = User.all
  end 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birth_date, :email, :password, :password_confirmation)
  end


end
