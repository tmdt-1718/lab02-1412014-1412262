class SessionsController < ApplicationController
	def new
		render layout:false
	end

	

	def create
		begin

			user = User.authenticate!(session_params)
			if(user != false)
				login(user)
				redirect_to receivefrom_path
			else
				flash[:error] = "Wrong email or password."
				redirect_to request.referrer
			end
		rescue ActiveRecord::RecordNotFound => e
				flash[:error] = "Wrong email or password."
				render :new
		end
	end

	def destroy
			logout
			
			redirect_to login_path
	end

	private
	def session_params
		params.require(:session).permit(:email, :password)

	end
end
