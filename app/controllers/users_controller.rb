class UsersController < ApplicationController
	 def new
    render layout:false
  end

  def index
    @users = User.all
    render layout:false
  end

  def create
  	begin
  		user = User.create!(user_params)
  		flash[:success] = "Register successfully."
  		redirect_to users_path	
  	rescue ActiveRecord::RecordInvalid => e
  		flash[:error] = "Cannot register new account."
  		render :new
  	end
  end

  def makerelation

  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
end
