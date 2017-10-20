class MessagesController < ApplicationController
	before_action :authenticate
	def index
		
	end

	def new
		@friends = User.find(session[:current_user_id]).users
		@activeleftmenuitem = 1;
	end
	def create
		begin
			if(message_params[:friend_id].to_s == "")
				flash[:notice] = "Cannot send this message"
			else
				
				@m = Message.create(body: message_params[:body])
				Smessage.create(user_id: session[:current_user_id] , message_id: @m.id)
				Rmessage.create(user_id: message_params[:friend_id], message_id: @m.id, readed: false)
				flash[:notice] = "Successfully send..."
				redirect_to sendto_path
			end

			
		 rescue ActiveRecord::RecordInvalid => e
			flash[:error] = "Cannot send this message"
			redirect_to new_message_path
		end
		
		
	end

	def show
		
		
	end

	def showreceivefrom
		rmessage =  Rmessage.find(params[:id])
		if rmessage.readed
			 redirect_to receivefrom_path
		else
			rmessage.readed = true
			rmessage.save
			@message = Message.find(rmessage.message_id)

		end
	end

	def showsendto
		smessage =  Smessage.find(params[:id])
		@message = Message.find(smessage.message_id)
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
		@activeleftmenuitem = 2
	end

	def sendto
		@sms = User.find(session[:current_user_id]).smessages
		@sms.each do |sm|
			id =  sm.message_id
			messsage = Message.find(id)

			class << sm
		 		 attr_accessor :body
		 		  attr_accessor :receiver
		 		  attr_accessor :timereadedbyreceiver
			end

			sm.body = messsage.body.from(0).to(5)
			sm.receiver = messsage.rmessage.user.email
			if(messsage.rmessage.updated_at.to_datetime == messsage.rmessage.created_at.to_datetime )
				sm.timereadedbyreceiver = "Not Read"
			else
				sm.timereadedbyreceiver = messsage.rmessage.updated_at
			end

			
		end
		@smss = @sms.sort{ |b,a| a.created_at <=> b.created_at }
		@activeleftmenuitem = 3
	end

	private
	def message_params
	  	params.require(:message).permit(:friend_id, :body)
	end
	
end
