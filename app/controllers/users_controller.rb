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

  def getrequest
    begin
      @user = User.find_by email: request_param[:email]
      if(@user.present?)
        @valid = RelationshipRequest.find_by receiver: @user.id, user_id: session[:current_user_id]
        if @valid.present?
          logger.debug "Da co trong danh sach yeu cau"
          flash[:error] = "Da co trong danh sach yeu cau"
        else
          @u = @user.users.find_by(id: session[:current_user_id])
         
          if(@u.present?)
              flash[:error] = "Da co trong danh sach ban be"

          else 
           
            relate = RelationshipRequest.create!(receiver: @user.id, user_id: session[:current_user_id])
            flash[:success] = "Send request successfully."
          end
         
        end
      else
        flash[:error] = "Khong co nguoi nay"
      end
    rescue ActiveRecord::RecordInvalid => e
      flash[:error] = "Cannot register new account."

    end
    redirect_to request.referrer
  end

  def requestsindex
    @users = RelationshipRequest.where("receiver = ?", session[:current_user_id])
    @activeleftmenuitem = 4
  end

  def acceptrequest
    # This is a comment 

    @request = RelationshipRequest.find_by receiver: session[:current_user_id] , user_id: params[:id]
    if @request.present?
      @request.destroy
      user1 = User.find(session[:current_user_id])
      user2 = User.find(params[:id])
      user1.users.push(user2)
      user2.users.push(user1)
      redirect_to requests_path
    else
      flash[:error] = "Khong the thiet lap moi quan he"
    end
  end

  def listfriends
    @friends = User.find(session[:current_user_id]).users
    @activeleftmenuitem = 5
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
  def request_param
    params.require(:user).permit(:email)
  end
end
