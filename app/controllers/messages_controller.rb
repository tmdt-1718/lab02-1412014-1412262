class MessagesController < ApplicationController
	before_action :authenticate
	def index
		
	end

	def new
	end

	def show
		rmessage =  Rmessage.find(params[:id])
		if rmessage.readed
			 redirect_to messages_path
		else
			rmessage.readed = true
			rmessage.save
			@message = Message.find(rmessage.message_id)

		end
		
	end

	def destroy
		
	end

	def edit
		
	end

	def update
	end

	def receivefrom
		
		@rms = User.find(session[:current_user_id]).rmessages
		@rms.each do |rm|
			id =  rm.message_id
			messsage = Message.find(id)

			class << rm
		 		 attr_accessor :body
		 		  attr_accessor :sender

			end

			rm.body = messsage.body.from(0).to(5)
			rm.sender = messsage.smessage.user.email
		end
		@rmss = @rms.sort{ |b,a| a.created_at <=> b.created_at }
		logger.debug @rmss
	end

	def sendto
		
	end
	
end
